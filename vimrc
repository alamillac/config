" Sample .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012

" Unmap the arrow keys
no <down> ddp
no <left> <Nop>
no <right> <Nop>
no <up> ddkp
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

" ============================================
" Note to myself:
" DO NOT USE <C-z> FOR SAVING WHEN PRESENTING!
" ============================================


" ============================================
" to use Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between here and filetype plugin indent on.
" Install Plugins - Launch vim and run :PluginInstall


" Snippets ==================================
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-n>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" end Snippets ===============================

" powerline ==================================

Plugin 'bling/vim-airline'

" ============================================

" Code Completion ============================
" YouCompleteMe
Plugin 'Valloric/YouCompleteMe'

" end Code Completion ========================

" linenumber plugin
Plugin 'myusuf3/numbers.vim'

" show marks
Plugin 'kshenoy/vim-signature'
" ============================================

" handlebars plugin
Plugin 'mustache/vim-mustache-handlebars'

" grep like
Bundle 'mileszs/ack.vim'

" CoffeeScript plugin
Bundle 'kchmck/vim-coffee-script'

" time recorder https://wakatime.com/
Bundle 'wakatime/vim-wakatime'

" NerdTree
Bundle 'scrooloose/nerdtree'

" Linter plugin
" Plugin 'timheap/linters.vim'
Plugin 'scrooloose/syntastic'

" CtrlP Fuzzy file finder
Plugin 'ctrlpvim/ctrlp.vim'

" JavaScript bundle for vim, this bundle provides syntax highlighting and
" improved indentation
Plugin 'pangloss/vim-javascript'

" Selecta like finder used with CtrlP
" Plugin 'sergei-dyshel/vim-abbrev-matcher'

" vim-minizinc
" MiniZinc is a medium-level constraint modelling language. It is high-level
" enough to express most constraint problems easily, but low-level enough that
" it can be mapped onto existing solvers easily and consistently. It is a
" subset of the higher-level language Zinc. We hope it will be adopted as a
" standard by the Constraint Programming community.
Plugin 'vale1410/vim-minizinc'

let g:syntastic_python_flake8_post_args='--ignore=E501'

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" Insert newline without entering insert mode
"nmap <S-Enter> O<Esc>j
"nmap <CR> o<Esc>k

" search for a pattern in all open buffers
nnoremap <leader>/ :bufdo :vimgrepadd! <C-r><C-w> %<CR>:copen<CR>

" enable 256 colors in vim
set t_Co=256

" highlighting current line
set cursorline

" line number plugin
set number
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>

" Open a new tab and search for something
nmap <leader>a :tab split<CR>:Ack ""<left>

" Search the word under de cursor
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set clipboard=unnamed

" Remap esc key
inoremap jj <ESC>

" Mouse and backspace
"" set mouse=a  " on OSX press ALT and click
"" set bs=2     " make backspace behave like normal again

" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-n>`` stands for ``CTRL+n``
"" noremap <C-n> :nohl<CR>
"" vnoremap <C-n> :nohl<CR>
"" inoremap <C-n> :nohl<CR>


" Quicksave command
"" noremap <C-Z> :update<CR>
"" vnoremap <C-Z> <C-C>:update<CR>
"" inoremap <C-Z> <C-O>:update<CR>


" Quick quit command
"" noremap <Leader>e :quit<CR>  " Quit current window
"" noremap <Leader>E :qa!<CR>   " Quit all windows


" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" replace a word for another saved in the 0 register
nmap <Leader>rw viw"0p

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
"" vnoremap <Leader>s :sort<CR>

" Buffer naviation
map <M-Left> :bprevious<CR>
map <M-Right> :bnext<CR>

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Make tab in v mode work like I think it should (keep highlighting):
vmap <tab> >gv
vmap <s-tab> <gv

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" With the following mapping a user can press F5 to delete all trailing
" whitespace. The variable _s is used to save and restore the last search
" pattern register (so next time the user presses n they will continue their
" last search), and :nohl is used to switch off search highlighting (so
" trailing spaces will not be highlighted while the user types). The e flag is
" used in the substitute command so no error is shown if trailing whitespace is
" not found. Unlike before, the substitution text must be specified in order to
" use the required flag.
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
"" set t_Co=256
" colorscheme blue_comments
" colorscheme apprentice
colorscheme molokai

" Enable syntax highlighting
" You need to reload this file for the change to apply
"" filetype off
filetype plugin indent on
syntax on

" Showing line numbers and length
"" set number  " show line numbers
"" set tw=79   " width of document (used by gd)
"" set nowrap  " don't automatically wrap on load
"" set fo-=t   " don't automatically wrap text when typing
"" set colorcolumn=80
"" highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
"" vmap Q gq
"" nmap Q gqap


" stop highlighting search
map <Leader><Space> :noh<CR>


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show  tab characters. Visual Whitespace.
set list
set listchars=tab:>.

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Set status line
" set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

" Always display a status line at the bottom of the window
set laststatus=2

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" Syntastic plugin
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "!"
let g:syntastic_java_javac_config_file_enabled = 1
let g:syntastic_javascript_checkers = ['eslint']

" NERDTree
nmap <leader>t :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" ============================================================================
" Python IDE Setup
" ============================================================================

map <Leader>b Oimport ipdb; ipdb.set_trace()  # BREAKPOINT<C-c>

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
"" set nofoldenable

" ************************************************************************
" B E G I N  A U T O C O M M A N D S
"
if has("autocmd")

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

endif " has("autocmd")

" ************************************************************************
" A B B R E V I A T I O N S
"
abbr #b /************************************************************************
abbr #e  ************************************************************************/

" ************************************************************************
" Syntax color
"
au BufNewFile,BufRead *.ejs set filetype=html

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
" function! SelectaCommand(choice_command, selecta_args, vim_command)
"   try
"     silent let selection = system(a:choice_command . " | selecta " . a:selecta_args)
"   catch /Vim:Interrupt/
"     " Swallow the ^C so that the redraw below happens; otherwise there will be
"     " leftovers from selecta on the screen
"     redraw!
"     return
"   endtry
"   redraw!
"   exec a:vim_command . " " . selection
" endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
" nnoremap <leader>f  :tab split<CR>:call SelectaCommand('select_text_files.sh', "", ":e")<cr>
nnoremap <leader>f :CtrlP<CR>
" let g:ctrlp_user_command = 'find %s -type f'
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " Map for matcher
  " let g:abbrev_matcher_grep_exe = 'ag'
  " let g:abbrev_matcher_grep_args = '--numbers'
endif

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Matcher utility used in CtrlP to find better results (it is similar to
" selecta)
" let g:ctrlp_match_func = { 'match': 'ctrlp#abbrev_matcher#match' }

noremap Q !!sh<CR>

" FoldMethod
set foldmethod=syntax
au BufWinLeave * mkview
au BufWinEnter * silent loadview
