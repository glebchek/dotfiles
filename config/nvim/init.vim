"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'itchyny/lightline.vim'
  Plug 'natebosch/vim-lsc'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
  Plug 'leafgarland/typescript-vim'
call plug#end()

" Required:
filetype plugin indent on
syntax enable

set mouse=a
set clipboard+=unnamedplus
set noshowmode
let g:deoplete#enable_at_startup = 1

map <C-n> :NERDTreeToggle<CR>

let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [ [ 'mode', 'paste' ] ]
\  }
\}

au BufRead,BufNewFile *.ts set filetype=typescript
au BufRead,BufNewFile *.tsx set filetype=typescript.tsx

set hidden

let g:LanguageClient_serverCommands = {
    \ 'typescript': ['typescript-language-server', '--stdio'],
    \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
