" -------------------------------------------------------
"
"       EdTheDev's .vimrc 
"
" -------------------------------------------------------

" -----------------------------------------------------------------------
" Let the leader key be ,  
" -----------------------------------------------------------------------
let mapleader=","

" In some cases, code and text settings conflict. 
"   If your environment is primarily one of the other
"   Source the preferred settings last.
" -----------------------------------------------------------------------

" Settings specific to editing email, etc.
source ~/.text_vimrc

" Settings specific to editing python code
source ~/.code_vimrc

<<<<<<< HEAD
=======
" Quickly modify the vimrc
:map <Leader>sv :so $HOME/.vimrc<Cr>
>>>>>>> d92f4fb1ad5e9f50aa9a0374c06b4e37fc5526f9

" Some generally useful settings
" -----------------------------------------------------------------------
set hidden " Allow switching buffers without closing files.
set nocompatible "Do not emulate old bugs
set lbr "don't wrap in the default, utterly stupid way.
filetype on " Detect file types
syntax enable  " Highlight syntax
set vb t_vb= "Flash instead of beep.
set ruler


hi CursorLine guibg=#2d2d2d

"   Do not leave backups in random locations. 
" -----------------------------------------------------------------------
" Put backup and swap files into .backup in current directory if it exists.
"   Otherwise drop them in the system temporary directory.
set backupdir=./.backup,/tmp
set directory=./.backup,/tmp

" Keep the cursor near the center of the screen.
"-----------------------------------------------------------------------
set scrolloff=8         " Number of lines from vertical edge to start scrolling
set sidescrolloff=15 " Number of cols from horizontal edge to start scrolling
set sidescroll=1       " Number of cols to scroll at a time

"   Indentation is great.
"-----------------------------------------------------------------------
" set smartindent
" filetype indent on

"  	Pathogen makes vim plugins easier to manage
"-----------------------------------------------------------------------
" set smartindent
"    ...see http://mirnazim.org/writings/vim-plugins-i-use/
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()

" Needed for NERDCommenter:
"   provides fast easy commenting/uncommenting
"   using Leader+cc
" filetype plugin on


" =======================================================
" iPad and Android keyboards have no ESC Key
" =======================================================
" :imap ;; <esc>
inoremap ii <esc>
" Or just use Ctrl+[

" =======================================================
"  Update screen title
" =======================================================
let &titlestring = hostname() . "[vim(" . expand("%:t") . ")]"
if &term == "screen"
	set t_ts=^[k
	set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
	set title
endif

"set foldtext=MyFold()
"function! MyFold(...)
"  return '+-' . getline(v:foldstart) . ' ... '
"endfunction

" =======================================================
"  Autocompletion
" =======================================================

" Enable various types in omnicomplete
" -------------------------------------------------------
"  OmniComplete from known libraries
" -------------------------------------------------------
"  I am not an Emacs user
"inoremap <Leader>co <C-x><C-o>
"map <Leader>co <C-x><C-o>
"map <Leader>cc <C-x><C-o>

" ex mode commands made easy
nnoremap ; :

"# -----------------------------------------------------------------------
"#   Color schemes! 
"# -----------------------------------------------------------------------
" colorscheme navajo-night
" colorscheme darkeclipse

