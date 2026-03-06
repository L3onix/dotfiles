-- Configuração de encoding dos arquivos do projeto estudavest
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "/home/l3onix/Projects/estudavest/*",
  callback = function()
    vim.opt.fileencoding = "iso-8859-1"
  end,
})
