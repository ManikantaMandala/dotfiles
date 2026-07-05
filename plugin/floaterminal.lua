local state = {
  floating = {
    buf = -1,
    win = -1
  }
}

local function create_centered_floating_window()
  -- Get the current screen dimensions
  local width = vim.o.columns
  local height = vim.o.lines

  -- Calculate window dimensions (80% of the screen)
  local win_width = math.floor(width * 0.8)
  local win_height = math.floor(height * 0.8)

  -- Calculate the starting position to center the window
  local row = math.floor((height - win_height) / 2)
  local col = math.floor((width - win_width) / 2)

  -- Create a new buffer
  local buf = -1
  if not vim.api.nvim_buf_is_valid(state.floating.buf) then
    buf = vim.api.nvim_create_buf(false, true) -- No file, scratch buffer
  else
    buf = state.floating.buf
  end

  -- Define window options
  local opts = {
    relative = 'editor',
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    style = 'minimal',
    title = "Floaterminal",
    title_pos = "center",
    border = "rounded"
    -- border = {
    -- "+", "-", "+", "|", "+", "-", "+", "|"
    -- }, -- Can be 'single', 'double', 'shadow', or 'none'
  }

  local win = vim.api.nvim_open_win(buf, true, opts)

  return { buf = buf, win = win }
end

-- Call the function to create the floating window
-- close the window
vim.api.nvim_create_user_command("Floaterminal", function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_centered_floating_window()
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end, {})

vim.keymap.set(
  "t",
  "<esc><esc>",
  "<C-\\><C-n>",
  { desc = "Go to normal mode from terminal mode" }
)

vim.keymap.set(
  { "n" },
  "<leader>ft",
  "<cmd>Floaterminal<CR>",
  { desc = "Open [F]loat [T]erminal" }
)
