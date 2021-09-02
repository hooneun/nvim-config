"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
set encoding=utf8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')

if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'autozimu/LanguageClient-neovim', {
	\ 'branch': 'next',
	\ 'do': 'bash install.sh',
	\ }

" (Optional) Multi-entry selection UI.
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
else
	Plug 'Shougo/deoplete.nvim'
  	Plug 'roxma/nvim-yarp'
  	Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => provider disabled 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:loaded_perl_provider = 0
let g:loaded_python_provider = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => rust setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LanguageClient_serverCommands = {
\ 'rust': ['rust-analyzer'],
\ }
nmap <F5> <Plug>(lcn-menu)
autocmd FileType rust nmap <silent> gr <Plug>(lcn-rename)
let g:rustfmt_autosave = 1
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" : "\<TAB>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <SPACE> <Nop>
noremap <Up>    :10winc -<CR>
noremap <Down>  :10winc +<CR>
noremap <Left>  :10winc <<CR>
noremap <Right> :10winc ><CR>

let mapleader=" "

nmap <leader><CR> :Files<CR>