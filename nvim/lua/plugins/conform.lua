return {
  {
    "stevearc/conform.nvim",
    config = function()
      -- Setting up Conform
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
	typescript = { "prettier" },
	javascriptreact = { "prettier" },
	typescriptreact = { "prettier" },
	css = { "prettier" },
	html = { "prettier" },
	json = { "prettier" },
	yaml = { "prettier" },
	markdown = { "prettier" },
        },
        format_on_save = {
          -- Options for format-on-save
          timeout_ms = 500,       -- Timeout for formatting
          lsp_format = "fallback", -- Use LSP formatting as fallback if no formatter is configured
        },
      })

      -- Auto-format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*", -- Matches all file types
        callback = function(args)
          require("conform").format({ bufnr = args.buf }) -- Formats the current buffer
        end,
      })

      -- Key mapping for manual formatting
      vim.keymap.set({ "n", "v" }, "<leader>fm", function()
        require("conform").format({
          lsp_fallback = true, -- Fallback to LSP formatting if no formatter is available
          async = false,       -- Block until formatting is complete
          timeout_ms = 5000,   -- Timeout for manual formatting
        })
      end, { desc = "Manual Format Code (Conform)" })
    end,
  },
}
