" Ziga Lenarcic's .vimrc vim configuration
"
set nocompatible               " be iMproved
filetype off                   " required!

set langmenu=en_US.UTF-8

set rtp+=~/vimfiles/bundle/vundle/
set rtp+=~/vimfiles/
call vundle#rc('~/vimfiles/bundle')

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'scrooloose/nerdtree'
"Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-vinegar'
Bundle 'szw/vim-g'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'msanders/snipmate.vim'
"Bundle 'tomtom/tcomment_vim'
Bundle 'godlygeek/tabular'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'taglist.vim'
Bundle 'repeat.vim'
"Bundle 'matchit.zip'
Bundle 'Mark'
Bundle 'vim-scripts/svndiff.vim'
Bundle 'vim-scripts/vcscommand.vim'
"Bundle 'wesleyche/SrcExpl'

Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'ervandew/supertab'
Bundle 'ervandew/ag'

Bundle 'osyo-manga/vim-anzu'
Bundle 'thinca/vim-quickrun'

Bundle 'kana/vim-submode'
Bundle 'kana/vim-operator-user'

Bundle 'OmniCppComplete'

Bundle 'EasyGrep'
Bundle 'sjl/gundo.vim'

Bundle 'FSwitch'

Bundle 'farseer90718/Rainbow-Parentheses-Improved-and2'
Bundle 'ivanov/vim-ipython'
Bundle 'davidhalter/jedi-vim'
Bundle 'ap/vim-css-color'

Bundle 'junegunn/vim-peekaboo'
Bundle 'nhooyr/neoman.vim'

" editing in Ag buffer via :EnMasse
Bundle 'Olical/vim-enmasse'

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

set backupdir=~/vimfiles/tmp
set backup
execute "set backupext=_" . strftime("%Y-%m-%d_%H-%M-%S") . ".vimbackup"

set showcmd
set noerrorbells
set vb t_vb=
set listchars=trail:·,tab:▸\ ,eol:¬
set showbreak=|
set ruler
set number "numbered lines
set scrolloff=2
set wildmenu
set wildmode=list:longest
set bufhidden=hide

set shortmess=atT

nnoremap ; :


"""""""""""""""""""""""""""""""
" GUI mode
"""""""""""""""""""""""""""""""

if has('gui')
  set lines=40
  set columns=100
  "No icky toolbar, menu or scrollbars in the GUI
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=m
  "full screen expands
  "set fuoptions=maxvert,maxhorz

  if has('win32')
    set guifont=Anonymous\ Pro:h13
  else
    set guifont=Anonymous:h10 " macbook font
  endif
end

"""""""""""""""""""""""""""""""
" Indenting
"""""""""""""""""""""""""""""""
set tabstop=2
set expandtab
set shiftwidth=2
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
" Binds
"""""""""""""""""""""""""""""""
let mapleader = " " " space is the leader

" F7 delete trailing whitespace
noremap <F7> :%s/\s\+$//c<CR>
nmap <silent> <leader>l :set list!<CR>
nmap <silent> <leader>s :set spell!<CR>
map <silent> <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

set wildignore=*.o,*.obj,*.bak,*.exe,tags

noremap <silent> <F2> :FSHere<CR>
nmap <unique> <silent> <F3> <Plug>MarkSet
noremap <silent> <F4> :TlistToggle<CR>
noremap <silent> <F8> :GundoToggle<CR>

let NERDTreeIgnore = ['\~$', '\.o[0-9]*$' ]

" FuzzyFinder binds
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 300
nnoremap <silent> <C-b> :FufBuffer<CR>
nnoremap <silent> <C-f> :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <C-a> :FufMruFile<CR>
nnoremap <silent> <C-t> :FufTag<CR>
nnoremap <silent> <C-l> :FufLine<CR>
nnoremap <silent> <C-h> :FufHelp<CR>

nmap <silent> <D-j> <C-w>j
nmap <silent> <D-k> <C-w>k
nmap <silent> <D-h> <C-w>h
nmap <silent> <D-l> <C-w>l
inoremap jj <ESC>
noremap <silent> <cr> :nohl<cr>

"Set color scheme
set t_Co=256
set background=dark
colorscheme myjellybeans
"Corrections of the colorsheme
hi Incsearch  guifg=black     guibg=green  gui=NONE
hi Search     guifg=black     guibg=yellow      gui=NONE
hi Folded   guifg=#777777   guibg=NONE   gui=NONE


