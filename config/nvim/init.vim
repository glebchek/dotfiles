"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'itchyny/lightline.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'danilamihailov/beacon.nvim'
  "" Language-specific packages
  Plug 'neovim/nvim-lsp'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'leafgarland/typescript-vim'
call plug#end()

"" Init all required lang servers
"" npm install -g vscode-html-languageserver-bin vscode-css-languageserver-bin vscode-json-languageserver typescript-language-server
lua<< EOF
require'nvim_lsp'.html.setup{}
require'nvim_lsp'.cssls.setup{}
require'nvim_lsp'.jsonls.setup{}
require'nvim_lsp'.tsserver.setup{}
EOF

" Required:
filetype plugin indent on
syntax enable

set mouse=a
set clipboard+=unnamedplus
set noshowmode

map <C-n> :NERDTreeToggle<CR>

let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ] ]
\  }
\}

set hidden

