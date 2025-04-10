-- return {
--   'shaunsingh/nord.nvim',
--   lazy = false,
--   priority = 1000,
--   config = function()
--     -- Example config in lua
--     vim.g.nord_contrast = true
--     vim.g.nord_borders = false
--     vim.g.nord_disable_background = false
--     vim.g.nord_italic = false
--     vim.g.nord_uniform_diff_background = true
--     vim.g.nord_bold = false
--
--     -- Load the colorscheme
--     require('nord').set()
--
--     -- Toggle background transparency
--     local bg_transparent = true
--
--     local toggle_transparency = function()
--       bg_transparent = not bg_transparent
--       vim.g.nord_disable_background = bg_transparent
--       vim.cmd [[colorscheme nord]]
--     end
--
--     vim.keymap.set('n', '<leader>wb', toggle_transparency, { noremap = true, silent = true, desc = "Toggle [W]indow [B]ackground transparency" })
--   end
-- }

return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local bg_transparent = false

    local toggle_transparency = function()
      bg_transparent = not bg_transparent

      require("catppuccin").setup({
        transparent_background = bg_transparent,
      })

      vim.cmd.colorscheme("catppuccin-mocha")
    end

    toggle_transparency()

    vim.keymap.set(
      "n",
      "<leader>wb",
      toggle_transparency,
      { noremap = true, silent = true, desc = "Toggle [W]indow [B]ackground transparency" }
    )
  end,
}

-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     local bg_transparent = false
--
--     local toggle_transparency = function()
--       bg_transparent = not bg_transparent
--
--       require("tokyonight").setup({
--         style = "night",
--         transparent = bg_transparent,
--       })
--
--       vim.cmd.colorscheme("tokyonight")
--     end
--
--     toggle_transparency()
--
--     vim.keymap.set(
--       "n",
--       "<leader>wb",
--       toggle_transparency,
--       { noremap = true, silent = true, desc = "Toggle [W]indow [B]ackground transparency" }
--     )
--   end
-- }
