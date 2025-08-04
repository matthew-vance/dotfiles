local o = vim.opt

-- line numbers
o.number = true
o.relativenumber = true

-- tabs & indetation
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

-- undo
o.swapfile = false
o.backup = false
o.writebackup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

-- search
o.hlsearch = false
o.incsearch = true
o.ignorecase = true
o.infercase = true
o.smartcase = true

-- clipboard
o.clipboard:append("unnamedplus")

-- ui
o.termguicolors = true
o.cursorline = true
o.splitbelow = true
o.splitright = true
o.wrap = false
o.breakindent = true

-- misc
o.scrolloff = 10
o.signcolumn = "yes"
o.updatetime = 50
o.colorcolumn = "80,100,120"
o.autoread = true
