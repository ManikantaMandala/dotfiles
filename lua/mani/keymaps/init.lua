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
-- Resize with arrows
keymap("n", "<Up>", ":resize +2<CR>", opts)
keymap("n", "<Down>", ":resize -2<CR>", opts)
keymap("n", "<Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<Right>", ":vertical resize -2<CR>", opts)
--Terminal commands in nvim
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", opts)
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", opts)
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

--Prettier
keymap("n", "<leader>gp", ":Prettier<CR>", opts)
--Telescope
keymap("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", opts)

--nvim-tree
keymap('n', '<leader>pv', ':NvimTreeFindFileToggle<CR>', opts)

--fugitive
keymap("n", "<leader>gs", ":Git<CR>", opts);

--undotree
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)
