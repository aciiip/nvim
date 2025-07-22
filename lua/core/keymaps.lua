-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }
local with_desc = function(opt, desc)
  return vim.tbl_extend("force", opt, { desc = desc })
end

-- save file
-- vim.keymap.set("n", "<leader>ss", "<cmd> w <CR>", with_desc(opts, "[S]ave file"))
-- vim.keymap.set("n", "<leader>sa", "<cmd> wa <CR>", with_desc(opts, "[S]ave [A]ll file"))

-- save file without auto-formatting
-- vim.keymap.set(
--   "n",
--   "<leader>sw",
--   "<cmd>noautocmd w <CR>",
--   with_desc(opts, "[S]ave file [W]ithout auto-formatting")
-- )

-- quit file
-- vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", with_desc(opts, "Quit"))

-- delete single character without copying into register
-- vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", with_desc(opts, "Scroll down and center"))
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", with_desc(opts, "Scroll up and center"))

-- Find and center
-- vim.keymap.set("n", "n", "nzzzv", with_desc(opts, "Next and center"))
-- vim.keymap.set("n", "N", "Nzzzv", with_desc(opts, "Previous and center"))

-- Resize with arrows
vim.keymap.set("n", "<A-Up>", ":resize +2<CR>", with_desc(opts, "Resize window +2"))
vim.keymap.set("n", "<A-Down>", ":resize -2<CR>", with_desc(opts, "Resize window -2"))
vim.keymap.set(
  "n",
  "<A-Left>",
  ":vertical resize +2<CR>",
  with_desc(opts, "Resize window vertical +2")
)
vim.keymap.set(
  "n",
  "<A-Right>",
  ":vertical resize -2<CR>",
  with_desc(opts, "Resize window vertical -2")
)

-- Window management
-- vim.keymap.set('n', '<leader>wv', '<C-w>v', opts) -- split window vertically
-- vim.keymap.set('n', '<leader>wh', '<C-w>s', opts) -- split window horizontally
-- vim.keymap.set('n', '<leader>we', '<C-w>=', opts) -- make split windows e]qual width & height
-- vim.keymap.set("n", "<leader>ww", ":close<CR>", with_desc(opts, "[W]indow Close")) -- close current split window
-- vim.keymap.set("n", "<leader>wq", ":qa<CR>", with_desc(opts, "[W]indow [Q]uit all"))

-- Navigate between splits
-- vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
-- vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
-- vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
-- vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Tabs
-- vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
-- vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
-- vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) --  go to next tab
-- vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>cl", "<cmd>set wrap!<CR>", with_desc(opts, "Toggle [L]ine Wrapping"))

-- Stay in indent mode
-- vim.keymap.set('v', '<', '<gv', opts)
-- vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
-- vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set(
  "n",
  "<leader>dN",
  vim.diagnostic.goto_prev,
  { desc = "Go to previous diagnostic message" }
)
vim.keymap.set(
  "n",
  "<leader>dn",
  vim.diagnostic.goto_next,
  { desc = "Go to next diagnostic message" }
)
vim.keymap.set(
  "n",
  "<leader>df",
  vim.diagnostic.open_float,
  { desc = "Open [f]loating diagnostic message" }
)
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open diagnostics [l]ist" })
