filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'micha/vim-colors-solarized'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
Plugin 'zxqfl/tabnine-vim'

let g:pymode_folding = 0
"let g:pymode_lint = 0  " temp attempt to fix hangs :(


filetype plugin indent on     " required!

" Insert spaces instead of  character when the  key is pressed.
" This is also the prefered method of Python coding, since Python is especially sensitive to problems
" with indenting which can occur when people load files in different editors with different tab settings,
" and also cutting and pasting between applications (ie email/news for example) can result in problems.
" It is safer and more portable to use spaces for indenting.
set expandtab

" A four-space tab indent width is the prefered coding style for Python (and everything else!),
" although of course some disagree. This page generally assumes you want 4-space indents.set tabstop = 4
set tabstop=4

" This allows you to use the < and > keys from VIM's visual (marking) mode to block indent/unindent regions
set shiftwidth=4

" Use the \"shiftwidth\" setting for inserting s instead of the \"tabstop\" setting, when at the beginning of a line.
" This may be redundant for most people, but some poeple like to keep their tabstop=8 for compatability
" when loading files, but setting shiftwidth=4 for nicer coding style.
set smarttab

" People like using real tab character instead of spaces because it makes it easier
" when pressing BACKSPACE or DELETE, since if the indent is using spaces
" it will take 4 keystrokes to delete the indent. Using this setting,
" however, makes VIM see multiple space characters as tabstops,
" and so  does the right thing and will delete four spaces (assuming 4 is your setting).
set softtabstop=4

" Very painful to live without this (especially with Python)!
" It means that when you press RETURN and a new line is created, the indent of the new line will match that of the previous line. set autoindent
" Run python on this program when pressing F9
nmap <silent> <F9> :w<CR>:!%:p<CR>
vmap <silent> <F9> <esc>:w<CR>:!%:p<CR>
imap <silent> <F9> <esc>:w<CR>:!%:p<CR>

" Set Python dic set dictionary=~/.vim/dic/python
let python_highlight_all = 1

" setlocal keywordprg=pydoc

set nu
"set relativenumber
set autoindent
set ignorecase
set smartcase
set cursorline
set wildmode=longest:full
set wildmenu
set ruler
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set hidden
set showcmd
set showmode
set gdefault
set incsearch
set showmatch
set hlsearch

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=79
set mouse=a
set mousehide

call pathogen#infect()
syntax on
filetype plugin indent on

" TODO: move this to py-only filetype
"iab ipdb import ipdb; ipdb.set_trace()
"imap ``` import debug  # noqa
"nmap ``` oimport debug  # noqa<esc>:w<cr>

map <F6> :NERDTreeToggle<CR>

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" NERDTree
"autocmd vimenter * if !argc() | NERDTree | endif
let g:NERDTreeWinPos = "left"
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set t_Co=256
syntax enable
set background=dark
set background=light
" let g:solarized_termcolors=16
let g:solarized_termcolors=256
let g:solarized_visibility="high"
let g:solarized_diffmode="high"
set list
set listchars=trail:\ 
colorscheme solarized
highlight ColorColumn ctermbg=black guibg=black


filetype plugin on
"let g:pydiction_location = '~/.vim/complete-dict'

function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

let NERDTreeIgnore=['\.pyc$']

" Rope AutoComplete
let ropevim_vim_completion=1
let ropevim_extended_complete = 1
let g:ropevim_autoimport_modules = ["os.*","traceback","django.*", "xml.etree"]
imap <c-space> <C-R>=RopeCodeAssistInsertMode()<CR>
set completeopt=menu

"autocmd BufWritePost *.py call Flake8()

" Generate tags with:
" ctags -R -f ~/.vim/tags/python27.ctags /usr/lib/python2.7/
" ctrl-[ to go to the tag under the cursor, ctrl-T to go back.
set tags+=$HOME/.vim/tags/python27.ctags
set tags+=./.ctags


" Autopep8
"function! App8()
"  set noautoread
"  !autopep8 --in-place %
"  let filetype=&ft
"  diffthis
"  vnew | r # | normal! 1Gdd
"  diffthis
"  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
"  set autoread
"endfunction

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" russian hotkeys


" autpaste mode on insert
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" Required to use os x clipboard
set clipboard=unnamed
