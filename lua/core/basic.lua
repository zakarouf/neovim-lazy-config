-- Basic
local g = vim.g -- this behaves like set g:
--local cmd = vim.cmd -- for running vim commands
local set = vim.opt -- for :set
--set.runtimepath = set.runtimepath + "/opt/local/share/nvim/runtime"

set.swapfile = false

set.autoindent = true
set.expandtab = true
set.smartindent = true
set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.showtabline = 4

set.colorcolumn = "80"

set.smartcase = true
set.autowrite = true
set.mouse = "a"
set.hlsearch = true
set.incsearch = true
set.clipboard = "unnamedplus"

set.ruler = true
set.relativenumber = true

set.splitbelow = true
set.splitright = true

set.spelllang = "en"
vim.api.nvim_set_keymap("n", "<F6>"
	, ":setlocal spell!<CR>", { noremap = true, silent = true })

-- Disabling some stuff
g.loaded_gzip         = 1
g.loaded_tar          = 1
g.loaded_tarPlugin    = 1
g.loaded_zipPlugin    = 1
g.loaded_2html_plugin = 1
g.loaded_netrw        = 1
g.loaded_netrwPlugin  = 1
g.loaded_matchit      = 1
g.loaded_matchparen   = 1
g.loaded_spec         = 1
