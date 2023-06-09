-- establecemos la tecla lider
vim.g.mapleader = " " -- tecla líder: <espacio>

-- Atajos
local map = vim.keymap.set

-- Modos
-- n: Modo normal
-- i: Modo de inserción.
-- x: Modo visual.
-- s: Modo de selección.
-- v: Visual y selección.
-- t: Modo de terminal.
-- o: Modo de espera de operador.
-- '': Sí, una cadena de texto vacía. Es el equivalente a n + v + o.

-------------------------------
-- Atajos de teclado Generales
-------------------------------
map('n', '<C-s>', '<cmd>write<cr>', {desc = 'Guardar archivo'})
map('i', 'jk', '<ESC>', {desc = 'Salir del modo insert'})
map({'n', 'x'}, 'x', '"_x', {desc = 'cuando borremos un caracter usando la tecla x, no se copiará al clipboard'})
map('n', '<C-a>', ':keepjumps normal! ggVG<CR>', {desc = "Seleccionamos todo el texto"})

-------------------------------
-- Atajos de Plugins
-------------------------------
-- nvim-tree
map("n", "<C-n>", ":NvimTreeToggle<CR>", {desc = "abrir/cerrar nvim-tree" })

-- barbar.nvim
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
-- Move to previous/next
map("n", "<M-.>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<M-->", "<Cmd>BufferNext<CR>", opts)
map("n", "<M-s-f>", "<Cmd>BufferOrderByDirectory<CR>", opts) -- Re-order tabs
-- Goto buffer in position...
map("n", "<M-1>", "<Cmd>BufferGoto 1<CR>", opts)
map("n", "<M-2>", "<Cmd>BufferGoto 2<CR>", opts)
map("n", "<M-3>", "<Cmd>BufferGoto 3<CR>", opts)
map("n", "<M-4>", "<Cmd>BufferGoto 4<CR>", opts)
map("n", "<M-5>", "<Cmd>BufferGoto 5<CR>", opts)
map("n", "<M-6>", "<Cmd>BufferGoto 6<CR>", opts)
map("n", "<M-7>", "<Cmd>BufferGoto 7<CR>", opts)
map("n", "<M-8>", "<Cmd>BufferGoto 8<CR>", opts)
map("n", "<M-9>", "<Cmd>BufferGoto 9<CR>", opts)
map("n", "<M-0>", "<Cmd>BufferGoto 0<CR>", opts)
map("n", "<M-e>", "<Cmd>BufferPin<CR>", opts) -- Pin/unpin buffer
map("n", "<M-w>", "<Cmd>BufferClose<CR>", opts) -- Close buffer
map("n", "<M-q>", "<Cmd>BufferCloseAllButCurrent<CR>", opts) -- close all buffer
