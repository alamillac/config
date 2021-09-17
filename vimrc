" Unmap the arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>


" ============================================
" to use vim-plug

call plug#begin('~/.vim/plugged')

" Keep Plugin commands between here and filetype plugin indent on.
" Install Plugins - Launch vim and run :PlugInstall

" Snippets ==================================
" end Snippets ===============================

" powerline ==================================
Plug 'bling/vim-airline'
" ============================================

" Code Completion ============================
" YouCompleteMe
Plug 'Valloric/YouCompleteMe'
" end Code Completion ========================

" linenumber plugin
Plug 'myusuf3/numbers.vim'

" show marks
Plug 'kshenoy/vim-signature'
" ============================================

" grep like
Plug 'mileszs/ack.vim'

" NerdTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Linter plugin
Plug 'w0rp/ale'

" CtrlP Fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" JavaScript bundle for vim, this bundle provides syntax highlighting and
" improved indentation
Plug 'pangloss/vim-javascript'

" Syntax highlighting for JSX in Typescript.
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Vim theme
Plug 'jpo/vim-railscasts-theme'
Plug 'tomasiser/vim-code-dark'

" vim-prettier: it will auto format javascript, typescript, less, scss, css,
" json, graphql and markdown files
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

Plug 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call plug#end()            " required

" Enable syntax highlighting
" You need to reload this file for the change to apply
"" filetype off
filetype plugin indent on
syntax on

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
colorscheme railscasts
" colorscheme codedark

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

" Always display a status line at the bottom of the window
set laststatus=2

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" Prettier plugin
" Autoformat on save
let g:prettier#autoformat = 0
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
" Overwrite default prettier configuration
let g:prettier#config#tab_width = 4


" NERDTree
nmap <leader>t :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" Hide * in executable files
" https://github.com/scrooloose/nerdtree/pull/604/files
let NERDTreeShowExecutableFlag=0

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('py', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('config', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('conf', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('json', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('html', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('hbs', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('js', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('php', 'blue', 'none', '#3366FF', '#151515')

" ============================================================================
" Python IDE Setup
" ============================================================================

map <Leader>b Oimport ipdb; ipdb.set_trace()  # BREAKPOINT<C-c>

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
au BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" CtrlP Fuzzy file finder
nnoremap <leader>f :CtrlP<CR>

" let g:ctrlp_user_command = 'find %s -type f'
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " Use ag in ack.vim
  let g:ackprg = 'ag --nogroup --nocolor --column'

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

noremap Q !!bash<CR>
