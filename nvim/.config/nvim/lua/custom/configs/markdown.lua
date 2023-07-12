return {

  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    keys = {
      { "<A-r>", "<cmd>MarkdownPreview<cr>", desc = "Markdownpreview" },
    },
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
