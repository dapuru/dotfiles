" vimrc config file
" starting point: https://vim.fandom.com/wiki/Example_vimrcir
" there are also comments for these settings.
" additions from https://www.drumm.sh/blog/vim-python-dev-environment/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important, "no user should have to live without."
" see https://vim.fandom.com/wiki/Example_vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible

" Attempt to determine the type of a file
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Must have options, "These are highly recommended options."
" see https://vim.fandom.com/wiki/Example_vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set hidden

" Some servers have issues with backup files
" https://vimawesome.com/plugin/coc-nvim
set nobackup
set nowritebackup

" less delays
set updatetime=300

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

" Silver Searcher :Ag
let g:ackprg = 'ag --vimgrep'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usability options 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
if has('mouse')
  set mouse=a
endif

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue". Also needed for https://vimawesome.com/plugin/coc-nvim
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indentation options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings - Useful mappings Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Search for files
nnoremap <silent> <C-g> :Files<CR>

" Search using Silver Searcher :Ag
nnoremap <C-f> :Ag<Cr>

" NerdTree
map <C-n> :NERDTreeToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
" https://github.com/junegunn/vim-plug
" https://levelup.gitconnected.com/improving-vim-workflow-with-fzf-3f8bedaca1b2?gi=b22954c86b3a
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" automatic installation of vim-plug
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" https://vimawesome.com/plugin/fzf 
" see: https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko
" and: https://github.com/junegunn/fzf/blob/master/README-VIM.md
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" https://vimawesome.com/plugin/vim-airline-superman
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='simple'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" https://vimawesome.com/plugin/vim-colors-solarized-ours
" Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim', { 'as': 'dracula' }

"" https://vimawesome.com/plugin/coc-nvim
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"let g:coc_disable_startup_warning = 1
"" disable use of LSP - part of integration of CoC
"" https://github.com/dense-analysis/ale#faq-coc-nvim
"let g:ale_disable_lsp = 1

" https://vimawesome.com/plugin/nerdtree-red
Plug 'scrooloose/nerdtree'

" Startify Start screen
" https://github.com/mhinz/vim-startify
Plug 'mhinz/vim-startify'

" git
" https://github.com/mhinz/vim-signify
Plug 'mhinz/vim-signify'

" Tabs
Plug 'jlanzarotta/bufexplorer'

" Zoxide
Plug 'nanotee/zoxide.vim'

" Initialize plugin system
" Reload .vimrc and :PlugInstall to install plugins.
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color Schema 
" https://vimawesome.com/plugin/vim-colors-solarized-ours
" Not in use - instead used 'Dracula' see Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme dracula

" Color tweaks
highlight LineNr ctermfg=white
