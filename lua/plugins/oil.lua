return {
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    lazy = false,
    config = function()
      require("oil").setup({
        float = {
          -- padding = 8
          max_width = 0.8, -- 80%
          max_height = 0.8, -- 80%
        },
        use_default_keymaps = true,
        keymaps = {
          ["q"] = { "actions.close", mode = "n" },
        },
        win_options = {
          signcolumn = "yes:1",
        },
      })
      -- vim.keymap.set("n", "<leader>oo", "<cmd>Oil<CR>", { silent = true, noremap = true, desc = "Open [O]il"});
      vim.keymap.set(
        "n",
        "<leader>of",
        "<cmd>Oil --float<CR>",
        { silent = true, noremap = true, desc = "Open [O]il [F]loat Mode" }
      )
    end,
  },
  {
    "refractalize/oil-git-status.nvim",
    dependencies = {
      "stevearc/oil.nvim",
    },
    config = function()
      require("oil-git-status").setup({
        show_ignored = true, -- show files that match gitignore with !!
        symbols = {
          index = {
            ["!"] = "!", -- warning / update needed
            ["?"] = "?", -- untracked
            ["A"] = "+", -- added to index
            ["C"] = "", -- copied
            ["D"] = "", -- deleted
            ["M"] = "", -- modified
            ["R"] = "󰁔", -- renamed
            ["T"] = "", -- type changed
            ["U"] = "", -- unmerged (conflict)
            [" "] = " ", -- no change
          },
          working_tree = {
            ["!"] = "!",
            ["?"] = "?",
            ["A"] = "+",
            ["C"] = "",
            ["D"] = "",
            ["M"] = "",
            ["R"] = "󰁔",
            ["T"] = "",
            ["U"] = "",
            [" "] = " ",
          },
        },
      })

      -- for _, hl_group in pairs(require("oil-git-status").highlight_groups) do
      --   if hl_group.index then
      --     vim.api.nvim_set_hl(0, hl_group.hl_group, { fg = "#ff0000" })
      --   else
      --     vim.api.nvim_set_hl(0, hl_group.hl_group, { fg = "#00ff00" })
      --   end
      -- end
    end,
  },
}
