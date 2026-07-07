return {
  {
    "l3onix/vscode-encoding.nvim",
    config = function ()
      require("vscode-encoding").setup({
        enable = true,
      })
    end,
  },
}
