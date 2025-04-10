return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = {
        enabled = false,
        char_actions = function()
          return { [";"] = "next", [","] = "prev" }
        end,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>aa", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Fl[A]sh" },
    { "<leader>at", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash [T]reesitter" },
    { "<leader>ar", mode = "o", function() require("flash").remote() end, desc = "[R]emote Flash" },
    { "<leader>aT", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "[T]reesitter Search" },
    { "<leader>ao", mode = { "c" }, function() require("flash").toggle() end, desc = "T[o]ggle Flash Search" },
  },
}
