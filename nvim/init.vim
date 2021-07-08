" Unmap the arrow keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>


set number " Muestra los números de las líneas
set cursorline  " Resalta la línea actual
set colorcolumn=120  " Muestra la columna límite a 120 caracteres

" Indentación a 2 espacios
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround
set expandtab  " Insertar espacios en lugar de <Tab>s

set hidden  " Permitir cambiar de buffers sin tener que guardarlos

set ignorecase  " Ignorar mayúsculas al hacer una búsqueda
set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas

set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español

set termguicolors  " Activa true colors en la terminal
set background=dark  " Fondo del tema: light o dark
colorscheme desert  " Nombre del tema

let g:mapleader = ","

" Remap esc key
inoremap jj <ESC>

" With the following mapping a user can press F5 to delete all trailing
" whitespace. The variable _s is used to save and restore the last search
" pattern register (so next time the user presses n they will continue their
" last search), and :nohl is used to switch off search highlighting (so
" trailing spaces will not be highlighted while the user types). The e flag is
" used in the substitute command so no error is shown if trailing whitespace is
" not found. Unlike before, the substitution text must be specified in order to
" use the required flag.
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>


" stop highlighting search
map <Leader><Space> :noh<CR>

" Show  tab characters. Visual Whitespace.
set list
set listchars=tab:>.

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Buffer naviation
map <M-Left> :bprevious<CR>
map <M-Right> :bnext<CR>

" Usar <líder> + y para copiar al portapapeles
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Usar <líder> + d para cortar al portapapeles
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" Usar <líder> + p para pegar desde el portapapeles
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

" ============================================
" to use vim-plug

call plug#begin('~/.local/share/nvim/plugged')

" Keep Plugin commands between here and filetype plugin indent on.
" Install Plugins - Launch vim and run :PlugInstall

" NerdTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" grep like
Plug 'mileszs/ack.vim'

" CtrlP Fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" All of your Plugins must be added before the following line
call plug#end()            " required

" NERDTree
nmap <leader>t :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc']

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

" Execute shell commands in buffer
noremap Q !!bash<CR>

" ============================================================================
" Python IDE Setup
" ============================================================================

map <Leader>b Oimport ipdb; ipdb.set_trace()  # BREAKPOINT<C-c>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" replace a word for another saved in the 0 register
nmap <Leader>rw viw"0p

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Make tab in v mode work like I think it should (keep highlighting):
vmap <tab> >gv
vmap <s-tab> <gv

" Open a new tab and search for something
nmap <leader>a :tab split<CR>:Ack ""<left>

" Search the word under de cursor
nmap <leader>A :tab split<CR>:Ack <C-r><C-w><CR>

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
"
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

endif
