u"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
filetype plugin indent on
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
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number relativenumber

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
	
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }


" (Optional) Multi-entry selection UI.
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
else
	Plug 'Shougo/deoplete.nvim'
  	Plug 'roxma/nvim-yarp'
  	Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'rust-lang/rust.vim'
Plug 'preservim/tagbar'
Plug 'tpope/vim-pathogen'
Plug 'vim-syntastic/syntastic'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'arzg/vim-rust-syntax-ext'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autoopen 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType rust, TagbarToggle
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" : "\<TAB>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

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
\ 'go': ['gopls'],
\ }
nmap <F5> <Plug>(lcn-menu)
autocmd FileType rust nmap <silent> gr <Plug>(lcn-rename)
let g:rustfmt_autosave = 1

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F8> :TagbarToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


au BufNewFile,BufReadPre * if &ft == 'rs'
nmap <leader>r :w \| Cargo r<CR>
nmap <leader>t :w \| Cargo t<CR>
			\endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 버퍼 목록 켜기
let g:airline#extensions#tabline#enabled = 1
" 파일명만 출력
let g:airline#extensions#tabline#fnamemod = ':t'
" 이 옵션은 버퍼를 수정한 직후 버퍼를 감춰지도록 한다.
" 이 방법으로 버퍼를 사용하려면 거의 필수다.
set hidden
" 버퍼 새로 열기
" 원래 이 단축키로 바인딩해 두었던 :tabnew를 대체한다.
nmap <leader>T :enew<cr>

" 다음 버퍼로 이동
nmap <leader>l :bnext<CR>

" 이전 버퍼로 이동
nmap <leader>h :bprevious<CR>

" 현재 버퍼를 닫고 이전 버퍼로 이동
" 탭 닫기 단축키를 대체한다.
nmap <leader>bq :bp <BAR> bd #<CR>

" 모든 버퍼와 각 버퍼 상태 출력
nmap <leader>bl :ls<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 기본 명령어 단축키 등록
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
