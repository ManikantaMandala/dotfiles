local options ={
	clipboard = "unnamedplus",
	cmdheight = 1,
	fileencoding = "utf-8",
	hlsearch = true,
	incsearch = true,
	ignorecase = true,
	pumheight = 15,
	showmode = false,
	showtabline = 2,
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
	shiftwidth = 4,
	tabstop = 4,
	softtabstop = -1,
	cursorline = false,
	-- cursorcolumn = true,
	number = true,
	relativenumber = true,
	numberwidth = 1,
	signcolumn = "yes",
	scrolloff = 8,
	sidescrolloff = 8,
	updatetime = 50,
	-- list = true,
	-- listchars = "tab:» ,trail:·, eol:↴,extends:→,precedes:←",
	spelllang = "en_gb",
	spell = true,
	wildmenu = true,
	laststatus = 2,
	foldmethod = "manual",
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
vim.g.codeium_enabled = true
vim.g.python3_host_prog = '/usr/bin/python3'
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

for k, v in pairs(options) do
	vim.opt[k] = v
end
vim.opt.guicursor= 'n-v-c-sm:block,i-ci-ve:block,r-cr-o:block'
local colorsForCursorLine={
	orange= "#6b2301",
	magenta= "#500066",
	gray= '#434343'
}
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
vim.api.nvim_command("hi Cursorline guifg=NONE guibg="..colorsForCursorLine.orange)
-- vim.api.nvim_command("highlight Cursor gui=NONE guifg="..colorsForCursorLine.gray
--         .." guibg="..colorsForCursorLine.magenta)
-- vim.cmd[[ au BufWinEnter * let w:m2=matchadd('ErrorMsg','\%>80v.\+', -1) ]]
