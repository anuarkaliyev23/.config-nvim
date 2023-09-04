-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- LSP Zero
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			--Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
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
	use 'HiPhish/debugpy.nvim'

	--YAML support
	use {
		'someone-stole-my-name/yaml-companion.nvim',
		requires = {
			{ 'neovim/nvim-lspconfig' },
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope.nvim' },
		},
	}
	-- interactive scrollbar
	use 'dstein64/nvim-scrollview'
	--
	-- neotree
	use {
		'nvim-neo-tree/neo-tree.nvim',
		branch = 'v2.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
			'MunifTanjim/nui.nvim',
		}
	}
	--
	-- nightfox theme
	use 'EdenEast/nightfox.nvim'
	-- tokyonight theme
	use 'folke/tokyonight.nvim'
	-- lazygit
	use 'kdheepak/lazygit.nvim'
	-- fugitive
	use 'tpope/vim-fugitive'
	--
	-- git-messenger 
	-- show git message in hover window
	use 'rhysd/git-messenger.vim'
	--
	-- gitsigns
	use 'lewis6991/gitsigns.nvim'
	--
	-- catpucin theme
	use { 'catppuccin/nvim', as = 'catppuccin' }
	--
	-- icons
	use 'nvim-tree/nvim-web-devicons'
	--
	-- status bar
	use({
		'NTBBloodbath/galaxyline.nvim',
		-- some optional icons
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	})
	--
	-- telescope -- fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		requires = { 
			'nvim-lua/plenary.nvim', 
			'nvim-telescope/telescope-ui-select.nvim' 
		}
	}

	use {

		'nvim-telescope/telescope-media-files.nvim',
		requires = {
			'nvim-lua/popup.nvim',
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim'
		}
	}

	use {
		'nvim-telescope/telescope-symbols.nvim',
		requires = {
			'nvim-telescope/telescope.nvim'
		}
	}

	use {
		'renerocksai/telekasten.nvim',
		requires = {
			'nvim-telescope/telescope.nvim',
			'renerocksai/calendar-vim'
		}
	}
	--
	-- treesitter
	use 'nvim-treesitter/nvim-treesitter'
	use 'nvim-treesitter/playground'
	use 'nvim-treesitter/nvim-treesitter-textobjects'
	--
	-- convenient search result hopping 
	use 'kevinhwang91/nvim-hlslens'
	--
	-- show keybindings on command typing
	use 'folke/which-key.nvim'
	--
	-- game by ThePrimeagen for vim training
	use 'ThePrimeagen/vim-be-good'
	--
	-- Lua
	use {
		'folke/trouble.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
	}
	--
	-- harpoon used to mark and switch between files (bookmarks)
	use {
		'ThePrimeagen/harpoon',
		requres = 'nvim-lua/plenary.nvim'
	}
	--
	-- undotree showing you all recent changes history in a file in a tree-like manner
	use 'mbbill/undotree'
	--
	--
	--windows min/max with animation
	use {
		'anuvyklack/windows.nvim',
		requires = {
			'anuvyklack/middleclass',
			'anuvyklack/animation.nvim'
		},
	}
	--
	use {
		'salkin-mada/openscad.nvim',
		requires = 'L3MON4D3/LuaSnip'
	}
	--
	-- show function signature as you type
	use 'ray-x/lsp_signature.nvim'
	--
	-- move blocks vertically
	use 'fedepujol/move.nvim'
	--
	-- blame on lines
	use 'tveskag/nvim-blame-line'
	--
	-- align markdown table
	use 'junegunn/vim-easy-align'
	--
	use {
		'nvim-neotest/neotest',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',
			'antoinemadec/FixCursorHold.nvim',
			'nvim-neotest/neotest-plenary',
			'nvim-neotest/neotest-python',
			'nvim-neotest/neotest-go'
		}
	}
	--
	use {
		'mfussenegger/nvim-dap-python',
		requires = {
			'mfussenegger/nvim-dap'
		}
	}
	-- LSP support for vim configs
	use "folke/neodev.nvim"
	-- comment lines/blocks
	use 'numToStr/Comment.nvim'
	--
	-- java support
	use 'mfussenegger/nvim-jdtls'
	--
	use {
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
	}
	--
	use {
		"narutoxy/dim.lua",
		requires = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
	}
	--
	use 'chaoren/vim-wordmotion';
	--
	use {
		'kosayoda/nvim-lightbulb',
		requires = 'antoinemadec/FixCursorHold.nvim',
	}
	--
	use {
		'weilbith/nvim-code-action-menu',
		cmd = 'CodeActionMenu'
	}
	--
	use 'mikelue/vim-maven-plugin'
	use 'ggandor/leap.nvim'
	--
	use 'simrat39/rust-tools.nvim'
	use 'tree-sitter/tree-sitter-rust'
	--
	-- go support
	-- use 'fatih/vim-go'
	use 'leoluz/nvim-dap-go'

	-- d2 support 
	use 'terrastruct/d2-vim'

	use 'anuvyklack/pretty-fold.nvim'

	--.http file support
	use {
		"rest-nvim/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	}

end)
