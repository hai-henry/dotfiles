return {
	"stevearc/conform.nvim",
      event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			-- Custom formatter configurations
			formatters = {
				black = {
					prepend_args = { "--fast" }, -- Add the "--fast" flag for Black
				},
			},
			-- Specify formatters for file types
			formatters_by_ft = {
		        		javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" }, -- Use Black and Isort for Python
			},
			-- Format on save configuration
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 5000, -- Increase timeout if needed
			},
		})

		-- Key mapping for manual formatting
		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 5000,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
