local opts = {noremap = true}
local term_opts ={silent = true}

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
  keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
  keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

--Visual 
  --stay in indent mode
  keymap("v", "<", "<gv", opts)
  keymap("v", ">", ">gv", opts)
  
  --Move text up and down
  keymap("v", "<A-j>", ":m .+1<CR>==", opts)
  keymap("v", "<A-k>", ":m .-2<CR>==", opts)
  keymap("v", "p", '"_dp', opts)    --TODO: show know what it does

--Visual Block
  --Move text up an down
  keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "K", ":move '>-2<CR>gv-gv", opts)
  keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "<A-k>", ":move '>-2<CR>gv-gv", opts)

--Telescope
  keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
  keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)


