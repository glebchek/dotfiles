"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let g:ale_completion_enabled = 1
let g:ale_set_balloons=1
let g:ale_virtualtext_cursor = 1

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['prettier', 'tslint'],
\}

call plug#begin('~/.local/share/nvim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'itchyny/lightline.vim'
  Plug 'dense-analysis/ale'
  "" Plug 'leafgarland/typescript-vim'
  Plug 'HerringtonDarkholme/yats.vim'
call plug#end()

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

au BufRead,BufNewFile *.ts set filetype=typescript
au BufRead,BufNewFile *.tsx set filetype=typescript.tsx

set hidden

