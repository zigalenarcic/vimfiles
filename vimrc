" Ziga Lenarcic's .vimrc vim configuration

set nocompatible               " be iMproved
filetype off                   " required!

set langmenu=en_US.UTF-8

if !exists("g:os")
  if has("win64") || has("win32")
    let g:os = "Windows"
  else
    let g:os = substitute(system("uname"), "\n", "", "")
  endif
endif

if g:os == "Windows"
  set rtp+=~/vimfiles/bundle/vundle/
  set rtp+=~/vimfiles/
  call vundle#rc('~/vimfiles/bundle')
  set backupdir=~/vimfiles/tmp
  set undodir=~/vimfiles/tmp/
  " save viminfo file into tmp
  set viminfofile=~/vimfiles/tmp/viminfo
else
  set rtp+=~/.vim/bundle/vundle/
  set rtp+=~/.vim/
  call vundle#rc('~/.vim/bundle')
  set backupdir=~/.vim/tmp
  set undodir=~/.vim/tmp/
  " save viminfo file into tmp
  set viminfofile=~/.vim/tmp/viminfo
endif

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'godlygeek/tabular'
Bundle 'nanotech/jellybeans.vim'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'ervandew/supertab'
Bundle 'ervandew/ag'
Bundle 'osyo-manga/vim-anzu'
Bundle 'sjl/gundo.vim'
Bundle 'farseer90718/Rainbow-Parentheses-Improved-and2'
" defines i, text object (function argument) and shifting args <, >,
Bundle 'PeterRincker/vim-argumentative'
Bundle 'MarcWeber/SmartTag'
" editing in Ag buffer via :EnMasse
Bundle 'Olical/vim-enmasse'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'repeat.vim'
Bundle 'Mark'
Bundle 'OmniCppComplete'
Bundle 'EasyGrep'
Bundle 'FSwitch'
Bundle 'Autocomplpop'

" put newbundles here ^

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""
syntax on
set encoding=utf-8
set fileformats=unix,dos
set backspace=indent,eol,start
set history=100 " remember 100 items for search,command history
set autoread
set noswapfile
set spelllang=en_us
set hidden
set mouse=a
set laststatus=2
set cmdheight=2
"set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

set backup
execute "set backupext=_" . strftime("%Y-%m-%d_%H-%M-%S") . ".vimbackup"

set showcmd
set noerrorbells
set vb t_vb=
set listchars=trail:·,tab:▸\ ,eol:¬
set showbreak=|
set ruler
set scrolloff=2
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.obj,*.bak,*.exe,tags
set bufhidden=hide
set noequalalways " don't resize split windows when closing a window
set langmenu=en_US.UTF-8
set completeopt=menuone

set shortmess=atT
set shellslash " use forward slash on win32 when expanding filenames
set isfname+=32 " add space as a filename character so filename completion works

"""""""""""""""""""""""""""""""
" GUI mode
"""""""""""""""""""""""""""""""

if has("gui_running")
  set lines=40
  set columns=100
  "No icky toolbar, menu or scrollbars in the GUI
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=m
  "full screen expands
  "set fuoptions=maxvert,maxhorz

  if g:os == "Windows"
    set guifont=Anonymous\ Pro:h10
    set rop=type:directx,renmode:1 " use directx and use aliased fonts
  elseif g:os == "Darwin"
    set guifont=Anonymous:h10 " macbook font
  elseif g:os == "OpenBSD"
    set guifont=DejaVu\ Sans\ Mono\ 10
  else
    set guifont=Anonymous\ Pro\ 10
  endif
end

"""""""""""""""""""""""""""""""
" Indenting
"""""""""""""""""""""""""""""""
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent

"""""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""""
set incsearch
set hlsearch
set ignorecase
set smartcase

"""""""""""""""""""""""""""""""
" File locations
"""""""""""""""""""""""""""""""
set tags =./tags; "search for tags from the current file loc (./) upwards
" persistent undo
set undofile

"""""""""""""""""""""""""""""""
" Binds
"""""""""""""""""""""""""""""""
nnoremap ; :
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> <CR> :nohl<CR>

nnoremap <silent> <leader>l :set list!<CR>
nnoremap <silent> <leader>s :set spell!<CR>
nnoremap <silent> <leader>cd :cd %:h<CR>
nnoremap <silent> <F2> :FSHere<CR>
nnoremap <silent> <F3> <Plug>MarkSet
" F7 delete trailing whitespace
nnoremap <F7> :%s/\s\+$//c<CR>
nnoremap <silent> <F8> :GundoToggle<CR>
nnoremap <C-F12> :!ctags -R --c++-kinds=+p --fields=+liaS --extra=+q *<CR>
nnoremap <silent> <F12> :e $MYVIMRC<CR>

nnoremap <silent> <leader>g :execute 'vimgrep /'.@/.'/g **/*.c **/*.h **/*.cpp'<CR>:copen<CR>
nnoremap <silent> Q :QFix<CR>
nnoremap ]c :cnext<CR>
nnoremap [c :cprevious<CR>

" Space will toggle folds
"nnoremap <silent> <space> za

nnoremap <C-S-]> <Esc>:exe "ptjump! " . expand("<cword>")<Esc>
nnoremap <silent> <C-j> :ptnext<CR>
nnoremap <silent> <C-k> :ptprev<CR>

