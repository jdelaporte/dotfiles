" -------------------------------------------------------
"
"       EdTheDev's .vimrc 
"
" -------------------------------------------------------

" Auto-complete 
" Ctrl+X, Ctrl+P - complete from within current file.

" Run the python!!!
map <F5> :!python %:r.py
map <F4> :!make html
map <F3> :!hg ci %:r.*

" Some completion settings
set complete=.,b,u,]
set wildmode=longest,list:longest
set completeopt=menu,preview
set expandtab


" SpellCheck
se spell

"  	Pathogen makes vim plugins easier to manage
"    ...see http://mirnazim.org/writings/vim-plugins-i-use/
" call pathogen#runtime_append_all_bundles()
" call pathogen#helptags()

" Needed for NERDCommenter:
"   provides fast easy commenting/uncommenting
"   using Leader+cc
" filetype plugin on


" Allow switching buffers without closing files.
set hidden

" List python files...
" map <Leader>lp :.!find .. -name \*.py -print | grep -v __init__.py


" -----------------------------------------------------------------------
" Let the leader key be ,  
" -----------------------------------------------------------------------
let mapleader=","

" =======================================================
" iPad and Android keyboards have no ESC Key
" =======================================================
" These are two slow..
"inoremap kj <Esc>
"inoremap jj <Esc>
"imap jj <Esc>
" map jk <esc>
" noremap ,e <esc>
" :imap ;; <esc>
" Just use Ctrl+[
inoremap ii <esc>

" Abbreviations
" ab pm Project Manager
" ab lead Lead Developer
" ab dev Developer

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

" CSV File Type
" =================


" =======================================================
"  Text documents
" 	Treat most files like document files.
" 	Act as much like Microsoft Word as is reasonable.
" =======================================================


" Wrap lines like a text editor, not a code editor.
set wrap
set linebreak
set nolist
set lbr "don't wrap in the default, utterly stupid way.
" set paste " Expect to paste in text, when this is a normal text document.

" Do not add line breaks into newly entered text.
set wrapmargin=0
set textwidth=0

" Allow up and down into soft line wraps...
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Shared Clipboard
set clipboard=unnamed

" Do not show line numbers
set nonumber

" Paste in text without too much trouble

" Fold based on indentation level.
set foldmethod=indent
set foldlevel=20
"set foldtext=MyFold()
"function! MyFold(...)
"  return '+-' . getline(v:foldstart) . ' ... '
"endfunction

" Use short tabs for text documents 
set tabstop=4 
set shiftwidth=4

" =======================================================
" Markdown
" =======================================================
" Wrap lines like a text editor, not a code editor.
"au BufEnter *.mkd setlocal textwidth=79
"au BufEnter *.mkd setlocal wrapmargin=5
"au BufEnter *.mkd setlocal wrap
"au BufEnter *.mkd setlocal linebreak
"au BufEnter *.mkd setlocal nolist

" =======================================================
"  Autocompletion
" =======================================================

" Enable various types in omnicomplete
" -------------------------------------------------------
autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType c set omnifunc=ccomplete#Complete

"  OmniComplete from known libraries
" -------------------------------------------------------
"  I am not an Emacs user
"inoremap <Leader>co <C-x><C-o>
"map <Leader>co <C-x><C-o>
"map <Leader>cc <C-x><C-o>

" Previous matching word (in file)
"inoremap <Leader>cp <C-x><C-p>
"map <Leader>cp <C-p>

" Next matching word (in file)
"inoremap <Leader>cn <C-x><C-n>
"map <Leader>cn <C-n>

" -----------------------------------------------------------------
"    Wiki link stuff
" -----------------------------------------------------------------
map <Leader>ll :e <cfile><cr>
map <Leader>lw :e /home/delaport/Dropbox/notes<cr>
map <Leader>lh :e /home/delaport/Dropbox/notes<cr>
map <Leader>lb :buffers<Cr>
"map ,lj :bp<Cr>
"map ,lk :bn<Cr>

" Use tabs for outlining in wiki files
"au BufEnter *.mkd setlocal tabstop=2 
"au BufEnter *.mkd setlocal shiftwidth=2
"au BufEnter *.wiki setlocal tabstop=2 
"au BufEnter *.wiki setlocal shiftwidth=2

" =======================================================
"  Python files
" =======================================================

" Show line numbers
au Filetype python setlocal number
" PEP8
au FileType python setlocal expandtab
au FileType python setlocal tabstop=4
au FileType python setlocal shiftwidth=4
au FileType yml setlocal shiftwidth=4

" Never wrap lines...
au FileType python setlocal textwidth=0

" Do not set paste for Python files...
" au FileType python setlocal nopaste

