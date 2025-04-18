return function(event)
  -- NOTE: Remember that Lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local map = function(keys, func, desc, mode)
    mode = mode or "n"
    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
  end

  -- Jump to the definition of the word under your cursor.
  --  This is where a variable was first declared, or where a function is defined, etc.
  --  To jump back, press <C-t>.
  map("<leader>ld", require("telescope.builtin").lsp_definitions, "Goto [D]efinition")

  -- Find references for the word under your cursor.
  map("<leader>lr", require("telescope.builtin").lsp_references, "Goto [R]eferences")

  -- Jump to the implementation of the word under your cursor.
  --  Useful when your language has ways of declaring types without an actual implementation.
  map("<leader>li", require("telescope.builtin").lsp_implementations, "Goto [I]mplementation")

  -- Jump to the type of the word under your cursor.
  --  Useful when you're not sure what type a variable is and you want to see
  --  the definition of its *type*, not where it was *defined*.
  map("<leader>lt", require("telescope.builtin").lsp_type_definitions, "[T]ype Definition")

  -- Fuzzy find all the symbols in your current document.
  --  Symbols are things like variables, functions, types, etc.
  map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "Document [S]ymbols")

  -- Fuzzy find all the symbols in your current workspace.
  --  Similar to document symbols, except searches over your entire project.
  map(
    "<leader>lw",
    require("telescope.builtin").lsp_dynamic_workspace_symbols,
    "[W]orkspace Symbols"
  )

  -- Rename the variable under your cursor.
  --  Most Language Servers support renaming across files, etc.
  map("<leader>lr", vim.lsp.buf.rename, "[R]ename")

  -- Execute a code action, usually your cursor needs to be on top of an error
  -- or a suggestion from your LSP for this to activate.
  map("<leader>la", vim.lsp.buf.code_action, "Code [A]ction", { "n", "x" })

  -- WARN: This is not Goto Definition, this is Goto Declaration.
  --  For example, in C this would take you to the header.
  map("<leader>lD", vim.lsp.buf.declaration, "Goto [D]eclaration")

  -- The following two autocommands are used to highlight references of the
  -- word under your cursor when your cursor rests there for a little while.
  --    See `:help CursorHold` for information about when this is executed
  --
  -- When you move your cursor, the highlights will be cleared (the second autocommand).
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
    local highlight_augroup =
      vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = event.buf,
      group = highlight_augroup,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      buffer = event.buf,
      group = highlight_augroup,
      callback = vim.lsp.buf.clear_references,
    })

    vim.api.nvim_create_autocmd("LspDetach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
      callback = function(event2)
        vim.lsp.buf.clear_references()
        vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
      end,
    })
  end

  -- The following code creates a keymap to toggle inlay hints in your
  -- code, if the language server you are using supports them
  --
  -- This may be unwanted, since they displace some of your code
  if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
    -- vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
    map("<leader>lh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
    end, "Toggle Inlay [H]ints")
  end
end
