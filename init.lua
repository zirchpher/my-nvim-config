-- Lazy.nvim
require("remmian.core.lazy")

-- Core
require("remmian.core.options")
require("remmian.core.mappings")
require("remmian.core.colorscheme")

-- Plugins config
require("remmian.plugins.lualine")
require("remmian.plugins.nvim-tree")
require("remmian.plugins.indent-blankline")
require("remmian.plugins.treesitter")
require("remmian.plugins.comments")
require("remmian.plugins.telescope")
require("remmian.plugins.toggleterm")
require("remmian.plugins.git")
require("remmian.plugins.gitsigns")
require("remmian.plugins.cursorline")
require("remmian.plugins.easyemotion")
require("remmian.plugins.autopairs")
-- Plugins de autocompletado
require("remmian.plugins.autocompletado.mason")
require("remmian.plugins.autocompletado.lspconfig")
require("remmian.plugins.autocompletado.lspsaga")
require("remmian.plugins.autocompletado.null-ls")
