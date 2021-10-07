return function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  require('cmp_nvim_lsp').update_capabilities(capabilities);

  require'lspconfig'.cssls.setup {
    capabilities = capabilities,
  }

  require'lspconfig'.html.setup {
    capabilities = capabilities,
  }
  
  require'lspconfig'.jsonls.setup {
    capabilities = capabilities,
  }

  require'lspconfig'.tsserver.setup{
    capabilities = capabilities,
  }
end