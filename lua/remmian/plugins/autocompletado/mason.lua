local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({

})

lspconfig.setup {
  -- list of servers for mason to install
  ensure_installed = {
    -- neovim stuff
    "lua_ls",
    -- web stuff
    "html",          -- html
    "emmet_ls",      -- html
    "cssls",         -- css
    "cssmodules_ls", -- css
    "unocss",        -- css
    "tsserver",      -- TS
    "quick_lint_js", -- JS
    "tailwindcss",   -- tailwind
    -- "docker_compose_language_service" -- docker
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
}
