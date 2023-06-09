vim.opt.showmode = false

local status, lualine = pcall(require, "lualine")
if not status then
  return
end

lualine.setup({
  options = {
    theme = 'ayu_dark',
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
    disabled_filetypes = {
      statusline = {'NvimTree'}
    }
  },
})
