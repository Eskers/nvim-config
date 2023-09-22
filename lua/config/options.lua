-- Set <space> as the leader key
-- See `:help mapleader`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Make line numbers default
vim.opt.number = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Undo persistant undo
vim.opt.undofile = true

-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'
vim.opt.wildignorecase = true -- ignore filename and directory case
vim.opt.pumblend = 10
vim.opt.wildmode = "full"
vim.opt.wildoptions = "pum"
vim.opt.wildignore = "__pycache__" -- Ignore python compile files
vim.opt.wildignore:append { "*.o", "*.pyc", "*pycache*" } -- And more
vim.keymap.set("c", "<Left>", [[<Space><BS><Left>]])
vim.keymap.set("c", "<Right>", [[<Space><BS><Right>]])

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

-- Highlight current line
vim.opt.cursorline = true

-- Keep a number of lines between cursor and end of screen
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8

-- Set default tab behaviour
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.shiftwidth = 4

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Open splits to preference
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Disable "How to disable mouse"
vim.cmd.aunmenu{ "PopUp.How-to\\ disable\\ mouse" }
vim.cmd.aunmenu{ "PopUp.-1-" }

-- Set default terminal shell to bash, needed with Flatpak
vim.opt.shell = "bash"
