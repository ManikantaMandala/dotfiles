function keymap_description(description)
    return {desc = description, noremap=true, silent=true}
end

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--shorten function name
local keymap = vim.api.nvim_set_keymap

--Modes:
--normal => "n"
--insert => "i"
--visual => "v"
--visual-block => "x"
--terminal => "t"
--command => "c"

-- Normal --
vim.api.nvim_set_keymap("n", "<Esc>", "<cmd>nohlsearch<CR>"
	, keymap_description("no highlight search after escape"))
-- Resize with arrows:
vim.api.nvim_set_keymap("n", "<Up>", "<cmd>resize +2<CR>"
	, keymap_description("make the current buffer bigger by increasing vertically upward"))
vim.api.nvim_set_keymap("n", "<Down>", "<cmd>resize -2<CR>"
	, keymap_description("make the current buffer bigger by increasing vertically downward"))
vim.api.nvim_set_keymap("n", "<Left>", "<cmd>vertical resize +2<CR>"
	, keymap_description("make the current buffer bigger by increasing horizontally left"))
vim.api.nvim_set_keymap("n", "<Right>", "<cmd>vertical resize -2<CR>"
	, keymap_description("make the current buffer bigger by increasing horizontally right"))
--Terminal commands in nvim
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", opts)
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", opts)
vim.api.nvim_set_keymap("n", "n", "nzzzv", opts)
vim.api.nvim_set_keymap("n", "N", "Nzzzv", opts)
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>"
	,keymap_description("make new tmux sessionizer") )
vim.api.nvim_set_keymap("n", "<C-j>", "<cmd>cp<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
vim.api.nvim_set_keymap("n", "<leader>j", "<cmd>lprev<CR>zz", opts)
-- open leetcode list
vim.api.nvim_set_keymap("n", "<leader>ll", '<cmd>execute "e ~/.leetcode" <bar> LeetCodeList<CR>'
	, keymap_description("show [L]eetcode[L]ist"))
-- open current buffer in new tab
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>tabedit %<CR>",
	keymap_description("make the current buffer to open in new tab"))
--get Prettier(gp)
-- vim.api.nvim_set_keymap("n", "<leader>gp", "<cmd>Prettier<CR>", keymap_description("[G]et [P]rettier file"))



--fugitive git status(gs)
vim.api.nvim_set_keymap("n", "<leader>gs", "<cmd>Git<CR>", keymap_description("show the [G]it [S]tatus"));
--Toggle gitsigns
vim.api.nvim_set_keymap('n', '<leader>tgs', '<cmd>lua toggle_gitsigns()<CR>', keymap_description("[T]oggle [G]it [S]tatus"))
--Toggle codeium_enabled
vim.api.nvim_set_keymap('n', '<leader>tc', '<cmd>lua toggle_codeium()<CR>', keymap_description("[T]oggle [C]odeium AI"))

--undotree (u)
vim.api.nvim_set_keymap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", keymap_description("toggle [U]ndotreetoggle"))

--Visual
--stay in indent mode
vim.api.nvim_set_keymap("v", "<", "<gv", keymap_description("indent [<] side"))
vim.api.nvim_set_keymap("v", ">", ">gv", keymap_description("indent [<] side"))

--Move text up and down
vim.api.nvim_set_keymap("v", "<A-j>", "<cmd>m .+1<CR>==", opts)
vim.api.nvim_set_keymap("v", "<A-k>", "<cmd>m .-2<CR>==", opts)

--Visual Block
--Move text up an down
vim.api.nvim_set_keymap("x", "<Leader>dp", '\"_dp', opts)
vim.api.nvim_set_keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
vim.api.nvim_set_keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)
vim.api.nvim_set_keymap("x", "K", ":move '<-2<CR>gv=gv"
	, keymap_description("indent the selected block if moved downward [K]"))
vim.api.nvim_set_keymap("x", "J", ":move '>+1<CR>gv=gv"
	, keymap_description("indent the selected block if moved upward [J]"))

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlights when yanking (copying) text",
	callback = function()
		vim.hl.on_yank()
	end
})

--Insert mode
--codeium
-- vim.keymap.set('i', '<Tab>', function () return vim.fn['codeium#Accept']() end, {desc= "[C]odeium [A]ccept", expr = true})
-- vim.keymap.set('i', '<C-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, {desc="[C]odeium next in the list [L]->{vim notions}", expr = true})
-- vim.keymap.set('i', '<C-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, {desc= "[C]odeium previous in the list [H]->{vim notions}", expr = true})
-- vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, {desc = "[C]odeium clear", expr = true})
