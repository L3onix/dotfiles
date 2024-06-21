return {
  -- Solarized Osaka
  -- {
  --   "craftzdog/solarized-osaka.nvim",
  --   lazy = true,
  --   priority = 1000,
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },
  -- Monokai Nightasty
  {
    "polirritmico/monokai-nightasty.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      dark_style_background = "transparent",
      light_style_background = "transparent",
      color_headers = true,
      lualine_bold = true,
      lualine_style = "default",
      hl_styles = {
        comments = { italic = true },
        keywords = { italic = true },
        floats = "transparent",
        sidebars = "transparent",
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-nightasty",
    },
  },
}
