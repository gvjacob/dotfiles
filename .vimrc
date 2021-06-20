" --------------------------------------------------------------
" Plugins
" --------------------------------------------------------------
call plug#begin('~/.vim/plugged')
  " Editor
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'w0rp/ale'
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'

  Plug 'scrooloose/nerdtree'
  Plug 'PhilRunninger/nerdtree-visual-selection'
  Plug 'scrooloose/nerdcommenter'

  Plug 'tpope/vim-abolish'
  Plug 'ntpeters/vim-better-whitespace'

  " Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  " Search
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
  Plug 'junegunn/fzf.vim'

  " In-file search (dependencies)
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-easymotion.vim' " incsearch + easymotion

  " Theme
  Plug 'mhartington/oceanic-next'

  " Language plugins
  Plug 'scrooloose/syntastic'
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'quramy/tsuquyomi'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Requirement for tsuquyomi
  Plug 'mustache/vim-mustache-handlebars'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'posva/vim-vue'
  Plug 'nelsyeung/twig.vim'
  Plug 'lepture/vim-jinja'
  Plug 'stanangeloff/php.vim'

  " Misc
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'JamshedVesuna/vim-markdown-preview'
  Plug 'mattn/emmet-vim'

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
set showtabline=1  " Show tabline when there are tabs
set guioptions-=e  " Don't use GUI tabline
set timeoutlen=1000 ttimeoutlen=0

" Set linenumber color
highlight LineNr ctermfg=grey

" Search selected text: //
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Change cursor on INSERT
let &t_EI = "\033[1 q" " NORMAL
let &t_SI = "\033[5 q" " INSERT

autocmd filetype crontab setlocal nobackup nowritebackup
filetype plugin indent on


" --------------------------------------------------------------
" Language
" --------------------------------------------------------------
" JSON
autocmd FileType json syntax match Comment +\/\/.\+$+

" Jinja
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.njk set filetype=jinja


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

"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.mdx,*.vue,*.yaml,*.html PrettierAsync

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
