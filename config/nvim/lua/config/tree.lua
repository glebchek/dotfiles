return function()
    require'nvim-tree'.setup{
        open_on_setup = true,
        auto_close = true,
        open_on_tab = true,
        lsp_diagnostics = true
    }
end