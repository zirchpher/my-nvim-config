local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },

      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["N"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

-- buscar archivos
vim.keymap.set('n', '<leader>ff',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)

-- buscar palabras
vim.keymap.set('n', '<leader>fs', function()
  builtin.live_grep()
end)

-- buscar buffers o pestañas o tabs
vim.keymap.set('n', '<leader>fb', function()
  builtin.buffers()
end)

-- buscar archivos de ayuda
vim.keymap.set('n', '<leader>fh', function()
  builtin.help_tags()
end)

-- abrir la última pestaña de telescope que se usó 
vim.keymap.set('n', '<leader><leader>', function()
  builtin.resume()
end)

-- abrír los diagnóstico
vim.keymap.set('n', '<leader>fd', function()
  builtin.diagnostics()
end)

-- abrir un nvim-tree flotante
vim.keymap.set("n", "<leader>ft", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)

-- fzf es una extensión para telescope. Puede hacer que telescope use el mismo algoritmo de búsqueda
-- que fzf, con esto podremos usar la misma sintaxis para buscar en fzf y telescope.
-- Además de eso también aumenta la velocidad de nuestras búsquedas. 
telescope.load_extension("fzf")
