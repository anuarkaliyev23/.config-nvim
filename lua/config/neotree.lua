-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
{text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
{text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
{text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
{text = "", texthl = "DiagnosticSignHint"})
-- NOTE: this is changed from v1.x, which used the old style of highlight groups
-- in the form "LspDiagnosticsSignWarning"

require("neo-tree").setup({
	close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
	popup_border_style = "rounded",
	enable_git_status = true,
	enable_diagnostics = true,
	sort_case_insensitive = false, -- used when sorting files and directories in the tree
	sort_function = nil , -- use a custom function for sorting files and directories in the tree 
	default_component_configs = {
	  container = {
		enable_character_fade = true
	  },
	  indent = {
		indent_size = 2,
		padding = 1, -- extra padding on left hand side
		-- indent guides
		with_markers = true,
		indent_marker = "│",
		last_indent_marker = "└",
		highlight = "NeoTreeIndentMarker",
		-- expander config, needed for nesting files
		with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
		expander_collapsed = "",
		expander_expanded = "",
		expander_highlight = "NeoTreeExpander",
	  },
	  icon = {
		folder_closed = "",
		folder_open = "",
		folder_empty = "ﰊ",
		-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
		-- then these will never be used.
		default = "*",
		highlight = "NeoTreeFileIcon"
	  },
	  modified = {
		symbol = "[+]",
		highlight = "NeoTreeModified",
	  },
	  name = {
		trailing_slash = false,
		use_git_status_colors = true,
		highlight = "NeoTreeFileName",
	  },
	  git_status = {
		symbols = {
		  -- Change type
		  added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
		  modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
		  deleted   = "✖",-- this can only be used in the git_status source
		  renamed   = "",-- this can only be used in the git_status source
		  -- Status type
		  untracked = "",
		  ignored   = "",
		  unstaged  = "",
		  staged    = "",
		  conflict  = "",
		}
	  },
	},
	window = {
	  position = "left",
	  width = 40,
	  mapping_options = {
		noremap = true,
		nowait = true,
	  },
	  mappings = {
		["<space>"] = { 
			"toggle_node", 
			nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use 
		},
		["<2-LeftMouse>"] = "open",
		["<cr>"] = "open",
		["<esc>"] = "revert_preview",
		["P"] = { "toggle_preview", config = { use_float = true } },
		["S"] = "open_split",
		["s"] = "open_vsplit",
		-- ["S"] = "split_with_window_picker",
		-- ["s"] = "vsplit_with_window_picker",
		["t"] = "open_tabnew",
		-- ["<cr>"] = "open_drop",
		-- ["t"] = "open_tab_drop",
		["w"] = "open_with_window_picker",
		--["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
		["C"] = "close_node",
		["z"] = "close_all_nodes",
		--["Z"] = "expand_all_nodes",
		["a"] = { 
		  "add",
		  -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
		  -- some commands may take optional config options, see `:h neo-tree-mappings` for details
		  config = {
			show_path = "none" -- "none", "relative", "absolute"
		  }
		},
		["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
		["d"] = "delete",
		["r"] = "rename",
		["y"] = "copy_to_clipboard",
		["x"] = "cut_to_clipboard",
		["p"] = "paste_from_clipboard",
		["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
		-- ["c"] = {
		--  "copy",
		--  config = {
		--    show_path = "none" -- "none", "relative", "absolute"
		--  }
		--}
		["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
		["q"] = "close_window",
		["R"] = "refresh",
		["?"] = "show_help",
		["<"] = "prev_source",
		[">"] = "next_source",
	  }
	},
	filesystem = {
		filtered_items = {
			visible = false,
			hide_dotfiles = false,
			hide_gitignored = false,
			always_show = {
				".gitignore"
			},
			never_show = {
				".DS_Store"
			}
		},
		follow_current_file = true,
		group_empty_dirs = false,
		hijack_netrw_behavior = "disabled", -- left alone netrw. Useful when accessing via scp://
		use_libuv_file_watcher = true, -- rely on OS file watcher to not update manually
	}
})
