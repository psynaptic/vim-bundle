set nocompatible

filetype off

" You must init submodules on install for this to work
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" SnipMate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
""Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'

" Programming helpers
Bundle 'vim-scripts/closetag.vim'
""Bundle 'spf13/vim-autoclose'
Bundle 'tomtom/tcomment_vim'
Bundle 'csexton/trailertrash.vim'
Bundle 'AndrewRadev/linediff.vim'
"Bundle 'rstacruz/sparkup'
Bundle 'chrismetcalf/vim-yankring'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'

" UI
Bundle 'bling/vim-airline'

" Navigation
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'majutsushi/tagbar'
Bundle 'bogado/file-line'

" Language support

""Bundle 'spf13/PIV'
Bundle 'vim-scripts/DoxygenToolkit.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'beyondwords/vim-twig'
Bundle 'moll/vim-node'
Bundle 'kchmck/vim-coffee-script'
Bundle 'ap/vim-css-color'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-cucumber'

" Drupal
Bundle 'git://drupalcode.org/project/vimrc.git', {'rtp': 'bundle/vim-plugin-for-drupal'}
Bundle 'tanarurkerem/drupal-snippets'

" Services
Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'
Bundle 'tpope/vim-fugitive'

" Colorschemes
Bundle 'morhetz/gruvbox'
Bundle 'nanotech/jellybeans.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'sjl/badwolf'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/peaksea'
Bundle 'jonathanfilip/vim-lucius'
Bundle 'twerth/ir_black'

filetype plugin indent on

" Syntax highlighting options
syntax on                         " Enable syntax highlighting.
set background=dark               " Use a dark background with light text.
se t_Co=256                       " 256 colors.
silent! colorscheme solarized     " Use the Solarized color scheme.
set nocursorline                  " Don't highlight the screen line of the cursor.
set nocursorcolumn                " Don't highlight the column of the cursor.
autocmd BufEnter * :syntax sync fromstart " Set syntax sync to fromstart.

" CSS preprocessor filetype support.
au BufNewFile,BufRead *.less set filetype=less.css
au BufNewFile,BufRead *.sass set filetype=sass.css
au BufNewFile,BufRead *.scss set filetype=scss.css

au BufNewFile,BufRead .agnostic_profile set filetype=sh
au BufNewFile,BufRead .shell_functions set filetype=sh
au BufNewFile,BufRead .bash_functions set filetype=sh
au BufNewFile,BufRead .bash_aliases set filetype=sh
let g:is_bash = 1

" Enable snipMate's HTML snippets to work in PHP files.
au BufNewFile,BufRead *.php set filetype=php.html

" Enable code completion for certain languages.
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
    \ if &omnifunc == "" |
      \ setlocal omnifunc=syntaxcomplete#Complete |
    \ endif
endif
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Files
set encoding=utf-8        " Always edit in utf-8.
set fileformats=unix      " Use Unix-style line endings.
set noswapfile            " Don't create swp files.

" Complete longest string, then list alternatives
set wildmode=longest,list

" Search
set ignorecase            " Ignore case when using a search pattern.
set smartcase             " Override 'ignorecase' when the pattern contains upper
                          " case characters.
set hlsearch              " Highlight all matches for the last used search pattern.
set incsearch             " Find matches as you type the search pattern.

" Buffer
set autowrite             " Automatically save before commands like :next and :make.
set hidden                " Hide buffers (instead of closing them) when they are abandoned.

" UI Information
set showcmd               " Show (partial) command keys in the status line.
set ruler                 " Show cursor position (line and column number).
set number                " Show the line number for each line.
set showmatch             " Show matching brackets/parentheses.
if has('cc')
  set cc=80               " Highlight column 80.
endif

" UI Behaviour
set backspace=2           " Use standard backspace behavior.
set scrolloff=2           " Always show N lines above and below cursor (context).
set linebreak             " Break lines when appropriate.
set clipboard=unnamed     " Always use the system keyboard.
set pastetoggle=<F2>      " Set key command to use as the paste mode toggle.
set history=1000          " Number of commands to remember.

" Tabs and Indentation
set expandtab             " Convert tabs to spaces.
set tabstop=2             " Tab size of 2 spaces.
set softtabstop=2         " Soft tab size of 2 spaces.
set shiftwidth=2          " Indentation tab of 2 spaces.
set autoindent
set copyindent
"set smartindent

" Avoid common mistakes
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev Q q
cnoreabbrev WQ wq

" Relative :edit paths
set autochdir

" Change the command prefix to avoid pressing shift too much.
noremap ; :

" Change the leader to ",".
let mapleader=","

" Easier split navigation.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Shortcut to clear search highlights.
nmap <silent> ,/ :nohlsearch<CR>

" Shortcut for command-t that starts the search in the Drupal Root directory.
nmap ,d :CommandT $DRUPAL_ROOT<CR>

" Create a shortcut for saving a file with root permissions.
cmap w!! w !sudo tee % >/dev/null

" Make search results appear in the middle of the screen.
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Persistent undo (vim 7.3 and later)
silent !mkdir ~/.vim/.undo > /dev/null 2>&1
if exists('&undofile') && !&undofile
  set undodir=~/.vim/.undo
  set undofile
endif

" Status line
if has('statusline')
  set laststatus=2                                                              " enable statusline
  set statusline=                                                               " clear statusline
  set statusline+=%1*%{exists('g:loaded_fugitive')?fugitive#statusline():''}%*  " git info
  set statusline+=%2*\ %<%t\ %*                                                 " filename
  set statusline+=%3*%m%*                                                       " modified flag
  set statusline+=%4*%=%5l%*                                                    " current line
  set statusline+=%4*/%L%*                                                      " total lines
  set statusline+=%4*%4c\ %*                                                    " column number
endif

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Disable folding from PIV
let g:DisableAutoPHPFolding = 1

"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
"let g:SuperTabDefaultCompletionType = 'context'
set completeopt=menu,longest
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabLongestHighlight=1
let g:SuperTabLongestEnhanced=1

let g:yankring_history_dir = '$HOME/.vim'
let g:yankring_history_file = '.yankring_history'

let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

" set up Drupal Code Sniffer with syntastic
"let g:syntastic_phpcs_conf=" --standard=DrupalCodingStandard --extensions=php,module,inc,install,test,profile,theme"

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['css', 'module', 'install', 'inc', 'php'] }

set wrap

set keywordprg=~/bin/php.net.sh
command! -nargs=1 Silent
  \ | execute ':silent !'.<q-args>
  \ | execute ':redraw!'
autocmd FileType php nnoremap K :Silent ~/bin/php.net.sh <cword> <CR>

