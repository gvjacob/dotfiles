" Plugins
call plug#begin('~/.vim/plugged')
  " NTH plugins
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-abolish'
  Plug 'mhartington/oceanic-next'
  Plug 'w0rp/ale'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'itchyny/lightline.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'
  Plug 'christoomey/vim-system-copy'
  Plug 'shougo/unite.vim'


  " Language plugins
  Plug 'scrooloose/syntastic'
  Plug 'prettier/vim-prettier'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

highlight LineNr ctermfg=grey

syntax enable
set updatetime=1000
set number
set nocompatible
set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2
set wrap
set linebreak
set softtabstop=2
set smarttab
set noswapfile
set ignorecase
set laststatus=2
set background=dark
set lazyredraw
set backspace=2
set autoread
set clipboard=unnamed
set noshowmode
autocmd filetype crontab setlocal nobackup nowritebackup
filetype plugin indent on

" other plugin settings
let g:netrw_liststyle=3
let g:jsx_ext_require=0
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:airline_theme='oceanicnext'
let NERDTreeIgnore = ['\.pyc$', '.DS_Store', 'node_modules', '.git']
let NERDTreeShowHidden = 1
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" Conquer of Completion (coc)
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-yaml',
  \ 'coc-highlight',
  \ ]


" Lightline
let g:lightline = {
  \   'colorscheme': 'wombat',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'filename': 'LightlineFilename',
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline


" Prettier
let g:prettier#autoformat = 0
let g:prettier#config#semi = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#print_width = 100
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Leaders
let mapleader=","
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>N :NERDTreeFind<CR>
nmap <Leader>p :CtrlP<CR>
nmap <Leader>l :ALELint<CR>
nmap <Leader>lf :ALEFix<CR>
nmap <Leader>f :Prettier<CR>
nmap <Leader>s :so $MYVIMRC<CR>
nmap <Leader>r :edit<CR>
nmap <Leader>s <c-w>r<c-w>w<CR>
nmap / <Plug>(incsearch-easymotion-/)
" Search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

let &t_SI = "\033[5 q"
let &t_EI = "\033[1 q"
set timeoutlen=1000 ttimeoutlen=0

" Asynchronous Linter Engine (ALE)
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_change = 'never'
let g:ale_lint_on_enter = 0
let g:ale_set_highlights = 0
let g:ale_linters_ignore = ['tsserver']
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '??'
let g:ale_linters = {
  \ 'javascript': ['eslint', 'flow']
  \ }

" Mappings, Commands
nmap <Tab> :b#<CR>

" Additional sourcing
"source ~/.vim/coc.vim

