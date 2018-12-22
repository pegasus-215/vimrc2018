"""""""""""""""""""""""""""""""""Don't put any lines in your vimrc that you don't understand."""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
"
"����set�����ã������԰Ѻ��������ͨ��:h name�����в�ѯ������
"
"
"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""ԭ����""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function! MyDiff()         "bang(!) is added after the word function, or at the time with <leader>+sv, a waring shows the function already defined.
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""ԭ�������""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" <F2>    switch between absolute number and relative number
" <F5>    run python
" gv      select the content entered in last insert mode
" gcc     comment out the inline code by using tomtom/tcomment_vim
" <space> fold the code
" jk      <esc>
" <c-t>   taglist
" <c-n>   see the list of "completions" for the current word, based on all the words that you have used in the current document.
" <s-d>   go to function defination
" <c-j>   <c-w><c-j>
" <c-k>   <c-w><c-k>
" <c-l>   <c-w><c-l>
" <c-h>   <c-w><c-h>
" <c-o>   go back to the last position
" <leader>nh   :no high light
" <leader>lo   :lopen<cr>
" <leader>lc   :lclose<cr>
" <leader> is changed to ','
" <leader>n    nerdtree
" <leader>u    show the undo tree
" <leader>ev   edit vimrc
" <leader>sv   source vimrc
" gu      uppercase the word in insert mode and normanl mode
" gl      lowercase the word in insert mode and normal MODE
" gt       go to the next tab
" gT       go to the opposit tab
" gV      selects the block of characters you added last time you were in INSERT mode
" :tabnew    open a new tab with a new buffer 
" :sv     split the screen horizentolly
" :vs     split the screen vertiaclly   
" <F2>    toggle the relativenumber
" :PluginInstall���а�װ����װ�ú󣬵�'l'(lower case L),�ͻ���ְ�װϸ�ڡ�
" <s-*>   ���������һ����ǰ�����ָ�������ϡ�
"*************************************************�Լ���ӵĵ�һ���ֿ�ʼ**********************************************************
"20180222
"Ѱ��ʱ��������Ѱ��,��Ѱ��ʱ�����ִ�Сд���������Ѱ�ҵ������д�д��ĸ�������ִ�Сд��Ѱ
set ignorecase smartcase

"*********************************************************************************************************************************
"�ı��������С���ͱ�����ɫ
set guifont=courier\ New:h10
colorscheme desert

" set the default folder while open the gvim
cd C:\Users\hi\Documents\code

" ���ñ����Զ�ʶ��, ����������ʾ  
set fileencodings=utf-8,cp936,big5,euc-jp,euc-kr,latin1,ucs-bom  
set fileencodings=utf-8,gbk  
set ambiwidth=double
set encoding=utf-8

"���������������У�gvim�Ĳ˵�����������
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"������꣬������ģʽ�¿���ʹ����꣬a����˼�����κ�ģʽ�¶�����ʹ����ꡣ
"set mouse=a  

"You can automatically enable syntax coloring and automatic indentation for Python code by adding the following lines to your ~/.vimrc file: 
syntax on

"�Զ�����ļ����Ͳ�������Ӧ������
"This both turns on filetype detection and allows loading of language specific indentation files based on that detection.
filetype indent plugin on

"show the matching part of the pair for [] {} and ()
set showmatch

"It visually selects the block of characters you added last time you were in INSERT mode.
nnoremap gV `[v`] 

"\ is a little far away for a leader. I've found , to be a much better replacement.
let mapleader=","

" edit vimrc/zshrc and load vimrc bindings
" $MYVIMRC is a special Vim variable that points to your /.vimrc file.
nnoremap <leader>ev :tabnew $MYVIMRC<CR> 

nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

"��F5�Գ�����е���
map <F5> :call CompilePY()<CR>
function! CompilePY()
	exec "w"
	exec "!python %"
endfunction

" use the system clipboard as the default clipboard.
set clipboard=unnamed

" set wildmenu �����ʲô��˼��û����

"uppercase the word
nnoremap gu viwU

nnoremap gl viwu

" maxmize the GVIM window. It is said on the web that the command below doesn't support GVIM in GNOME.
autocmd GUIEnter * simalt ~x

" map <esc> to jk
inoremap jk <esc>
vnoremap jk <esc> 
cnoremap jk <esc> 

inoremap  <esc> <nop>
vnoremap  <esc> <nop> 
cnoremap  <esc> <nop> 


nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

"cancel the highlight after the search
nnoremap <leader>nh :nohl<cr>

nnoremap <leader>lo   :lopen<cr>
nnoremap <leader>lc   :lclose<cr>
"*************************************************�Լ���ӵĵ�һ���ֽ���**********************************************************
"***************************************https://www.fullstackpython.com/vim.html**************************************************
" Enable folding
" set foldenable

" foldlevelstart is the starting fold level for opening a new buffer. If it is set to 0, all folds will be closed. Setting it to 99 would guarantee folds are always open. So, setting it to 10 here ensures that only very nested blocks of code are folded when opening a buffer.
" set foldstart = 10

" Folds can be nested. Setting a max on the number of folds guards against too many folds. If you need more than 10 fold levels you must be writing some Javascript burning in callback-hell and I feel very bad for you.
" set foldnestmax=10


set foldmethod=indent " This tells Vim to fold based on indentation. This is especially useful for me since I spend my days in Python. Other acceptable values are marker, manual, expr, syntax, diff. Run :help foldmethod to find out what each of those do.
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

