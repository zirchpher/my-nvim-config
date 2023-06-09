local setup, hop = pcall(require, "hop")
if not setup then
  return
end

hop.setup({
  keys = "etovxqpdygfblzhckisuran",
})

-- easymotion
-- búsqueda de palabras usando la tecla f
vim.keymap.set("", "f", function()
  hop.hint_char1({ direction = { nil }, current_line_only = false })
end, { remap = true })
