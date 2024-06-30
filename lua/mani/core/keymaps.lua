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
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", keymap_description("no highlight search after escape"))
-- Resize with arrows:
keymap("n", "<Up>", "<cmd>resize +2<CR>", keymap_description("make the current buffer bigger by increasing vertically upward"))
keymap("n", "<Down>", "<cmd>resize -2<CR>", keymap_description("make the current buffer bigger by increasing vertically downward"))
keymap("n", "<Left>", "<cmd>vertical resize +2<CR>", keymap_description("make the current buffer bigger by increasing horizontally left"))
keymap("n", "<Right>", "<cmd>vertical resize -2<CR>", keymap_description("make the current buffer bigger by increasing horizontally right"))
--Terminal commands in nvim
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>",keymap_description("make new tmux sessionizer") )
keymap("n", "<C-j>", "<cmd>cp<CR>zz", opts)
keymap("n", "<C-k>", "<cmd>cnext<CR>zz", opts)
keymap("n", "<leader>k", "<cmd>lnext<CR>zz", opts)
keymap("n", "<leader>j", "<cmd>lprev<CR>zz", opts)
-- open leetcode list
keymap("n", "<leader>ll", '<cmd>execute "e ~/.leetcode" <bar> LeetCodeList<CR>', keymap_description("show [L]eetcode[L]ist"))
-- open current buffer in new tab
keymap("n", "<leader>t", "<cmd>tabedit %<CR>",  keymap_description("make the current buffer to open in new tab"))
--get Prettier(gp)
-- keymap("n", "<leader>gp", "<cmd>Prettier<CR>", keymap_description("[G]et [P]rettier file"))

--Telescope live grep(lg)
keymap("n", "<leader>lg", "<cmd>Telescope live_grep<cr>", keymap_description("open [L]ive [G]rep"))
keymap("n", "<leader>bi", "<cmd>Telescope builtin<cr>", keymap_description("open [B]uilt [I]n"))

--nvim-tree find file toggle
keymap('n', '<leader>pv', '<cmd>Oil<CR>', keymap_description("open [P]re[V]iew of directory"))

--fugitive git status(gs)
keymap("n", "<leader>gs", "<cmd>Git<CR>", keymap_description("show the [G]it [S]tatus"));
--Toggle gitsigns
keymap('n', '<leader>tgs', '<cmd>lua toggle_gitsigns()<CR>', keymap_description("[T]oggle [G]it [S]tatus"))
--Toggle codeium_enabled
keymap('n', '<leader>tc', '<cmd>lua toggle_codeium()<CR>', keymap_description("[T]oggle [C]odeium AI"))

--undotree (u)
keymap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", keymap_description("toggle [U]ndotreetoggle"))

--Visual
--stay in indent mode
keymap("v", "<", "<gv", keymap_description("indent [<] side"))
keymap("v", ">", ">gv", keymap_description("indent [<] side"))

--Move text up and down
keymap("v", "<A-j>", "<cmd>m .+1<CR>==", opts)
keymap("v", "<A-k>", "<cmd>m .-2<CR>==", opts)

--Visual Block
--Move text up an down
keymap("x", "<Leader>dp", '\"_dp', opts)
keymap("x", "J", ":move '>+1<CR>gv=gv", keymap_description("indent the selected block if moved upward [J]"))
keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv",keymap_description("indent the selected block if moved downward [K]"))
keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)

--Insert mode
--codeium
-- vim.keymap.set('i', '<Tab>', function () return vim.fn['codeium#Accept']() end, {desc= "[C]odeium [A]ccept", expr = true})
-- vim.keymap.set('i', '<C-n>', function() return vim.fn['codeium#CycleCompletions'](1) end, {desc="[C]odeium next in the list [L]->{vim notions}", expr = true})
-- vim.keymap.set('i', '<C-p>', function() return vim.fn['codeium#CycleCompletions'](-1) end, {desc= "[C]odeium previous in the list [H]->{vim notions}", expr = true})
-- vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, {desc = "[C]odeium clear", expr = true})