"Indentation
"tabstop is the number of spaces a tab counts for. So, when Vim opens a file and reads a <TAB> character, it uses that many spaces to visually show the <TAB>.
"softabstop is the number of spaces a tab counts for when editing. So this value is the number of spaces that is inserted when you hit <TAB> and also the number of spaces that are removed when you backspace.
"To add the proper PEP8 indentation, add the following to your .vimrc:
"autoindent����ָ��һ�лس������һ����һ��������
"'autoindent' does nothing more than copy the indentation from the previous line, when starting a new line. It can be useful for structured text files, or when you want to control most of the indentation manually, without Vim interfering. 
"'smartindent' automatically inserts one extra level of indentation in some cases, and works for C-like files. 'cindent' is more customizable, but also more strict when it comes to syntax. 
"'smartindent' and 'cindent' might interfere with file type based indentation, and should never be used in conjunction with it. 
"set smartindent
"shiftwidth������<, >������������ʱ�������Ŀո���
"textsidth��ָһ����д�����֣���ľͻ���л��С�
"expandtab�ǰ�expandtabתΪ�ո�
"To add the proper PEP8 indentation
au BufNewFile,BufRead *.py
\ set tabstop=4 |
\ set softtabstop=4 |
\ set shiftwidth=4 |
\ set textwidth=79 |
\ set expandtab |
\ set autoindent |
\ set fileformat=dos

"And for full stack development you can use another au command for each filetype:
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 


"to avoid extraneous whitespace. We can have VIM flag that for us so that it��s easy to spot  and then remove.
"��������һ�����������ҵ��Ľ���취����"BadWhitespace�ȶ���һ�£�Ȼ�����ʹ�á����������е�au����˼�����Զ�ִ�е���˼��These are automatically run for a given file type,�о��ͺ����﷨���Ĺ����е��ظ������Բ����ˡ�
" highlight BadWhitespace ctermbg=blue guibg=gray
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/


"python with virtualenv support, ��ʵ�Ҳ�̫�����ɶ��˼
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" �����к�,�����кź�����к�
" �ο� http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
set nu 
set relativenumber
"---------------------------------------------------------------------------------------------------------------------------------------------
"the snap below is from the link above, in which the author give a Plugin in
"the git, and i have installed it, so maybe the code below may not be used
"anymore. But it can be used to learn how the function is made out.
"�������absolute number��relative number֮���л��Ļ�������������ĳ���
function! NumberToggle()
  set relativenumber!
endfunc

nnoremap <F2> :call NumberToggle()<cr>

"---------------------------------------------------------------------------------------------------------------------------------------------

"����������GitHub vundle��ָ��
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=C:\my_program\Vim\vimfiles\bundle\Vundle.vim
call vundle#begin('C:\my_program\Vim\vimfiles\bundle\')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" :PluginInstall���а�װ����װ�ú󣬵�'l'(lower case L),�ͻ���ְ�װϸ�ڡ�
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tmhedberg/SimpylFold'
"Want to see the docstrings for folded code?
let g:SimpylFold_docstring_preview=1

"Indentation

Plugin 'vim-scripts/indentpython.vim'

Bundle 'Valloric/YouCompleteMe'
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"You can have VIM check your syntax on each save with the syntastic extension:
"in the code window, :lopen and :lclose will open and close the syntax check
"info window. In the syntax check info window, :bdelete will close itself.
Plugin 'scrooloose/syntastic'
" code below is recommended in the github
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Also add PEP8 checking with this nifty little plugin:
Plugin 'nvie/vim-flake8'

"enable all Python syntax highlighting features, Finally, make your code look pretty:
let python_highlight_all=1

"Zenburn is a low-contrast color scheme for Vim. It��s easy for your eyes and designed to keep you in the zone for long programming sessions.
" Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
"
" if has('gui_running')
" set background=dark
let g:solarized_termtrans=1
" colorscheme solarized
" else
" colorscheme zenburn
" endif
"
" call togglebg#map("<F2>")


"�ѳ����еĺ��������б�
Plugin 'vim-scripts/taglist.vim'
nnoremap  <c-t> :TlistToggle<CR>


Plugin 'scrooloose/nerdtree'
"����ֵΪ0��ʱ�򣬴�vim�ǲ�������nerdtree�ģ�ֵΪ1��ʱ�������Զ���nerdtree
let g:nerdtree_tabs_open_on_gui_startup = 0
"���ڴ򿪺͹ر�NERTree
map <leader>n :NERDTreeToggle<CR>

"if you want to use tabs, utilize vim-nerdtree-tabi:
Plugin 'jistr/vim-nerdtree-tabs'
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


"fugitive is a git plugin, �ٿ�����û�������汾����plugin
Plugin 'tpope/vim-fugitive'


"displaying that undo tree in graphical form. Get it and don't look back. Here I've mapped it to ,u, which I like to think of as "super undo".
Plugin 'sjl/gundo.vim'
nnoremap <leader>u :GundoToggle<CR>

" Insert or delete brackets, parens, quotes in pair.
Plugin 'jiangmiao/auto-pairs'


" ������HTML5���﷨֧��
Plugin 'othree/html5.vim'


" use gcc to comment out the code inline;gc to comment out the visual part(more functions u can find)
Plugin 'tomtom/tcomment_vim'

"*****************Plugins below are added by vundle example******************
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}






" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
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
