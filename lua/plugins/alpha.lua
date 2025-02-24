return {
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "Shatur/neovim-session-manager",
    },

    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        [[  .----------------.  .----------------.  .----------------.  .----------------.  ]],
        [[ | .--------------. || .--------------. || .--------------. || .--------------. | ]],
        [[ | |      __      | || |     ______   | || |     _____    | || |   ______     | | ]],
        [[ | |     /  \     | || |   .' ___  |  | || |    |_   _|   | || |  |_   __ \   | | ]],
        [[ | |    / /\ \    | || |  / .'   \_|  | || |      | |     | || |    | |__) |  | | ]],
        [[ | |   / ____ \   | || |  | |         | || |      | |     | || |    |  ___/   | | ]],
        [[ | | _/ /    \ \_ | || |  \ `.___.'\  | || |     _| |_    | || |   _| |_      | | ]],
        [[ | ||____|  |____|| || |   `._____.'  | || |    |_____|   | || |  |_____|     | | ]],
        [[ | |              | || |              | || |              | || |              | | ]],
        [[ | '--------------' || '--------------' || '--------------' || '--------------' | ]],
        [[  '----------------'  '----------------'  '----------------'  '----------------'  ]],
      }

      dashboard.section.buttons.val = {
        dashboard.button("n", " " .. " New file", "<cmd> enew <cr>"),
        dashboard.button("f", " " .. " Find file", "<cmd> Telescope find_files <cr>"),
        dashboard.button("g", " " .. " Find text", "<cmd> Telescope grep_string <cr>"),
        -- dashboard.button("r", " " .. " Recent files", "<cmd> Telescope resume <cr>"),
        dashboard.button(
          "s",
          " " .. " Restore Session",
          "<cmd> SessionManager load_current_dir_session <cr>"
        ),
        dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
      }

      alpha.setup(dashboard.opts)

      require("session_manager").setup({
        autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
      })
    end,
  },
  {},
}
