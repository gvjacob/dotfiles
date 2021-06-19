" --------------------------------------------------------------
" Plugins
" --------------------------------------------------------------
call plug#begin('~/.vim/plugged')
  " Editor
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-abolish'
  Plug 'w0rp/ale'
  Plug 'scrooloose/nerdcommenter'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'itchyny/lightline.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'
  Plug 'christoomey/vim-system-copy'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
  Plug 'junegunn/fzf.vim'
  Plug 'JamshedVesuna/vim-markdown-preview'
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'jxnblk/vim-mdx-js'
  Plug 'mattn/emmet-vim'


  " Theme
  Plug 'mhartington/oceanic-next'

  " Language plugins
  Plug 'scrooloose/syntastic'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'derekwyatt/vim-scala'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'quramy/tsuquyomi'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Requirement for tsuquyomi
  Plug 'mxw/vim-jsx'
  Plug 'posva/vim-vue'
  Plug 'nelsyeung/twig.vim'
  Plug 'lepture/vim-jinja'
  Plug 'stanangeloff/php.vim'
call plug#end()


" --------------------------------------------------------------
" Vim Configuration
" --------------------------------------------------------------
syntax enable
set updatetime=1000
set relativenumber
set number
set nocompatible
set hlsearch
set expandtab
set tabstop=2
set hidden
set shiftwidth=2
set wrap
set ignorecase
set smartcase
set linebreak
set softtabstop=2
set scrolloff=8
set smarttab
set noswapfile
set laststatus=2
set background=dark
set lazyredraw
set backspace=2
set autoread
set clipboard=unnamed
set noshowmode
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
set timeoutlen=1000 ttimeoutlen=0
highlight LineNr ctermfg=grey
autocmd filetype crontab setlocal nobackup nowritebackup
filetype plugin indent on

" Search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Change cursors
let &t_SI = "\033[5 q" " INSERT
let &t_EI = "\033[1 q" " NORMAL



" --------------------------------------------------------------
" Language
" --------------------------------------------------------------
"  Scala
au BufRead,BufNewFile *.sbt set filetype=scala
let g:syntastic_scala_checkers = []
let g:syntastic_ignore_files = ['\m\.sbt$','\m\.scala$']

" JSON
autocmd FileType json syntax match Comment +\/\/.\+$+

" JS
let g:jsx_ext_require=0
let g:netrw_liststyle=3

" Jinja
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.njk set ft=jinja

" --------------------------------------------------------------
" Plugin Settings
" --------------------------------------------------------------

" fzf
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)


"  NERDTree
let NERDTreeIgnore=['\.pyc$', '.DS_Store', '.git$']
let NERDTreeShowHidden=1
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDCustomDelimiters={
  \ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" Ctrlp
let g:ctrlp_custom_ignore='\v[\/](node_modules|target|dist)|(\.(swp|ico|git|github|svn|cache))$'
let g:ctrlp_show_hidden = 1

" Airline
let g:airline_theme='oceanicnext'

" Conquer of Completion (coc)
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-metals',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-yaml',
  \ 'coc-highlight',
  \ 'coc-pairs',
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

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
"autocmd! User GoyoEnter Limelight
"autocmd! User GoyoLeave Limelight!

" Goyo
autocmd! User GoyoLeave :source $MYVIMRC
let g:goyo_height = '100%'
let g:goyo_width = '50%'

" vim-markdown-preview
let vim_markdown_preview_github=1 " use grip
let vim_markdown_preview_browser='Brave'

" Prettier
let g:prettier#autoformat = 0
let g:prettier#config#single_quote = 'true'
let g:prettier#config#semi = 'true'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#arrow_parens = 'always'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#print_width = 80
let g:prettier#config#tab_width = 2
let g:prettier#config#config_precedence = 'prefer-file'

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.mdx,*.vue,*.yaml,*.html PrettierAsync

" Asynchronous Linter Engine (ALE)
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_change = 'never'
let g:ale_lint_on_enter = 0
let g:ale_set_highlights = 0
let g:ale_linters_ignore = ['tsserver']
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '??'
let g:ale_fix_on_save = 0
let g:ale_fixers = {
  \   'javascript': ['prettier', 'eslint'],
  \   'vue': ['prettier', 'eslint']
  \ }

" --------------------------------------------------------------
" Commands
" --------------------------------------------------------------
" https://vimrcfu.com/snippet/223
cnoreabbrev hs split

" --------------------------------------------------------------
" Mappings
" --------------------------------------------------------------

" Terminal
"tnoremap <Esc> <C-\><C-n>
"tnoremap <Esc><Esc> <C-\><C-n>:q!<CR>

" Leader
let mapleader=","
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>N :NERDTreeFind<CR>
nmap <Leader>p :GFiles --cached --others --exclude-standard<CR>
nmap <Leader>s :Ag<CR>
nmap <Leader>t :vert terminal<CR>
nmap <Leader>/ :BLines<CR>
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
nmap <Leader>F :Prettier<CR>
nmap <Leader>S <C-w>r<C-w>w<CR>
nmap <Leader>R :edit!<CR>

" Shift + F
nmap Fs :source $MYVIMRC<CR>| " Resource .vimrc file
nmap Fl :Limelight!!<CR>| " Toggle Limelight
nmap Fg :Goyo<CR>Fs<CR>| " Toggle Goyo
nmap Fr :noh<CR>| " Clear search results

" Misc
nmap <Tab> :b#<CR>
nmap / <Plug>(incsearch-easymotion-/)

" --------------------------------------------------------------
" Abbreviations
" --------------------------------------------------------------

" Javascript
"autocmd FileType javascript :iabbrev <buffer> -if- if ()<left>
"autocmd FileType javascript :iabbrev <buffer> -log- console.log()<left>
"autocmd FileType javascript :iabbrev <buffer> -import- import  from ''<left>

" Python
"autocmd FileType python :iabbrev <buffer> -if- if :<left>
"autocmd FileType python :iabbrev <buffer> -log- print()<left>
"autocmd FileType python :iabbrev <buffer> -import- from import


" --------------------------------------------------------------
" Resources
" --------------------------------------------------------------
" https://vim-adventures.com/
" https://learnvimscriptthehardway.stevelosh.com/
