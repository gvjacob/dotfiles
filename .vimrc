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

  " Language plugins
  Plug 'scrooloose/syntastic'
  Plug 'bumaociyuan/vim-swift'
  Plug 'ElmCast/elm-vim'
  Plug 'prettier/vim-prettier'
  Plug 'vim-ruby/vim-ruby'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
call plug#end()

if (has("termguicolors"))
  set termguicolors
endif

highlight LineNr ctermfg=grey


syntax enable
set nocompatible
set number
set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2
set wrap
set softtabstop=2
set smarttab
set noswapfile
set ignorecase
set laststatus=2
set background=dark
set lazyredraw
set backspace=2
set autoread
autocmd filetype crontab setlocal nobackup nowritebackup
filetype plugin indent on

" other plugin settings
let g:netrw_liststyle=3
let g:jsx_ext_require=0
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.pyc$', '.DS_Store', 'node_modules', '.git']
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:elm_format_autosave = 1
let g:airline_theme='oceanicnext'
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}
" Coc
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
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.separator = {
	\   'left': '>>>', 'right': '<<<'
  \}
let g:lightline.subseparator = {
	\   'left': '>', 'right': '>'
  \}

let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

" prettier
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
nmap <Leader>r :Prettier<CR>
nmap <Leader>d :FlowJumpToDef<CR>

let &t_SI = "\033[5 q"
let &t_EI = "\033[1 q"
set timeoutlen=1000 ttimeoutlen=0

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

nmap <Tab> :b#<CR>
:command! Source :source ~/.vimrc


