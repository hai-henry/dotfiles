return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      filters = {
        dotfiles = false,   -- show dotfiles
        git_ignored = false -- show gitignored files/folders
      },
      git = {
        enable = true,
        ignore = false, -- don’t hide gitignored items
      },
    })
    vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

    vim.api.nvim_set_keymap(
      "n",
      "<leader>tr",
      ":belowright split | resize 15 | setlocal winfixheight | terminal<CR>",
      { noremap = true, silent = true }
    )
  end,
}
