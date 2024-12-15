return {
  {
    "mfussenegger/nvim-lint",
    config = function()
      -- Setting up linters by filetype
      require("lint").linters_by_ft = {
        lua = { "luacheck" },       -- Lua linter
        python = { "pylint" },      -- Python linter
        javascript = { "eslint" },  -- JavaScript linter
        typescript = { "eslint" },  -- TypeScript linter
        css = { "stylelint" },      -- CSS linter
        markdown = { "markdownlint" }, -- Markdown linter
      }

      -- Optional: Customize specific linter settings
      require("lint").linters.luacheck = {
        args = { "--globals", "vim" }, -- Make luacheck recognize the 'vim' global
      }

      -- Automatically lint on save
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })

      -- Key mapping for manual linting
      vim.keymap.set("n", "<leader>l", function()
        require("lint").try_lint()
      end, { desc = "Run Linters (nvim-lint)" })
    end,
  },
}
