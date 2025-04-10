-- Standalone plugins with less than 10 lines of config go here
return {
  {
    -- Tmux & split window navigation
    "christoomey/vim-tmux-navigator",
  },
  {
    -- Detect tabstop and shiftwidth automatically
    "tpope/vim-sleuth",
  },
  {
    -- Powerful Git integration for Vim
    -- Git on vim command
    "tpope/vim-fugitive",
  },
  {
    -- GitHub integration for vim-fugitive
    -- GBrowse
    "tpope/vim-rhubarb",
  },
  {
    -- Hints keybinds
    "folke/which-key.nvim",
  },
  -- {
  --   -- Autoclose parentheses, brackets, quotes, etc.
  --   "windwp/nvim-autopairs",
  --   event = "InsertEnter",
  --   config = true,
  --   opts = {},
  -- },
  {
    -- Highlight todo, notes, etc in comments
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  {
    -- High-performance color highlighter
    -- show color on color text
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    -- Coment shortcut
    -- GCC
    "numToStr/Comment.nvim",
    opts = {},
  },
  -- {
  --   -- Use treesitter to autoclose and autorename html tag
  --   "windwp/nvim-ts-autotag",
  --   opts = {},
  -- },
  {
    -- md viewer
    "OXY2DEV/markview.nvim",
    lazy = false,
  },
}
