return function()
  require'bufferline'.setup{options = {
    diagnostics = 'nvim_lsp',
    separator_style = 'padded_slant'
  }}
end