local options ={
	clipboard = "unnamedplus",
	cmdheight = 1,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	pumheight = 15,
	showmode = true,
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swf = false,
  wrap = false,
	termguicolors = true,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = true,
	number = true,
	relativenumber = true,
	numberwidth = 4,
	signcolumn = "yes",
	scrolloff = 8,
	sidescrolloff = 8,
}
vim.opt.shortmess:append "c"

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd [[set complete+=kspell]]
vim.cmd [[set spelllang=en_us]]
vim.cmd "set whichwrap+=<,>,[,],h,l"
