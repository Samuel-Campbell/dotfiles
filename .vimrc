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
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'alvan/vim-closetag'
Plugin 'davidhalter/jedi-vim'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'heavenshell/vim-pydocstring'


" --------------------------------
" Common
" --------------------------------

call vundle#end()            
filetype plugin indent on    

set number

set encoding=utf-8

nmap <F6> :NERDTreeToggle<CR>
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

syntax on

" Switch splits
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" Switch tabs
nnoremap <Tab> :tabnext<CR>
autocmd BufWinEnter * NERDTreeMirror

" Markdown View
nnoremap <C-P> :MarkdownPreview<CR>
set splitbelow
set splitright

filetype plugin on
set omnifunc=syntaxcomplete#Complete

" --------------------------------
"  Syntastic
" --------------------------------
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers=['eslint']
let syntastic_mode_map = { 'passive_filetypes': ['jsx'] }
noremap <silent> sc :SyntasticCheck<CR>

" --------------------------------
" Color scheme
" --------------------------------

set t_Co=256   

set background=dark
set termguicolors
let g:deepspace_italics=1
colorscheme deep-space
let g:airline_theme='deep_space'


" --------------------------------
"  Python
" --------------------------------
let python_highlight_all=1

" Docstring mapping
nmap <silent> <C-m> <Plug>(pydocstring)

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
" Vue / React
" --------------------------------

augroup vue.files
  au!
  autocmd BufNewFile,BufRead *.vue   set syntax=html
augroup END

au BufNewFile,BufRead *.vue,*.js,*.html,*.css,*.json,*.scss,*.jsx
    \ set tabstop=4 |
    \ set shiftwidth=4 |
    \ filetype indent on |
    \ set smartindent |
    \ set expandtab 

" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue,*.jsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.vue,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,vue,*.jsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,vue,*.jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


" --------------------------------
"  PHP
" --------------------------------

augroup twig.files
  au!
  autocmd BufNewFile,BufRead *.html.twig   set syntax=html
augroup END


let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_complete_for_unknown_classes = 1
let g:phpcomplete_search_tags_for_variables = 1 
let g:phpcomplete_cache_taglists = 1
let g:phpcomplete_enhance_jump_to_definition = 1

