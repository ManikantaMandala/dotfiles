function keymap_description(description)
    return {desc = description, noremap=true, silent=true}
end

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

--shorten function name
local keymap = vim.keymap.set

--Modes:
--normal => "n"
--insert => "i"
--visual => "v"
--visual-block => "x"
--terminal => "t"
--command => "c"

-- Normal --
-- Resize with arrows:
print("helo")
keymap("n", "<Up>", ":resize +2<CR>")
keymap("n", "<Down>", ":resize -2<CR>")
keymap("n", "<Left>", ":vertical resize +2<CR>")
keymap("n", "<Right>", ":vertical resize -2<CR>")
--Terminal commands in nvim
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>")
keymap("n", "<C-k>", ":cnext<CR>zz")
keymap("n", "<leader>k", ":lnext<CR>zz")
keymap("n", "<leader>j", ":lprev<CR>zz")
-- open leetcode list
keymap("n", "<leader>ll", ':execute "e ~/.leetcode" <bar> LeetCodeList<CR>')
-- open current buffer in new tab
keymap("n", "<leader>t", ":tabedit %<CR>")
--get Prettier(gp)
keymap("n", "<leader>gp", ":Prettier<CR>")

--Telescope live grep(lg)
keymap("n", "<leader>lg", ":Telescope live_grep<cr>")
keymap("n", "<leader>bi", ":Telescope builtin<cr>")

--nvim-tree findFIleToggle
keymap('n', '<leader>pv', ':Lexplore<CR>')

--fugitive git status(gs)
keymap("n", "<leader>gs", ":Git<CR>");
--Toggle gitsigns
keymap('n', '<leader>tgs', ':lua toggle_gitsigns()<CR>')
--Toggle codeium_enabled
keymap('n', '<leader>tc', ':lua toggle_codeium()<CR>')

--undotree (u)
keymap("n", "<leader>u", ":UndotreeToggle<CR>")

--Visual
--stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

--Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==")
keymap("v", "<A-k>", ":m .-2<CR>==")

--Visual Block
--Move text up an down
keymap("x", "<Leader>p", '\"_dp')
keymap("x", "J", ":move '>+1<CR>gv=gv")
keymap("x", "<A-j>", ":move '>+1<CR>gv=gv")
keymap("x", "K", ":move '<-2<CR>gv=gv")
keymap("x", "<A-k>", ":move '<-2<CR>gv=gv")

--Insert mode
--codeium
vim.keymap.set('i', '<Right>', function () return vim.fn['codeium#Accept']() end, {desc= "[C]odeium [A]ccept", expr = true})
vim.keymap.set('i', '<C-l>', function() return vim.fn['codeium#CycleCompletions'](1) end, {desc="[C]odeium next in the list [L]->{vim notions}", expr = true})
vim.keymap.set('i', '<C-h>', function() return vim.fn['codeium#CycleCompletions'](-1) end, {desc= "[C]odeium previous in the list [H]->{vim notions}", expr = true})
vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, {desc = "[C]odeium clear", expr = true})

