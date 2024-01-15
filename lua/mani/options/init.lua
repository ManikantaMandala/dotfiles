 local options ={
    clipboard = "unnamedplus",
    cmdheight = 1,
    fileencoding = "utf-8",
    hlsearch = false,
    incsearch = true,
    ignorecase = true,
    pumheight = 15,
    showmode = false,
    showtabline = 4,
    smartcase = true,
    smartindent = true,
    splitbelow = true,
    splitright = true,
    swf = false,
    backup = false,
    undodir = os.getenv("HOME") .. "/.nvim/undodir",
    undofile = true,
    wrap = true,
    termguicolors = true,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
    cursorline = true,
    number = true,
    relativenumber = true,
    numberwidth = 1,
    signcolumn = "yes",
    scrolloff = 8,
    sidescrolloff = 8,
    updatetime = 50,
    list = true,
    spelllang = "en_us",
    wildmenu = true,
    laststatus = 2,
    colorcolumn = "80",
}
vim.opt.shortmess:append "c"
vim.opt.isfname:append("@-@")
vim.opt.path:append("**")
vim.opt.complete:append("kspell")
vim.opt.whichwrap:append("<,>,[,],h,l")
-- vim.opt.virtualedit:append("all")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.leetcode_browser = "edge"
vim.g.leetcode_solution_filetype = "java"
vim.g.codeium_enabled = false
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0


for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
local colorsForCursorLine={
    orange= "#6b2301",
    magenta= "#500066",
    gray= '#434343'
}
vim.api.nvim_command("hi! Cursorline guifg=NONE guibg="..colorsForCursorLine.gray)
-- vim.cmd[[ au BufWinEnter * let w:m2=matchadd('ErrorMsg','\%>80v.\+', -1) ]]
