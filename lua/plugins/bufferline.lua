return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "moll/vim-bbye",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        buffer_close_icon = "✗",
        close_icon = "✗",
        path_components = 1, -- Show only the file name without the directory
        modified_icon = "●",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        tab_size = 21,
        diagnostics = false,
        diagnostics_update_in_insert = false,
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        persist_buffer_sort = false, -- whether or not custom sorted buffers should persist
        separator_style = { "│", "│" }, -- | "thick" | "thin" | { 'any', 'any' },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        show_tab_indicators = false,
        indicator = {
          -- icon = '▎', -- this should be omitted if indicator style is not 'icon'
          style = "underline", -- Options: 'icon', 'underline', 'none'
        },
        icon_pinned = "󰐃",
        minimum_padding = 1,
        maximum_padding = 5,
        maximum_length = 15,
        sort_by = "insert_at_end",
      },
      highlights = {
        separator = {
          fg = "#434C5E",
        },
        buffer_selected = {
          bold = true,
          italic = false,
        },
        -- separator_selected = {},
        -- tab_selected = {},
        -- background = {},
        -- indicator_selected = {},
        -- fill = {},
      },
    })

    local function go_to_buffer()
      vim.ui.input({ prompt = "Go To Buffer: " }, function(input)
        if input ~= nil then
          local offset = tonumber(input)
          if offset then
            require("bufferline").go_to(offset)
          else
            vim.notify("Buffer not found!", vim.log.levels.ERROR)
          end
        end
      end)
    end

    vim.keymap.set(
      "n",
      "<leader>bg",
      go_to_buffer,
      { noremap = true, silent = true, desc = "[B]uffer [G]o" }
    )

    vim.keymap.set(
      "n",
      "<leader>bp",
      "<cmd>BufferLinePick<CR>",
      { noremap = true, silent = true, desc = "[B]uffer [P]ick" }
    )

    vim.keymap.set(
      "n",
      "<leader>bq",
      "<cmd>BufferLinePickClose<CR>",
      { noremap = true, silent = true, desc = "[B]uffer [Q]uit Pick" }
    )
  end,
}