" Automatically highlight lines over 80 characters.
au FileType python let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
au BufWinEnter *.py let w:m1=matchadd('Search', '\%<81v.\%>77v', -1)
" Color lines that are too long them red.
au FileType python let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
au BufWinEnter *.py let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" =======================================================
" Editing the Vimrc File
" =======================================================
" au FileType vim setlocal number

" =======================================================
" =======================================================

"    Confluence headers
" -------------------------------------------------------
au FileType *.mkd :map <Leader>h1 :.!make_header -t confluence -l 1<Cr>2j
au BufEnter *.mkd :map <Leader>h2 :.!make_header -t confluence -l 2<Cr>2j
au BufEnter *.mkd :map <Leader>h3 :.!make_header -t confluence -l 3<Cr>2j
au BufEnter *.mkd :map <Leader>h4 :.!make_header -t confluence -l 4<Cr>2j
au BufEnter *.mkd :map <Leader>h5 :.!make_header -t confluence -l 5<Cr>2j

"   Vimrc headers
" -------------------------------------------------------
au FileType vim map <Leader>h1 :.!make_header -l 1 -t vim<Cr>2j
au FileType vim map <Leader>h2 :.!make_header -l 2 -t vim<Cr>2j
au FileType vim map <Leader>h3 :.!make_header -l 3 -t vim<Cr>2j

"  Autocompletion
" -------------------------------------------------------
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


" -----------------------------------------------------------------------
"
"   List some things.
"
" -----------------------------------------------------------------------
" List all questions
" map <Leader>hq :.!list-questions %<Cr>
" map <Leader>hl :!list-headers %<Cr>


" .vimrc settings that compliment EdTheDev's Python source code.
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
" 		https://bitbucket.org/edthedev/edthedev
" Created by Edward Delaporte <edthedev@gmail.com>, http://edthedev.com
" -----------------------------------------------------------------------
"
"  How to use this file:    
"
" You can append this to your 
" own vimrc by adding the following line to your vimrc (uncommented):
" source ~/edthedev/vimrc_edthedev 

" Make macros easier on the hands...
" map Q @@

"    Status Line
" -----------------------------------------------------------------
"
" A nice status line.
" set statusline=%F%m%r%h%w\ [type=%Y]\ [%p%%]\ [len=%L]
" set laststatus=2 " Always show the statusline on the 2nd last row


" automatically reload vimrc when it's saved
" au BufWritePost .vimrc so ~/.vimrc

set laststatus=2
set statusline=
set statusline +=%1*
set statusline +=b%n            "buffer number
set statusline +=\  
set statusline +=%F%m%r%h%w
set statusline +=\  
set statusline +=%l\/%L          
set statusline +=%4v              "virtual column number
set statusline +=%1*                     " return to background color
" set statusline +=%2*%m%*                "modified flag
" set statusline+=%{rvm#statusline()}  
" set statusline+=[%{strlen(&fenc)?&fenc:&enc}]
" set statusline+=%{fugitive#statusline()}\    
" set statusline +=%5*%{&ff}%*            "file format
" set statusline +=%3*%y%*                "file type
" set statusline +=%2*0x%04B\ %*          "character under cursor

"      Send stuff to Wordpress
" -----------------------------------------------------------------
map <Leader>tw :!send-to-wordpress %<Cr>

" -----------------------------------------------------------------------
"
"   " Quick text header blocks <Leader>t
"
" -----------------------------------------------------------------------
" Plain text headers
map <Leader>h1 :.!make_header -l 1<Cr>2j
map <Leader>h2 :.!make_header -l 2<Cr>2j
map <Leader>hl :!list-headers %<Cr>
" au BufRead,BufNewFile vim map <Leader>h2 :.!make_header -l 2 -c vimrc<Cr>2j

filetype on

" Test

" Handle VIMRC files with a different comment.
" This line does not work...
" autocmd FileType *vimrc* :map <Leader>2 :.!make_header -l 2 -c vimrc<Cr>2j
" au BufRead,BufNewFile *vimrc :map<Leader>2 :

" \s to add a big 'SCRATCH' ASCII art block for indicating where your scratch notes begin or end.
map <Leader>ts :r!scratch<Cr>

" map <Leader>tb :.!list_to_bullets<Cr>

" -------------------------------------------------------
"
"   Editor Helper Stuff
"
" -------------------------------------------------------

" Bullet 
" map <Leader>ob :.!indent_line<Cr>

" =======================================================
" TODO Management 
" =======================================================
" Done / Todo
map <Leader>od :.!toggle_task<Cr>$ 
map <Leader>d :.!toggle_task<Cr>$ 

" Sort file by completed vs TODO lines
:map <Leader>os :%!done_to_top<Cr>

