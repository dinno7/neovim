-- EXAMPLE
local configs = require "nvchad.configs.lspconfig"
local lspconfig = require "lspconfig"

-- INFO: Server options
local tsserverOptions = require "configs.lspservers.tsserver"
local goplsOptions = require "configs.lspservers.gopls"

-- INFO: LSP servers
local servers = {
  html = {},
  cssls = {},
  bashls = {},
  emmet_ls = {
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "vue", "sass", "scss", "less", "svelte" },
  },
  gopls = goplsOptions,
  ts_ls = tsserverOptions,
  volar = {},
}

-- INFO: Initiate all defined servers
for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  lspconfig[name].setup(opts)
end
