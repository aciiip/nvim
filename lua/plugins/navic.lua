return 
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    config = function()
      vim.g.navic_silence = true

      local icons = {
        Class = "󰠱 ",
        Color = "󰏘 ",
        Constant = "󰏿 ",
        Constructor = " ",
        Enum = " ",
        EnumMember = " ",
        Event = " ",
        Field = " ",
        File = "󰈙 ",
        Folder = "󰉋 ",
        Function = "󰊕 ",
        Interface = " ",
        Keyword = "󰌋 ",
        Method = "󰆧 ",
        Module = " ",
        Namespace = "󰌗 ",
        Null = " ",
        Number = "󰎠 ",
        Object = "󰅩 ",
        Operator = "󰆕 ",
        Package = " ",
        Property = " ",
        Reference = "󰈇 ",
        Snippet = " ",
        String = "󰉿 ",
        Struct = "󰙅 ",
        Text = "󰉿 ",
        TypeParameter = "󰆩 ",
        Unit = " ",
        Value = "󰎠 ",
        Variable = "󰀫 ",
      }

      require("nvim-navic").setup({
        highlight = true,
        lsp = {
          auto_attach = true,
          preference = { "intelephense", "phpactor" }
        },
        icons = icons,
        lazy_update_context = true,
      })
    end,
  }
