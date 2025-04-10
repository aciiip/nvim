return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  dependencies = {
    "moll/vim-bbye",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- "buffers" | "tabs"
        themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
        numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
        buffer_close_icon = "✗",
        close_icon = "✗",
        -- path_components = 1, -- Show only the file name without the directory
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
        name_formatter = function(buf)
          local buffers = vim.fn.getbufinfo({ buflisted = 1 })
          local name_count = {}

          for _, b in ipairs(buffers) do
            local file_name = vim.fn.fnamemodify(b.name, ":t")
            name_count[file_name] = (name_count[file_name] or 0) + 1
          end

          local path = vim.fn.fnamemodify(buf.path, ":.")
          local folder = vim.fn.fnamemodify(path, ":h:t")
          local file = vim.fn.fnamemodify(path, ":t")

          if name_count[file] > 1 then
            local name = folder .. "/" .. file
            local replaced, _ = string.gsub(name, "^./", "")
            return replaced
          else
            return file
          end
        end,
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

    local opts = { noremap = true, silent = true }
    local with_desc = function(opt, desc)
      return vim.tbl_extend("force", opt, { desc = desc })
    end

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

    -- stylua: ignore start
    vim.keymap.set("n", "<leader>bq", "<cmd>BufferLinePickClose<CR>", with_desc(opts, "[B]uffer [Q]uit Pick"))
    vim.keymap.set("n", "<leader>bQ", "<Cmd>BufferLineCloseOthers<CR>", with_desc(opts, "[B]uffer [Q]uit All"))
    vim.keymap.set("n", "<leader>bp", "<cmd>BufferLinePick<CR>", with_desc(opts, "[B]uffer [P]ick"))
    vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", with_desc(opts, "Next Buffer"))
    vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", with_desc(opts, "Previous Buffer"))
    vim.keymap.set("n", "<leader>bd", ":Bdelete!<CR>", with_desc(opts, "[B]uffer [D]elete"))
    vim.keymap.set("n", "<leader>br", "<Cmd>b#<CR>", with_desc(opts, "[B]uffer [R]estore"))
    vim.keymap.set("n", "<leader>bc", "<cmd> enew <CR>", with_desc(opts, "[B]uffer [C]reate"))
    vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", with_desc(opts, "[B]uffer [N]ext"))
    vim.keymap.set("n", "<leader>bN", "<cmd>BufferLineCyclePrev<CR>", with_desc(opts, "Previous Buffer"))
    vim.keymap.set("n", "<leader>bf", "<cmd>BufferLineGoToBuffer 1<cr>", with_desc(opts, "[B]uffer [F]irst"))
    vim.keymap.set("n", "<leader>bl", "<cmd>BufferLineGoToBuffer 0<cr>", with_desc(opts, "[B]uffer [L]ast"))

    vim.keymap.set("n", "˙", "<Cmd>BufferLineMovePrev<CR>", with_desc(opts, "Move Buffer to Previous"))
    vim.keymap.set("n", "¬", "<Cmd>BufferLineMoveNext<CR>", with_desc(opts, "Move Buffer to Next"))

    vim.keymap.set("n", "<leader>bg", go_to_buffer, with_desc(opts, "[B]uffer [G]o"))
    -- stylua: ignore end
  end,
}
