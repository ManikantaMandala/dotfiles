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
keymap("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>",keymap_description("make new tmux sessionizer") )
keymap("n", "<C-k>", ":cnext<CR>zz", opts)
keymap("n", "<leader>k", ":lnext<CR>zz", opts)
keymap("n", "<leader>j", ":lprev<CR>zz", opts)
-- open leetcode list
keymap("n", "<leader>ll", ':execute "e ~/.leetcode" <bar> LeetCodeList<CR>', keymap_description("show [L]eetcode[L]ist"))
-- open current buffer in new tab
keymap("n", "<leader>t", ":tabedit %<CR>",  keymap_description("make the current buffer to open in new tab"))
--get Prettier(gp)
keymap("n", "<leader>gp", ":Prettier<CR>", keymap_description("[G]et [P]rettier file"))

--Telescope live grep(lg)
keymap("n", "<leader>lg", ":Telescope live_grep<cr>", keymap_description("open [L]ive [G]rep"))
keymap("n", "<leader>bi", ":Telescope builtin<cr>", keymap_description("open [L]ive [G]rep"))

--nvim-tree findFIleToggle
keymap('n', '<leader>pv', ':NvimTreeFindFileToggle<CR>', keymap_description("open [P]re[V]iew of directory"))

--fugitive git status(gs)
keymap("n", "<leader>gs", ":Git<CR>", keymap_description("show the [G]it [S]tatus"));
--Toggle gitsigns
keymap('n', '<leader>tgs', ':lua toggle_gitsigns()<CR>', keymap_description("[T]oggle [G]it [S]tatus"))
--Toggle codeium_enabled
keymap('n', '<leader>tc', ':lua toggle_codeium()<CR>', keymap_description("[T]oggle [C]odeium AI"))

--undotree (u)
keymap("n", "<leader>u", ":UndotreeToggle<CR>", keymap_description("toggle [U]ndotreetoggle"))

--Visual
--stay in indent mode
keymap("v", "<", "<gv", keymap_description("indent [<] side"))
keymap("v", ">", ">gv", keymap_description("indent [<] side"))

--Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

--Visual Block
--Move text up an down
keymap("x", "<Leader>p", '\"_dp', opts)
keymap("x", "J", ":move '>+1<CR>gv=gv", keymap_description("indent the selected block if moved upward [J]"))
keymap("x", "<A-j>", ":move '>+1<CR>gv=gv", opts)
keymap("x", "K", ":move '<-2<CR>gv=gv",keymap_description("indent the selected block if moved downward [K]"))
keymap("x", "<A-k>", ":move '<-2<CR>gv=gv", opts)

--Insert mode
--codeium
vim.keymap.set('i', '<Right>', function () return vim.fn['codeium#Accept']() end, {desc= "[C]odeium [A]ccept", expr = true})
vim.keymap.set('i', '<C-l>', function() return vim.fn['codeium#CycleCompletions'](1) end, {desc="[C]odeium next in the list [L]->{vim notions}", expr = true})
vim.keymap.set('i', '<C-h>', function() return vim.fn['codeium#CycleCompletions'](-1) end, {desc= "[C]odeium previous in the list [H]->{vim notions}", expr = true})
vim.keymap.set('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, {desc = "[C]odeium clear", expr = true})
