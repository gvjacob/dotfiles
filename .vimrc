" --------------------------------------------------------------
" Plugins
" --------------------------------------------------------------
call plug#begin('~/.vim/plugged')
  "
  " Editor
  "
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'itchyny/lightline.vim'
  Plug 'junegunn/goyo.vim'

  Plug 'scrooloose/nerdtree'
  Plug 'PhilRunninger/nerdtree-visual-selection'
  Plug 'scrooloose/nerdcommenter'

  Plug 'tpope/vim-abolish'
  Plug 'ntpeters/vim-better-whitespace'

  Plug 'szw/vim-maximizer'
  Plug 'mattn/emmet-vim'

  "
  " Git
  "
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  "
  " Search
  "
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
  Plug 'junegunn/fzf.vim'

  "
  " In-file search (dependencies)
  "
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-easymotion.vim' " incsearch + easymotion

  "
  " Theme
  "
  Plug 'mhartington/oceanic-next'

  "
  " Languages
  "
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

  "
  " Misc
  "
  Plug 'JamshedVesuna/vim-markdown-preview'

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
set scrolloff=10
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
set timeoutlen=500 ttimeoutlen=0

" Change pop up window colors
hi Pmenu ctermbg=cyan ctermfg=white

" Clear vertical line split
highlight VertSplit ctermbg=NONE ctermfg=0
:set fillchars+=vert:\ 

" Set linenumber color
highlight LineNr ctermfg=grey

" Remove background color on SignColumn
highlight clear SignColumn

" Search selected text: //
vnoremap / y/\V<C-R>=escape(@",'/\')<CR><CR>

" Change cursor on INSERT
let &t_EI = "\033[1 q" " NORMAL
let &t_SI = "\033[5 q" " INSERT

autocmd filetype crontab setlocal nobackup nowritebackup
filetype plugin indent on


" --------------------------------------------------------------
" Language
" --------------------------------------------------------------
"
" JSON
"
autocmd FileType json syntax match Comment +\/\/.\+$+

"
" Jinja
"
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.njk set filetype=jinja


" --------------------------------------------------------------
" Plugin Settings
" --------------------------------------------------------------
"
" fzf
"
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

"
" NERDTree
"
let NERDTreeIgnore=['\.pyc$', '.DS_Store', '.git$']
let NERDTreeShowHidden=1
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDCustomDelimiters={
  \ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

"
" Emmet
" https://raw.githubusercontent.com/mattn/emmet-vim/master/TUTORIAL
"
" Remap leader key to <Leader>e
let g:user_emmet_leader_key='<Leader>e'

"
" Conquer of Completion (coc)
"
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

" Use Coc's formatter for :Prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Run Prettier pre-write for Vue files
" coc fails to recognize vue files
autocmd BufWritePre *.vue Prettier

"
" Lightline
"
let g:lightline = {
  \   'colorscheme': 'wombat',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ],
  \     'right':[ ['filetype'],
  \               ['lineinfo'],
  \               ['percent'],
  \     ]
  \   },
  \   'component': {
  \     'lineinfo': '%3l:%-2v',
  \   },
  \   'component_function': {
  \     'filename': 'LightlineFilename',
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }

" Current filename for lightline
function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')

  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif

  return expand('%')
endfunction

"
" Goyo
"
autocmd! User GoyoLeave :source $MYVIMRC
let g:goyo_height = '100%'
let g:goyo_width = '50%'

"
" vim-markdown-preview
"
let vim_markdown_preview_github=1 " use grip
let vim_markdown_preview_browser='Brave'

" --------------------------------------------------------------
" Commands
" --------------------------------------------------------------
cnoreabbrev hs split

" --------------------------------------------------------------
" Mappings
" --------------------------------------------------------------

"
" Leader
"
let mapleader="f"
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>N :NERDTreeFind<CR>
nmap <Leader>p :GFiles --cached --others --exclude-standard<CR>
nmap <Leader>s :Ag<CR>
nmap <Leader>/ :BLines<CR>
nmap <Leader>gd <Plug>(coc-definition)
nmap <Leader>gr <Plug>(coc-references)
nmap <Leader>r :noh<CR>| " Clear search results
nmap <Leader>m :MaximizerToggle<CR>

"
" , leader
"
nmap ,S <C-w>r<C-w>w<CR>
nmap ,s :source $MYVIMRC<CR>| " Resource .vimrc file
nmap ,g :Goyo<CR>Fs<CR>| " Toggle Goyo
nmap ,r :edit!<CR>

"
" Misc
"
nmap <Tab> :b#<CR>
nmap / <Plug>(incsearch-easymotion-/)

" Use C-j and C-k to navigate pop up window
inoremap <expr> <C-j> pumvisible() ? "<Down>" : ""
inoremap <expr> <C-k> pumvisible() ? "<Up>" : ""

" Use C-j and C-k to navigate page up and down
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>


" --------------------------------------------------------------
" Resources
" --------------------------------------------------------------
" https://vim-adventures.com/
" https://learnvimscriptthehardway.stevelosh.com/
