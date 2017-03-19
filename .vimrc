
let mapleader=","

inoremap jj <Esc>  " jj key is <Esc> setting
set nocp
call pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible              " be iMproved, required

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

if $TERM == "xterm-256color"
    set t_Co=256
endif

" ==============================================
" =============================================
" Plugin Settings

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  Plugin 'tpope/vim-fugitive'

  " Easier comment
  Plugin 'scrooloose/nerdcommenter'
  " Color picker
  Plugin 'flazz/vim-colorschemes'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'scrooloose/nerdtree'
  Plugin 'Xuyuanp/nerdtree-git-plugin'
  " Pass the path to set the runtimepath properly.
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Install L9 and avoid a Naming conflict if you've already installed a
  " different version somewhere else.
  Plugin 'ascenator/L9' 
  Plugin 'pangloss/vim-javascript'
  Plugin 'mxw/vim-jsx'
  Plugin 'elzr/vim-json'
  Bundle 'vim-ruby/vim-ruby'
  Plugin 'othree/javascript-libraries-syntax.vim'
  Plugin 'digitaltoad/vim-pug'
  Plugin 'scrooloose/syntastic'
  Plugin 'mileszs/ack.vim'
  Plugin 'severin-lemaignan/vim-minimap'
  
  " Badass autocomplete
  Plugin 'Valloric/YouCompleteMe'
  " Rails plugin
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-rake'
  " End if statements
  Plugin 'tpope/vim-endwise'
  " Vim Emmer
  Plugin 'mattn/emmet-vim'
call vundle#end()            " required
filetype plugin indent on    " required

" Use silver_search for ack
let g:ackprg = 'ag --vimgrep'

" Config for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
" COnfig for js libraries
let g:used_javascript_libs = 'underscore, react, flux, chai,jquery'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" For solarized
" syntax enable
colorscheme solarized

set background=dark

" For ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim:w

map <C-n> :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set number
set relativenumber

augroup linenumbers
  autocmd!
  autocmd BufEnter *    :set relativenumber
  autocmd BufLeave *    :set number norelativenumber
  autocmd WinEnter *    :set relativenumber
  autocmd WinLeave *    :set number norelativenumber
  autocmd InsertEnter * :set number norelativenumber
  autocmd InsertLeave * :set relativenumber
  autocmd FocusLost *   :set number norelativenumber
  autocmd FocusGained * :set relativenumber
augroup END

" Shrink Nerdtree sidebar width
let g:NERDTreeWinSize = 25

" Save swap files in tmp folder instead of local
set directory^=$HOME/.vim/tmp//

" Use ctrl + jhkl to navigate windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

" let jsx highlight work without .jsx
let g:jsx_ext_required = 0

" Use tab for emmet expansion
let g:user_emmet_expandabbr_key='<Tab>'
" Use emmet for html & css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
