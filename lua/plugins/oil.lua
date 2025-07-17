return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  lazy = false,
  config = function()
    require('oil').setup({
      float = {
        -- padding = 8
        max_width = 0.8, -- 80%
        max_height = 0.8, -- 80%
      },
      use_default_keymaps = true,
      keymaps = {
        ["<esc>"] = { "actions.close", mode = "n" },
      },
    });
    -- vim.keymap.set("n", "<leader>oo", "<cmd>Oil<CR>", { silent = true, noremap = true, desc = "Open [O]il"});
    vim.keymap.set("n", "<leader>of", "<cmd>Oil --float<CR>", { silent = true, noremap = true, desc = "Open [O]il [F]loat Mode"});
  end
}