" List organizer progress of TODO / DONE / WAITING
:map <Leader>op :!progress %<Cr>

" Gather tags!!
:map <Leader>ot :%!gather_tags 
" (insert) Updated timestamp
:map <Leader>ou :r!adddatetime<Cr>
" Waiting 
:map <Leader>ow :.!toggle_task -w<Cr>$ 

" New file from selected
:vmap <Leader>tf !new_file --filename=

" Sort lines!!
:map <Leader>ss :'<,'> !sort<Cr>

" =======================================================
" Graphing with graphiz
" =======================================================
:map <Leader>tg :!make-graph %:r<Cr>
:map <Leader>te :!ebook-convert %:r.html %:r.epub<Cr>

" -----------------------------------------------------------------------
"
"   Minion stuff <Leader>o
"
" -----------------------------------------------------------------------
" Archive the current file and close it.
:map <Leader>ma :!minion --action=archive --filename=%<Cr>:q<Cr>
" Organizer help
:map <Leader>mh :!minion --help<Cr>$

" New Note
:map <Leader>mn :!minion --new-note

" Review this file
:map <Leader>mr :!minion --filename %<Cr>:q<Cr>

" -----------------------------------------------------------------------
"
"   " Some Python specific stuff
"
" -----------------------------------------------------------------------
" :map <Leader>pc :!check-script %:p:h/%<Cr>
:map <Leader>pc :!hg ci%<Cr>
:map <Leader>pd :!pydoc %:r<Cr>
:map <Leader>pe :!tail /var/log/apache2/error.log
:map <Leader>ph :!check-script --html %<Cr>
:map <Leader>pm :!listmethods %<Cr>
" :map <Leader>pl :!pylib 
:map <Leader>pl :!pylint % > /tmp/out.txt<Cr>:e /tmp/out.txt<Cr>
:map <Leader>pn :set nu!
" :map <Leader>pr :!sudo /etc/init.d/apache2 restart<Cr>

" :map <Leader>pv :!w3m http://192.168.1.9/scripts<Cr> 
:map <Leader>pr :!python % 

" Random stuff
:map <Leader>su :!sum-up %<Cr>
:map <Leader>sv :so $HOME/.vimrc<Cr>
" :map <Leader>w :w<Cr>

" Fiddly prototype stuff...
":imap <Leader>d <Esc>:exe "%!movedown " . line(".")<Cr>i
":map <Leader>d :exe "%!movedown " . line(".")<Cr>

" -----------------------------------------------------------------------
"
"		Easter Eggs - Uncomment at your own risk.
"
" -----------------------------------------------------------------------

" Move between files faster with NERDTree shortcuts. 
" :so $EDTHEDEV/vim/NERDTree
" The .vimrc of Edward Delaporte. http://edthedev.com/vimrc
"
" Stuff to try out and remove if it turns out not to work as needed.
" filetype plugin on
" set autochdir


" -----------------------------------------------------------------------
" Second section on editing...
" Stuff learned from vimbits.com. 
" -----------------------------------------------------------------------

" Easier navigation of splits...
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l


" function! SuperTab()
"    if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
"        return "\<Tab>"
"    else
"        return "\<C-n>"
"    endif
"endfunction
" imap <Tab> <C-R>=SuperTab()<CR>

" Expand tabs magic. 
" nnoremap <leader>T :set expandtab<cr>:retab!<cr>

" Toggle invisibles
" noremap <Leader>i :set list!<CR>

" ex mode commands made easy
nnoremap ; :


" =======================================================
"  Commands
" =======================================================
" map <Leader>tc :!cat % | grep TODO | wc 

" Use arrow keys to change buffers.
" noremap <left> :bp<CR>
" noremap <right> :bn<CR>

" Go to home and end using capitalized directions
noremap H ^
noremap L $

set scrolloff=8         " Number of lines from vertical edge to start scrolling
set sidescrolloff=15 " Number of cols from horizontal edge to start scrolling
set sidescroll=1       " Number of cols to scroll at a time

" Force period and parens to deliniate words
" set iskeyword-=\.
" set iskeyword-=\(
" set iskeyword-=\)



"# -----------------------------------------------------------------------
"#   Use EdTheDev Vim Scripts!
"#      https://bitbucket.org/edthedev/edthedev/vimrc_edthedev
"# -----------------------------------------------------------------------

"# -----------------------------------------------------------------------
"#   Color schemes! 
"# -----------------------------------------------------------------------
" colorscheme navajo-night
colorscheme darkeclipse

"   Do not leave backups in random locations. 
" -----------------------------------------------------------------------
" Put backup and swap files into .backup in current directory if it exists.
"   Otherwise drop them in the system temporary directory.
set backupdir=./.backup,/tmp
set directory=./.backup,/tmp



