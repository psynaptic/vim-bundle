call pathogen#infect()
call pathogen#helptags()

syntax on
set background=dark
colorscheme solarized
"syntax sync minlines=50         " only sync 50 lines of syntax highlighting around the cursor
set nocursorline                " don't highlight the screen line of the cursor
set nocursorcolumn              " don't highlight the column of the cursor

" Drupal support
au BufNewFile,BufRead *.module set filetype=php
au BufNewFile,BufRead *.test set filetype=php
au BufNewFile,BufRead *.install set filetype=php
au BufNewFile,BufRead *.inc set filetype=php

" LESS support
au BufNewFile,BufRead *.less set filetype=css

" enable snipMate HTML snippets for PHP files
au BufNewFile,BufRead *.php set filetype=php.html

" enable completion for certain languages
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

set magic                       " change the way backslashes are used in search patterns
set ignorecase                  " ignore case when using a search pattern
set smartcase                   " override 'ignorecase' when pattern has upper case characters
set scroll=8                    " number of lines to scroll for CTRL-U and CTRL-D
set wrap                        " long lines wrap
set number                      " show the line number for each line
"set hlsearch                    " highlight all matches for the last used search pattern
set showcmd                     " show (partial) command keys in the status line
set ruler                       " show cursor position below each window
set incsearch                   " incremental search
set autowrite                   " automatically save before commands like :next and :make
set hidden                      " hide buffers when they are abandoned
set scrolloff=8                 " always show N lines above and below cursor (context)

" tabs as spaces
set expandtab                   " convert tabs to spaces
set softtabstop=2               " tab of length 2
set shiftwidth=2                " indentation tab to 2 spaces

" fix os x backspace
set backspace=indent,eol,start

" mappings
set pastetoggle=<F2>            " set key command to use as the paste mode toggle

" I have lazy fingers
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev Q q
cnoreabbrev WQ wq

if has('statusline')
  set laststatus=2                               " enable statusline
  set statusline=                                " clear statusline
  set statusline+=%1*%{fugitive#statusline()}%*  " git info
  set statusline+=%2*\ %<%t\ %*                  " filename
  set statusline+=%3*%m%*                        " modified flag
  set statusline+=%4*%=%5l%*                     " current line
  set statusline+=%4*/%L%*                       " total lines
  set statusline+=%4*%4c\ %*                     " column number
endif

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" load indentation rules according to the detected filetype
if has("autocmd")
  filetype plugin indent on
endif

" enable neocomplcache completion autopopup
"let g:neocomplcache_enable_at_startup = 1

" disable parentesis highlighting
"let loaded_matchparen = 1

let g:SuperTabDefaultCompletionType = "context"

" set up Drupal Code Sniffer with syntastic
let g:syntastic_phpcs_conf=" --standard=DrupalCodingStandard --extensions=php,module,inc,install,test,profile,theme"

