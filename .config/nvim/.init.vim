call plug#begin('~/.config/nvim/plugins/')
Plug 'https://github.com/ap/vim-css-color.git'
Plug 'https://github.com/itchyny/lightline.vim.git'
Plug 'https://github.com/ptzz/lf.vim.git'
Plug 'https://github.com/voldikss/vim-floaterm.git'
Plug 'https://github.com/vim-scripts/renamer.vim.git'
call plug#end()
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }
syntax on
set noswapfile
set number
set relativenumber
