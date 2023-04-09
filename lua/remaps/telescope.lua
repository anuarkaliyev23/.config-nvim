local builtin = require('telescope.builtin')
-- builtin
--
-- Find Files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- Grep String
vim.keymap.set('n', '<leader>gs', builtin.grep_string, {})
-- Keymaps
vim.keymap.set('n', '<leader>km', builtin.keymaps, {})

-- LSP references
--
-- Find Usages
vim.keymap.set('n', '<leader>fu', builtin.lsp_references, {})
-- Find Implementations
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})


-- Git
-- 
-- Git Files
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
-- git commits 
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})


-- TreeSitter
--
-- tree sitter
vim.keymap.set('n', '<leader>ts', builtin.treesitter, {})


-- Bufffer
vim.keymap.set('n','<leader>bf', builtin.buffers, {})
