return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}
	vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

	vim.api.nvim_set_keymap('n', '<leader>tr', ':belowright split | resize 15 | setlocal winfixheight | terminal<CR>', { noremap = true, silent = true })
  end,
}
