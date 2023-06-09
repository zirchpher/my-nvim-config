local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({

  -- Tema
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false, priority = 1000, enabled = false},
  { "Shatur/neovim-ayu" },

  -- Línea de Estado
  { "nvim-lualine/lualine.nvim", event = "VeryLazy" },

  {"nvim-lua/plenary.nvim"}, -- plugin todo terreno

  -- manejador de tabs
  {
    'romgrk/barbar.nvim',
    event = "VeryLazy",
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
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

  { "christoomey/vim-tmux-navigator", event = "VeryLazy"}, -- navegar entre ventanas

  { "lukas-reineke/indent-blankline.nvim", event = "VeryLazy"}, -- líneas de identación

  -- Sintaxis en el código
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  -- Comentarios
  { 'numToStr/Comment.nvim',
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring'
    }
  },

  -- amiguito para hacer surrounding(ni siquiera sé si esa palabra existe)
  {"tpope/vim-surround"},

  -- El increíble Telescope, está escrito en C, así que necesitarás instalar cmake
  { 'nvim-telescope/telescope.nvim' },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  -- toggle term o esconder/mostrar una terminal
  {
    'akinsho/toggleterm.nvim', version = "*", config = true
  },

  -- manejo de git
  { 'lewis6991/gitsigns.nvim' }, -- indica los cambios que se hacen en git
  { 'dinhhuy258/git.nvim' }, -- manejo de git desde neovim

  -- Si usas el esquema de plugins tipo LazyVim descomenta la siguiente línea
  -- Todos los plugins que estén dentro de la carpeta plugins se instalarán
  -- .config/nvim/lua/plugin
  -- { import = "plugins" }, 
})
