local opt = vim.opt

opt.clipboard = "unnamedplus"
opt.mouse = "a"

opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"

opt.number = true
opt.relativenumber = true


opt.shada = { "'100", "<50", "s10", "h" }


-- Dateien automatisch neu laden, wenn sie extern geändert wurden
opt.autoread = true

-- Scroll offset
opt.scrolloff = 7

-- Wildmenu / completion
opt.wildmenu = true
opt.wildignore:append({ "*.o", "*~", "*.pyc" })

-- UI
--opt.ruler = true
--opt.cmdheight = 2

-- Backspace / Wrap keys
opt.backspace = { "eol", "start", "indent" }
opt.whichwrap = "h,l"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Performance / regex / matching
opt.lazyredraw = true
opt.magic = true
opt.showmatch = true
opt.matchtime = 2 -- entspricht mat=2

-- Keine Bells (modern)
opt.errorbells = false
opt.visualbell = false

-- Colors
-- opt.termguicolors = true
-- opt.background = "dark"

-- Encoding / fileformats
opt.encoding = "utf-8"
opt.fileformats = { "unix", "dos", "mac" }

-- Backups/Swap
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Tabs/Indent
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2

-- Text wrap
opt.linebreak = true
opt.textwidth = 500
opt.autoindent = true
opt.smartindent = true
opt.wrap = true
