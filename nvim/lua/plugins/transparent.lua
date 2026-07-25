return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      extra_groups = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "FloatBorder",
        "FloatTitle",
        "EndOfBuffer",
        "SignColumn",
        "StatusLine",
        "StatusLineNC",
        "LineNr",
        "CursorLineNr",
        "FoldColumn",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
        "TelescopeNormal",
        "TelescopeBorder",
        "TelescopePromptNormal",
        "TelescopeResultsNormal",
        "TelescopePreviewNormal",
        "Pmenu",
        "PmenuSel",
        "WhichKeyFloat",
        "LazyNormal",
        "MasonNormal",
      },
    },
    config = function(_, opts)
      require("transparent").setup(opts)
      require("transparent").clear_prefix("BufferLine")
      require("transparent").clear_prefix("NeoTree")
      require("transparent").clear_prefix("Telescope")
      require("transparent").clear_prefix("Lazy")
      require("transparent").clear_prefix("Mason")
      vim.cmd("TransparentEnable")
    end,
  },
}