" 	Appearance   
" -----------------------------------------------------------------------

" set cursorline
hi CursorLine guibg=#2d2d2d
set ruler
" set textwidth=8000
set vb t_vb= "Flash instead of beep.
" 	Editing
" -----------------------------------------------------------------------
"
"
" Tired of typing :Wq
cnoreabbrev W w

" :map <Leader>h ^
" map <Leader>. $
" Make backspace work like most other apps.
" set backspace=2 " make backspace work like most other apps
set backspace=indent,eol,start

set ignorecase
set nocompatible "Don't emulate old vi bugs.
set showmatch "Parenthesis matching.
"set pastetoggle=<C-P> " Ctrl-P toggles paste mode
"set paste "Don't suck at pasting in text.
" set foldmethod=marker -- breaks on some systems
set incsearch "Search as I type

" =======================================================
" Editing with Tabs
" =======================================================

"   Indentation is great.
"-----------------------------------------------------------------------
" set smartindent
" filetype indent on

" Re-select visual block after indent/outdent.
vnoremap < <gv
vnoremap > >gv

" =======================================================
" Minion shortcuts
" =======================================================
" Review the current file in Minion.
" https://bitbucket.org/edthedev/minion
map <Leader>or :!minion --filename %<Cr>:q<Cr>

" =======================================================
" Settings for writing Kindle books
" =======================================================
map <Leader>th :!/home/delaport/bin/multimarkdown % > %:r.html<Cr>
map <Leader>vh :!chromium-browser %:r.html&<Cr>
" Pandoc - Markdown to HTML
" :map <Leader>th :!pandoc -B body-tag.html --toc -f markdown -t html % -o %:r.html<Cr>
" :map <Leader>th :!pandoc --toc -f markdown -t html % -o %:r.html<Cr>

" Pandoc/markdown2pdf - Markdown to PDF
:map <Leader>kp :!markdown2pdf %<Cr>
" KindleGen - HTML to MOBI
:map <Leader>km :!$HOME/bin/KindleGen/kindlegen "%:r.html" -o "%:r.mobi"<Cr>
" Open the html...
" :map <Leader>tv :!google-chrome %:r.html&<Cr>

" -------------------------------------------------------
"
"    Settings I once used, but use no longer.
"
" -------------------------------------------------------
"
" TagBar
" nmap <F8> :TagbarToggle<CR> 
" nmap <Leader>ht :TagbarToggle<CR> 
" :autocmd BufEnter *.py nested TagbarOpen
" Preview the mobi file....I got nothing..
" :map <Leader>to :!calibre %:r.mobi
" :map <Leader>to :!fbreader %:r.mobi
" FBReader? something else? These all are lame.
" :unmap <Leader>h
"
"
" For Solaris arrow keys:
" map! ^[OA ^[ka
" map! ^[OB ^[ja
" map! ^[OD ^[i
" map! ^[OC ^[la
"
"
" command -range=% -nargs=* Textbar <line1>,<line2>! \textbar <args>
" Type :help options within vim to get a complete list of options.
"
"" Vimux 
" Prompt for a command to run
" map rp :PromptVimTmuxCommand
"
" " Run last command executed by RunVimTmuxCommand
" map rl :RunLastVimTmuxCommand
"
" " Inspect runner pane
" map ri :InspectVimTmuxRunner
"
" " Close all other tmux panes in current window
" map rx :CloseVimTmuxPanes
"
" " Interrupt any command running in the runner pane
" map rs :InterruptVimTmuxRunner

" au FocusLost * :wa " Automatically save buffers when focus is lost.


" =======================================================
" Highlighting
" =======================================================

syntax enable 
" set nohls "Do not highlight search matches.
" syntax on " overrides your settings...

" syn keyword mySubj Subject 
" hi link mySubj Title

" Recolor when lost...
" map <Leader>c :syntax sync fromstart

" Print in black and white. SRSLY.
" map <C-p> :color print_bw<CR>:hardcopy<CR>:color darkeclipse<CR>:syn on<CR>


" These are markdown files...

" Actually use my .vim/syntax directory...
" au BufEnter *.txt set syntax=mkd

" Recognize some file types...
au BufNewFile,BufRead *.txt set filetype=txt
" au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd


" VimRoom
nnoremap <Leader>V VimroomToggle

let vimroom_background = "black"
let vimroom_min_sidebar_width = 3
let vimroom_navigational_keys = 1
let vimroom_scrolloff = 999
let vimroom_sidebar_height = 1

" Use ReStructuredText highlighting for all text files.
au FileType text set syntax=rest
