-- use plugins
require 'plugins'
-- plugins configuration

require 'code.completion.lsp'
require 'code.highlight.treesitter'
require 'code.highlight.treesitter-textobjects'
require 'code.manipulation.comment'
require 'code.manipulation.git-conflict'
require 'code.testing.neotest'
require 'code.debug.nvim-dap' -- should be after lsp
require 'code.diagnostic.diagnostic'
require 'code.diagnostic.trouble'

require 'general.plugins.packer'
require 'general.indents'
require 'general.movement.leap'
require 'general.movement.xksbswitch'
require 'general.movement.move'
require 'general.bookmarking.harpoon'
require 'general.clipboard'

require 'ui.catppuccin'
require 'ui.line-numbers'
require 'ui.galaxyline'
require 'ui.personal'
require 'ui.rainbow-delimiter'
require 'ui.highlights'
require 'ui.lsp-signature'
require 'ui.neotree'
require 'ui.telescope'
require 'ui.windows'
require 'ui.dap-ui'
require 'ui.blame-line'

require 'remaps.leader'
require 'remaps.personal'
