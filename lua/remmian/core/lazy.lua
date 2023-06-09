local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- Tema
    { "Shatur/neovim-ayu", lazy = false, priority = 1000 },

  	-- Línea de Estado
		{ "nvim-lualine/lualine.nvim",  event = "VeryLazy" },

		-- Colección de módulos. No hay una "temática" específica en este plugin,
		--  tiene un montón de funciones que otros autores de plugins usan para resolver problemas comunes.
		{ "nvim-lua/plenary.nvim" }, -- plugin todo terreno

		-- esto, es por lo que definitivamente uso neovim y no vs-code ``EASYEMOTION``
		{
		  "phaazon/hop.nvim",
		  branch = "v2", -- optional but strongly recommended
		  event = "VeryLazy",
		},

    -- auto close
		{ "windwp/nvim-autopairs", event = "VeryLazy", }, -- autoclose de [], {}, "", etc...
    { "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter" },

		-- manejador de tabs
		{
		  'romgrk/barbar.nvim',
		  event = "VeryLazy",
		  dependencies = {
		    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
		    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		  },
		  init = function() vim.g.barbar_auto_setup = false end,
		  opts = {
		    auto_hide = true,
		    clickable = true,
		    icons = {
		      -- Enables / disables diagnostic symbols
		      diagnostics = {
		        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
		        [vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
		        [vim.diagnostic.severity.INFO] = { enabled = true, icon = " " },
		        [vim.diagnostic.severity.HINT] = { enabled = true, icon = "ﴞ " },
		      },
		    },
		  },
		  version = '^1.0.0', -- optional: only update when a new 1.x version is released
		},

		-- Manejador de carpetas
		{
		  'nvim-tree/nvim-tree.lua',
		  event = "VeryLazy",
		  dependencies = {
		    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		  },
		},

		{ "christoomey/vim-tmux-navigator",      event = "VeryLazy" }, -- navegar entre ventanas

		{ "lukas-reineke/indent-blankline.nvim", event = "VeryLazy" }, -- líneas de identación

		-- Sintaxis en el código
		{
		  "nvim-treesitter/nvim-treesitter",
		  event = "VeryLazy",
		  build = function()
		    local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		    ts_update()
		  end,
		},

		{
		  "nvim-treesitter/nvim-treesitter-textobjects",
		  dependencies = "nvim-treesitter/nvim-treesitter",
		  event = "VeryLazy",
		},

		-- Comentarios
		{
		  'numToStr/Comment.nvim',
		  dependencies = {
		    'JoosepAlviste/nvim-ts-context-commentstring'
		  },
		  event = "VeryLazy",
		},

		-- amiguitos para hacer surrounding(ni siquiera sé si esa palabra existe)
		{ "tpope/vim-surround", event = "VeryLazy", },
		{ "yamatsum/nvim-cursorline", event = "VeryLazy", }, -- Resalta palabras similares y líneas en el cursor neovim

		-- El increíble Telescope, está escrito en C, así que necesitarás instalar cmake
		{ 'nvim-telescope/telescope.nvim', event = "VeryLazy", },
		{ 'nvim-telescope/telescope-file-browser.nvim', event = "VeryLazy", },
		{ "nvim-telescope/telescope-fzf-native.nvim",  build = "make", event = "VeryLazy", },

		-- toggle term o esconder/mostrar una terminal
		{
		  'akinsho/toggleterm.nvim', version = "*", config = true, event = "VeryLazy",
		},

		-- manejo de git
		{ 'lewis6991/gitsigns.nvim', event = "VeryLazy", }, -- indica los cambios que se hacen en git
		{ 'dinhhuy258/git.nvim', event = "VeryLazy", },     -- manejo de git desde neovim

		-- autocompletado
		--{ "Exafunction/codeium.vim" }, -- autocompletado con IA
    { 'neovim/nvim-lspconfig'},
    { 'hrsh7th/cmp-nvim-lsp'},
    { 'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/nvim-cmp'},
    { "jose-elias-alvarez/typescript.nvim" }, -- soporte adicional a TS
    {
      "glepnir/lspsaga.nvim",
      event = "LspAttach",
      dependencies = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
      }
    },

    -- íconos adicionales
    {"onsails/lspkind.nvim"},

    -- snippets
    {'hrsh7th/cmp-vsnip'},
    {'hrsh7th/vim-vsnip'},
    -- { "L3MON4D3/LuaSnip" }, -- snippet engine
    -- { "saadparwaiz1/cmp_luasnip" }, -- for autocompletion
    -- { "rafamadriz/friendly-snippets" }, -- useful snippets

		-- descargar lsp servers y formateo
		{
      -- lsp servers
		  { "williamboman/mason.nvim" },
		  { "williamboman/mason-lspconfig.nvim" },
      -- formatting & linting
      { "jose-elias-alvarez/null-ls.nvim" },
      { "jayp0521/mason-null-ls.nvim" },
		},
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
