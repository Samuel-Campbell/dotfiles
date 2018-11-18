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
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'jremmen/vim-ripgrep'           " For crazy fast 'find in project' searching
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'shawncplus/phpcomplete.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Always show line numbers
set number

" Color

set t_Co=256   " This is may or may not needed.

set background=dark
colorscheme PaperColor

" Encoding
set encoding=utf-8

" Highlight syntax
let python_highlight_all=1
syntax on

" Key mapping

" Switch splits
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" Switch tabs
nnoremap <Tab> :tabnext<CR>
autocmd BufWinEnter * NERDTreeMirror

set splitbelow
set splitright

" NERDTree
nmap <F6> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" --------------------------------
"  Python
" --------------------------------

" Run python
nnoremap <buffer> <F10> :exec '!python3' shellescape(@%, 1)<cr>

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


" --------------------------------
" Javascript
" --------------------------------

let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0


" --------------------------------
" Vue
" --------------------------------

augroup vue.files
  au!
  autocmd BufNewFile,BufRead *.vue   set syntax=html
augroup END

au BufNewFile,BufRead *.vue,*.js,*.html,*.css,*.scss
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4

" --------------------------------
"  PHP
" --------------------------------

augroup vue.files
  au!
  autocmd BufNewFile,BufRead *.html.twig   set syntax=html
augroup END


let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_complete_for_unknown_classes = 1
let g:phpcomplete_search_tags_for_variables = 1 
let g:phpcomplete_cache_taglists = 1
let g:phpcomplete_enhance_jump_to_definition = 1

