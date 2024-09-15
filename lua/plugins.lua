-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- LSP
	use "neovim/nvim-lspconfig"
	use {"hrsh7th/nvim-cmp",
		requires = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-cmdline' },
			{ 'hrsh7th/nvim-cmp' },
		}
	}

	-- debugging
	use {
		'jayp0521/mason-nvim-dap.nvim',
		requires = {
			'mfussenegger/nvim-dap',
			'rcarriga/nvim-dap-ui',
		}
	}

	--YAML support
	use {
		'someone-stole-my-name/yaml-companion.nvim',
		requires = {
			{ 'neovim/nvim-lspconfig' },
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope.nvim' },
		},
	}


	-- neotree
	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v3.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
			'MunifTanjim/nui.nvim',
		}
	}
	--
	-- fugitive
	use 'tpope/vim-fugitive'
	--

	-- catpucin theme
	use { 'catppuccin/nvim', as = 'catppuccin' }
	--
	-- status bar
	use({
		'NTBBloodbath/galaxyline.nvim',
		-- some optional icons
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	})

	-- telescope -- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-ui-select.nvim',
			'nvim-telescope/telescope-symbols.nvim',
		},
		run="make"
	}

	--
	-- treesitter
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/playground'
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	--

	use 'hiphish/rainbow-delimiters.nvim'

	--
	-- convenient search result hopping 
	use 'kevinhwang91/nvim-hlslens'

	-- Lua

	-- harpoon used to mark and switch between files (bookmarks)
	use {
		'ThePrimeagen/harpoon',
		branch="harpoon2",
		requres = 'nvim-lua/plenary.nvim',
	}
	--

	--windows min/max with animation
	use {
		'anuvyklack/windows.nvim',
		requires = {
			'anuvyklack/middleclass',
			'anuvyklack/animation.nvim'
		},
	}

	-- show function signature as you type
	use 'ray-x/lsp_signature.nvim'
	--
	-- move blocks vertically
	use 'fedepujol/move.nvim'

	--
	use {
		'nvim-neotest/neotest',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
			'antoinemadec/FixCursorHold.nvim',
			'nvim-neotest/neotest-plenary',
			'nvim-neotest/neotest-python',
			'nvim-neotest/neotest-go',
			'nvim-neotest/nvim-nio'
		}
	}

	use {
		'mfussenegger/nvim-dap-python',
		requires = {
			'mfussenegger/nvim-dap'
		}
	}

	use 'leoluz/nvim-dap-go'

	-- LSP support for vim configs
	-- TODO: switch to https://github.com/folke/lazydev.nvim
	use "folke/neodev.nvim"

	-- comment lines/blocks
	use 'numToStr/Comment.nvim'

	-- java support
	use 'mfussenegger/nvim-jdtls'
	--

	use 'chaoren/vim-wordmotion';

	--
	use {
		'weilbith/nvim-code-action-menu',
		cmd = 'CodeActionMenu'
	}
	--
	use 'mikelue/vim-maven-plugin'
	use 'ggandor/leap.nvim'
	--
	-- Stop switching to English to move
	use 'ivanesmantovich/xkbswitch.nvim'

	use {'akinsho/git-conflict.nvim', tag = "*"}

	use 'braxtons12/blame_line.nvim'

	use 'folke/which-key.nvim'

end)


