local status, toggleterm = pcall(require, "toggleterm")
if (not status) then return end

toggleterm.setup({
  open_mapping = '<C-t>',
  direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float',
  float_opts = {
    border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved'
    -- like `size`, width and height can be a number or function which is passed the current terminal
    width = 84,
    height = 20,
    winblend = 3,
    zindex = 2,
  },
  shade_terminals = true,
  -- auto_scroll = true, -- automatically scroll to the bottom on terminal output
})