"""""""""""""""""""""""""""""""
" Folding
"""""""""""""""""""""""""""""""
"set nofoldenable
"set foldmethod=marker
"set foldmarker={{{,}}}
"Set space to toggle a fold
"nnoremap <space> zA
"nnoremap <F6> :set foldenable!<CR>

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
    au! BufRead,BufNewFile *.html     map <silent> <F5> :silent ! /Applications/Safari.app/Contents/MacOS/Safari % &<CR>

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

    au BufRead,BufNewFile *.tex     map <silent> <F5> :silent VimProcBang pdflatex % <CR>
  augroup END
endif


"""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""

" Taglist
let Tlist_Inc_Winwidth       = 0
let Tlist_Enable_Fold_Column = 0
let Tlist_Auto_Highlight_Tag = 0
let Tlist_Show_One_File      = 1
let Tlist_Show_Menu          = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Auto_Highlight_Tag = 0
if has('win32')
  let Tlist_Ctags_Cmd          = 'C:/bin/ctags.exe'
else
  let Tlist_Ctags_Cmd          = '~/usr/bin/ctags'
endif
let tlist_cpp_settings = 'c++;c:class;f:function'

set tags =./tags; "search for tags from the current file loc (./) upwards

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


"au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.slf,*.slv,*.glsl setf glsl

"au FileType xhtml,xml so ~/.vim/bundle/autoclosetag/html_autoclosetag.vim


"let g:ConqueTerm_Color = 0
"nnoremap <silent> <leader>c :ConqueTermSplit bash --login<CR>

let g:yankring_history_dir = '$HOME/vimfiles/tmp/'
let g:yankring_min_element_length = 2


au bufwritepost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod a+x <afile> | endif | endif

" persistent undo
set undodir =~/vimfiles/tmp/
set undofile

" toggles the quickfix window.
command -bang -nargs=? QFix call QFixToggle(<bang>0)
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

nnoremap <silent> <leader>g :execute 'vimgrep /'.@/.'/g **/*.c **/*.h **/*.cpp'<CR>:copen<CR>
nnoremap <silent> Q :QFix<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

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

" Space will toggle folds!
"nnoremap <space> za

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
"map N Nzz
"map n nzz


let g:SuperTabDefaultCompletionType = "context"


" Easy tags
"let g:easytags_cmd = 'C:/bin/ctags.exe'
"let g:easytags_on_cursorhold = 0
"let g:easytags_events = ['BufWritePost']
"let g:easytags_dynamic_files = 1
"highlight link cMember Special

" cTypeTag cEnumTag cPreProcTag cFunctionTag cMemberTag

"let g:clang_exec='C:/clang/bin/clang.exe'
"let g:clang_complete_auto=0

set completeopt=menuone " we don't want no stinking preview window poping up, messing the UX

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+liaS --extra=+q *<CR>

set langmenu=en_US.UTF-8

map <C-e> :silent !start explorer %:p:h:gs?\/?\\\\\\?<CR>

autocmd FileType int-* call s:interactive_settings()
function! s:interactive_settings()
endfunction

"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep=''
let g:airline_right_sep=''

" Anzu plugin
" mapping

nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
nmap * <Plug>(anzu-star-with-echo)
nmap # <Plug>(anzu-sharp-with-echo)

noremap <silent> <F12> :e $MYVIMRC<CR>

nnoremap <C-S-]> <Esc>:exe "ptjump! " . expand("<cword>")<Esc>
nnoremap <silent> <C-j> :ptnext<CR>
nnoremap <silent> <C-k> :ptprev<CR>

let g:airline_theme = 'bubblegum'
hi VertSplit guibg=#444444  guifg=#444444
hi StatusLine guibg=#444444
hi StatusLineNC guibg=#444444

let g:airline_inactive_collapse = 0
let g:airline#extensions#anzu#enabled = 0

" indentation of C++

set cino+=N-s "dont indent inside namespace {}
set cino+=t0 " dont indent return type of func if on separate line

nnoremap <silent> j gj
nnoremap <silent> k gk

nnoremap <left>  :vertical resize -5<CR>
nnoremap <right> :vertical resize +5<CR>
nnoremap <up>    :resize -5<CR>
nnoremap <down>  :resize +5<CR>


nnoremap <Esc> :echo Tlist_Get_Tag_Prototype_By_Line()<CR>

let g:EchoFuncAutoStartBalloonDeclaration = 0
"set noballooneval " don't eval balloonexpr on mouse-hover (it gets slow when there are lots of tags)

