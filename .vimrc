set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-syntastic/syntastic'	      
Plugin 'nvie/vim-flake8'
Bundle 'Valloric/YouCompleteMe'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Always show line numbers
set number

" Auto PEP8 style
" Tabs = 4 spaces
" Line width = 80 spaces
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


" Encoding
set encoding=utf-8

" Highlight syntax
let python_highlight_all=1
syntax on

" Color scheme
colorscheme zenburn

" Key mapping

" Switch splits
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" Switch tabs
nnoremap <Tab> :tabnext<CR>
autocmd BufWinEnter * NERDTreeMirror

" Run python
nnoremap <buffer> <F10> :exec '!python3' shellescape(@%, 1)<cr>

set splitbelow
set splitright

" NERDTree
nmap <F6> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

" Auto completeBundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_server_python_interpreter='python3'

" Javascript
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

au BufNewFile,BufRead *.js,*.html,*.css,*.scss
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4
