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
-- vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', opts)

-- save file without auto-formatting
vim.keymap.set("n", "<leader>s", "<cmd>noautocmd w <CR>", with_desc(opts, "Save file without auto-formatting"))

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", with_desc(opts, "Quit"))

-- delete single character without copying into register
-- vim.keymap.set('n', 'x', '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", with_desc(opts, "Scroll down and center"))
vim.keymap.set("n", "<C-u>", "<C-u>zz", with_desc(opts, "Scroll up and center"))

-- Find and center
vim.keymap.set("n", "n", "nzzzv", with_desc(opts, "Previous and center"))
vim.keymap.set("n", "N", "Nzzzv", with_desc(opts, "Next and center"))

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize +2<CR>", with_desc(opts, "Resize window +2"))
vim.keymap.set("n", "<Down>", ":resize -2<CR>", with_desc(opts, "Resize window -2"))
vim.keymap.set("n", "<Left>", ":vertical resize +2<CR>", with_desc(opts, "Resize window vertical +2"))
vim.keymap.set("n", "<Right>", ":vertical resize -2<CR>", with_desc(opts, "Resize window vertical -2"))

-- Buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>", with_desc(opts, "Next Buffer"))
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", with_desc(opts, "Previous Buffer"))
vim.keymap.set("n", "<leader>bd", ":Bdelete!<CR>", with_desc(opts, "[B]uffer [D]elete")) -- close buffer
vim.keymap.set("n", "<leader>bn", "<cmd> enew <CR>", with_desc(opts, "[B]uffer [N]ew")) -- new buffer

-- Window management
-- vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
-- vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
-- vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
-- vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window
vim.keymap.set("n", "<leader>wq", ":qa<CR>", with_desc(opts, "[Q]uit"))

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
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", with_desc(opts, "Toggle line wrapping"))

-- Stay in indent mode
-- vim.keymap.set('v', '<', '<gv', opts)
-- vim.keymap.set('v', '>', '>gv', opts)

-- Keep last yanked when pasting
-- vim.keymap.set('v', 'p', '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
