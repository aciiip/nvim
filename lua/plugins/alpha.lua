return {
  {
    "goolord/alpha-nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "Shatur/neovim-session-manager",
    },

    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      dashboard.section.header.val = {
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[]],
        [[  █████╗  ██████╗██╗██████╗  ]],
        [[ ██╔══██╗██╔════╝██║██╔══██╗ ]],
        [[ ███████║██║     ██║██████╔╝ ]],
        [[ ██╔══██║██║     ██║██╔═══╝  ]],
        [[ ██║  ██║╚██████╗██║██║      ]],
        [[ ╚═╝  ╚═╝ ╚═════╝╚═╝╚═╝      ]],
        [[]],
        [[]],
      }

      dashboard.section.buttons.val = {
        dashboard.button("n", " " .. " [N]ew file", "<cmd> enew <cr>"),
        dashboard.button(
          "s",
          " " .. " Restore [S]ession",
          "<cmd> SessionManager load_current_dir_session <cr>"
        ),
        dashboard.button("f", " " .. " Find [F]ile", "<cmd> Telescope find_files <cr>"),
        dashboard.button("g", " " .. " Find [G]rep", "<cmd> Telescope live_grep <cr>"),
        -- dashboard.button("r", " " .. " Recent files", "<cmd> Telescope resume <cr>"),
        dashboard.button("q", " " .. " [Q]uit", "<cmd> qa <cr>"),
      }

      alpha.setup(dashboard.opts)

      require("session_manager").setup({
        autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
      })
    end,
  },
  {},
}
