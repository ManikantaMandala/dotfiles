local function keymap_description(description)
    return {desc = description, noremap=true, silent=true}
end

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--Modes:
--normal => "n"
--insert => "i"
--visual => "v"
--visual-block => "x"
--terminal => "t"
--command => "c"

-- Normal --
-- Resize with arrows:
keymap("n", "<Up>", ":resize +2<CR>", keymap_description("make the current buffer bigger by increasing vertically upward"))
keymap("n", "<Down>", ":resize -2<CR>", keymap_description("make the current buffer bigger by increasing vertically downward"))
keymap("n", "<Left>", ":vertical resize +2<CR>", keymap_description("make the current buffer bigger by increasing horizontally left"))
keymap("n", "<Right>", ":vertical resize -2<CR>", keymap_description("make the current buffer bigger by increasing horizontally right"))
--Terminal commands in nvim
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>",keymap_description("make new tmux sessionizer") )
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", opts)
-- open leetcode list
keymap("n", "<leader>ll", ':execute "e ~/.leetcode" <bar> LeetCodeList<CR>', keymap_description("show [L]eetcode[L]ist"))
-- open current buffer in new tab
keymap("n", "<leader>t", ":tabedit %<CR>",  keymap_description("make the current buffer to open in new tab"))

--Visual
--stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

--Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

--Visual Block
--Move text up an down
keymap("x", "<Leader>p", "\"_dp", opts)
keymap("x", "J", ":move '>+1<CR>gv=gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)

--get Prettier(gp)
keymap("n", "<leader>gp", ":Prettier<CR>", keymap_description("[G]et [P]rettier file"))

--Telescope live grep(lg)
keymap("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", keymap_description("open [L]ive [G]rep"))
keymap("n", "<leader>bi", "<cmd>Telescope builtin<cr>", keymap_description("open [L]ive [G]rep"))

--nvim-tree findFIleToggle
keymap('n', '<leader>pv', ':NvimTreeFindFileToggle<CR>', keymap_description("open [P]re[V]iew of directory"))

--fugitive git status(gs)
keymap("n", "<leader>gs", ":Git<CR>", keymap_description("show the [G]it [S]tatus"));

--undotree (u)
keymap("n", "<leader>u", ":UndotreeToggle<CR>", keymap_description("toggle [U]ndotreetoggle"))
