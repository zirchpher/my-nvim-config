local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  return
end

-- configure/enable gitsigns
gitsigns.setup({
  signs = {
    add = {text = '▎'}, -- Es el caracter que se muestra al agregar una línea.
    change = {text = '▎'}, -- Es el caracter que se muestra al modificar una línea.
    delete = {text = '➤'}, -- Es el caracter que se muestra al eliminar una línea.
    topdelete = {text = '➤'}, -- Es el caracter que se muestra cuando se elimina una línea al principio del archivo
    changedelete = {text = '▎'}, -- Es el caracter que se muestra cuando la línea actual ha sido modificada y también ocupa el lugar de una línea eliminada.
  }
})
