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
