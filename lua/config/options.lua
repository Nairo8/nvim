local opt = vim.opt

--cursor
opt.cursorline = true
opt.guicursor = ""
opt.ruler = true
opt.scrolloff = 8

--line numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

--indent
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.shiftround = true
opt.expandtab = true
opt.smartindent = true

--search
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.smartcase = true

--split
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true

--other
opt.autoread = true
opt.clipboard = "unnamedplus"
opt.colorcolumn = ""
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.formatoptions = "jcrqln"
opt.jumpoptions = "view"
opt.laststatus = 0
opt.linebreak = true
opt.list = true
opt.pumheight = 16
opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize"
opt.shortmess = "ltToOCFI"
opt.showmode = false
opt.signcolumn = "auto"
opt.statuscolumn = [[%!v:lua.require'snacks.statuscolumn'.get()]]
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
opt.updatetime = 300
opt.wildmenu = true
opt.wildmode = "longest:full"
opt.wrap = false
