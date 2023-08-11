vim.opt.guicursor = ""

vim.opt.number = true  -- Muestra los números de las lineas
vim.opt.relativenumber = true

vim.opt.cursorline = true -- Resalta la línea actual
vim.opt.colorcolumn = "80" -- Muestra la columna límite

-- Indentación
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true  -- Insertar espacios en lugar de <Tab>s
vim.opt.shiftround = true

vim.opt.smartindent = true

vim.opt.hidden = true  -- Permitir cambiar de buffers sin tener que guardarlos

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.ignorecase = true  -- Ignorar mayúsculas al hacer una búsqueda
vim.opt.smartcase = true  -- No ignorar mayúsculas si la palabra a buscar contiene mayúsculas

vim.opt.spell = true
vim.opt.spelllang="en,es" -- Corregir palabras usando diccionarios en inglés y español

vim.opt.termguicolors = true -- Activa true colors en la terminal
vim.opt.background = "dark"

-- Show tab characters. Visual whitespace.
vim.opt.list = true
vim.opt.listchars = "tab:>."

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.g.mapleader = " "

-- Desactivar el mouse en insert mode (Solo se permite en normal y visual "nv")
vim.opt.mouse = "nv"

-- Better copy & paste (TODO)

-- Mapeo para cambiar el modo paste con F2
-- vim.api.nvim_set_keymap('n', '<F5>', [[:set invpaste paste?<CR>]], { noremap = true })

-- Opción para cambiar el modo paste con F2
-- vim.opt.pastetoggle = '<F5>'

-- Mostrar el modo en la esquina inferior derecha
-- vim.opt.showmode = true

-- Configuración del portapapeles (clipboard)
-- vim.opt.clipboard:append("unnamed")
-- vim.opt.clipboard:append("unnamedplus")
-- vim.api.nvim_set_option("clipboard","unnamed")