" FuzzyFinder binds
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 300
if g:os == "Windows"
  let g:fuf_dataDir = "~/vimfiles/tmp/fuf"
else
  let g:fuf_dataDir = "~/.vim/tmp/fuf"
endif
nnoremap <silent> <C-b> :FufBuffer<CR>
nnoremap <silent> <C-f> :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <C-a> :FufMruFile<CR>
nnoremap <silent> <C-t> :FufTag<CR>
nnoremap <silent> <C-l> :FufLine<CR>
nnoremap <silent> <C-h> :FufHelp<CR>

nnoremap <silent> <C-]> :call SmartTag#SmartTag("goto")<CR>
nnoremap <silent> <leader>tw :call SmartTag#SmartTag("split")<CR>
nnoremap <silent> <leader>st :call SmartTag#ShowType()<CR>

" These must be nmap
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

"Set color scheme
set t_Co=256
set background=dark
if has("gui_running")
  colorscheme myjellybeans
  "Corrections of the colorsheme
  hi Incsearch  guifg=black     guibg=green  gui=NONE
  hi Search     guifg=black     guibg=yellow      gui=NONE
  hi Folded   guifg=#777777   guibg=NONE   gui=NONE
  hi VertSplit guibg=#444444  guifg=#444444
  hi StatusLine guibg=#444444
  hi StatusLineNC guibg=#444444
else
  colorscheme jellybeans
endif

if has('autocmd')
  augroup quickfix
    au FileType qf
          \ if &buftype == "quickfix" |
          \     setlocal nowrap |
          \ endif
  augroup END


  augroup filetypedetect
    au! BufRead,BufNewFile *.asd      set filetype=lisp
    au! BufRead,BufNewFile *.mac      set filetype=Maxima
    au! BufRead,BufNewFile *.dem      set filetype=Maxima
    au! BufRead,BufNewFile *.php      set filetype=php.html
    au! BufRead,BufNewFile *.html     nnoremap <silent> <F5> :silent ! /Applications/Safari.app/Contents/MacOS/Safari % &<CR>

    au BufNewFile,BufRead *.py setl tabstop=4
    au BufNewFile,BufRead *.py setl softtabstop=4
    au BufNewFile,BufRead *.py setl shiftwidth=4
    au BufNewFile,BufRead *.py setl smarttab
    au BufNewFile,BufRead *.py setl expandtab

    au BufNewFile,BufRead *.md setl tabstop=4
    au BufNewFile,BufRead *.md setl softtabstop=4
    au BufNewFile,BufRead *.md setl shiftwidth=4
    au BufNewFile,BufRead *.md setl smarttab
    au BufNewFile,BufRead *.md setl expandtab

    au BufRead,BufNewFile *.tex     nnoremap <silent> <F5> :silent VimProcBang pdflatex % <CR>

    au BufRead,BufNewFile *.cpp     nnoremap <buffer> <F1> :silent exec "!open http://www.cplusplus.com/".expand("<cword>")<CR>
    au BufRead,BufNewFile *.c     nnoremap <buffer> <F1> :silent exec "!open http://www.cplusplus.com/".expand("<cword>")<CR>
    au BufRead,BufNewFile *.h     nnoremap <buffer> <F1> :silent exec "!open http://www.cplusplus.com/".expand("<cword>")<CR>

    au BufRead,BufNewFile *.s     nnoremap <F5> :!tcc -run -nostdlib %:p<CR>
    au BufRead,BufNewFile *.S     nnoremap <F5> :!tcc -run -nostdlib %:p<CR>
    au BufRead,BufNewFile *.c     nnoremap <F5> :!tcc -run %:p<CR>
  augroup END
endif

"""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""

" Lisp mode
let g:lisp_rainbow = 1

" VISUAL SEARHC "
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy/<C-R><C-R>=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy?<C-R><C-R>=substitute(
      \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>

au! bufwritepost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif

" toggles the quickfix window.
command! -bang -nargs=? QFix call QFixToggle(<bang>0)

function! QFixToggle(forced)
  if exists("g:qfix_win") && a:forced == 0
    cclose
  else
    execute "copen " . 10
  endif
endfunction

" used to track the quickfix window
augroup QFixToggle
  autocmd!
  autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
  autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END

" Common code for encodings
function! SetFileEncodings(encodings)
  let b:myfileencodingsbak=&fileencodings
  let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
  let &fileencodings=b:myfileencodingsbak
  unlet b:myfileencodingsbak
endfunction

" .NFO specific
au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

" diff against last
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

let g:SuperTabDefaultCompletionType = "context"

let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme = 'bubblegum'
let g:airline_inactive_collapse = 0
let g:airline#extensions#anzu#enabled = 0

" indentation of C++
set cino+=N-s "dont indent inside namespace {}
set cino+=t0 " dont indent return type of func if on separate line

" Green highlighting jumps or function returns in C and C++
highlight Jumps guifg=#80e050
augroup additional_c_syntax
  autocmd!
  autocmd Syntax c syntax keyword Jumps return goto continue
  autocmd Syntax cpp syntax keyword Jumps return goto continue
augroup end
