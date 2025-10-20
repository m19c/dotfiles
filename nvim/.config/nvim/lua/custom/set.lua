vim.cmd([[
  augroup RunCommandOnAstroSave
    autocmd!
    autocmd BufWritePost *.astro call system('npx prettier -w ' . expand('%')) | e
  augroup END
]])

vim.opt.cursorline = true

-- standard cursor style where normal mode is a block while
-- insert mode is a vertical bar
vim.opt.guicursor = "n-v-c:block,i:ver4"

-- more complex cursor style with blinking and different shapes
-- vim.opt.guicursor = {
-- 	"n-v-c:block-Cursor/lCursor",
--	"i:ver25-blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
--	"r-cr-o:hor20-Cursor/lCursor",
--	"a:blinkwait700-blinkoff400-blinkon250",
-- }

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
