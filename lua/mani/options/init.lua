local options ={
    clipboard = "unnamedplus",
    cmdheight = 1,
    fileencoding = "utf-8",
    hlsearch = false,
    incsearch = true,
    ignorecase = true,
    pumheight = 15,
    showmode = true,
    showtabline = 5,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swf = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.nvim/undodir",
    undofile = true,
    wrap = false,
    termguicolors = true,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    cursorline = true,
    number = true,
    relativenumber = true,
    numberwidth = 3,
    signcolumn = "yes",
    scrolloff = 8,
    sidescrolloff = 8,
    updatetime = 50,
    colorcolumn = "80",
}
vim.opt.shortmess:append "c"
vim.opt.isfname:append("@-@")
vim.g.mapleader = " "

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd [[set complete+=kspell]]
vim.cmd [[set spelllang=en_us]]
vim.cmd "set whichwrap+=<,>,[,],h,l"
