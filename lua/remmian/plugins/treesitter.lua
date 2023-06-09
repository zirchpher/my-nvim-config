local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  
  indent = {
    enable = true,
    disable = {},
  },
  
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      }
    },
  },

  ensure_installed = {
    -- neovim stuff
    "lua",
    "vim",
    "vimdoc",

    -- fullstack stuff
    "html",
    "css",
    "scss",
    "sql",
    "javascript",
    "typescript",
    'tsx',
    "json",
    "yaml",
    "markdown",
    "markdown_inline",
    "gitignore",
    "dockerfile",
    
    -- WM stuff
    "sxhkdrc",
    "bash",
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable         = true,
    enable_autocmd = false,
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
