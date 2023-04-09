-- mkdir '~/jdtls_workspace/'
-- This folder MUST BE on the ../ related to project file 
-- I don't know why, was following hint from <https://www.reddit.com/r/neovim/comments/z3hc4y/comment/ixls3bb/?utm_source=share&utm_medium=web2x&context=3>
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '../jdtls_workspace/' .. project_name

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    'java', -- or '/path/to/java17_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.

	'-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
	'-jar',
		'/Library/Java/jdt-language-server-1.20.0-202302201605/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
    -- 💀
    '-configuration',
		'/Library/Java/jdt-language-server-1.20.0-202302201605/config_mac/',
    -- See `data directory configuration` section in the README
    '-data',
		workspace_dir,
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
		home = "/Users/dusaliyev/.sdkman/candidates/java/current/bin/java",
		 import = {
            gradle = {
            	enabled = true
            },
            maven = {
                enabled = true
            },
		},
		signatureHelp = {
        	enabled = false
        },
		completion = {
        	favoriteStaticMembers = {
                "org.junit.Assert.*",
				"org.junit.Assume.*",
                "org.junit.jupiter.api.Assertions.*",
                "org.junit.jupiter.api.Assumptions.*",
                "org.junit.jupiter.api.DynamicContainer.*",
                "org.junit.jupiter.api.DynamicTest.*"
            },
			importOrder = {
                "java",
                "javax",
                "com",
                "org"
            }
        }
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {
		"/Library/Java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.44.0.jar"
	}
  },

}

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation)
	vim.keymap.set('n', 'go', vim.lsp.buf.type_definition)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
	vim.keymap.set('n', '<F2>', vim.lsp.buf.rename)
	vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, {buffer = true})
	vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
	vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
	vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

	require('jdtls').setup_dap({ hotcodereplace = 'auto' })
end

config['on_attach'] = lsp_attach
config['capabilities'] = lsp_capabilities

-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)

vim.keymap.set('n', '<A-o>', function ()
	require('jdtls').organize_imports()
end)


vim.keymap.set('n', 'crv', function ()
	require('jdtls').extract_variable()
end)

vim.keymap.set('v', 'crv', function ()
	require('jdtls').extract_variable(true)
end)

vim.keymap.set('n', 'crc', require('jdtls').extract_constant)

vim.keymap.set('v', 'crc', function ()
	require('jdtls').extract_constant(true)
end)

vim.keymap.set('v', 'crm', function ()
	require('jdtls').extract_method(true)
end)


-- If using nvim-dap
-- This requires java-debug and vscode-java-test bundles, see install steps in this README further below.
vim.keymap.set('n', '<leader>df',require('jdtls').test_class)
vim.keymap.set('n', '<leader>dn', require('jdtls').test_nearest_method)
