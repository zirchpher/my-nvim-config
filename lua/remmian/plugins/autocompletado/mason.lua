local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

-- enable mason
mason.setup()

-- lsp servers
mason_lspconfig.setup {
  ensure_installed = {
    -- lua stuff
    "lua_ls",
    -- web dev stuff
    "cssls",
    "html",
    "emmet_ls",
    "tsserver",
    "tailwindcss",
  },
  automatic_installation = true,
}

-- formatters
mason_null_ls.setup({
  ensure_installed = {
    "prettier", -- ts/js formatter
    "stylua", -- lua formatter
    "eslint_d", -- ts/js linter
  },
  automatic_installation = true,
})
