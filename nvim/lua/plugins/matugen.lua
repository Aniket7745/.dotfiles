local function apply_matugen()
  -- Always reload the generated colors
  package.loaded["generated.colors"] = nil

  local ok, c = pcall(require, "generated.colors")
  if not ok then
    vim.notify("Matugen colors not found", vim.log.levels.WARN)
    return
  end

  local hl = vim.api.nvim_set_hl

  ------------------------------------------------------------------------
  -- Main UI
  ------------------------------------------------------------------------
  hl(0, "Normal", {
    fg = c.on_surface,
    bg = "NONE",
  })

  hl(0, "NormalNC", {
    fg = c.on_surface,
    bg = "NONE",
  })

  hl(0, "NormalFloat", {
    fg = c.on_surface,
    bg = "NONE",
  })

  hl(0, "FloatBorder", {
    fg = c.primary,
    bg = "NONE",
  })

  hl(0, "FloatTitle", {
    fg = c.primary,
    bg = "NONE",
    bold = true,
  })

  ------------------------------------------------------------------------
  -- Transparent Groups
  ------------------------------------------------------------------------
  hl(0, "SignColumn", { bg = "NONE" })
  hl(0, "FoldColumn", { bg = "NONE" })
  hl(0, "LineNr", { bg = "NONE" })
  hl(0, "EndOfBuffer", { bg = "NONE" })
  hl(0, "StatusLine", { bg = "NONE" })
  hl(0, "StatusLineNC", { bg = "NONE" })
  hl(0, "WinSeparator", { bg = "NONE", fg = c.primary })

  ------------------------------------------------------------------------
  -- Cursor
  ------------------------------------------------------------------------
  hl(0, "CursorLine", {
    bg = c.surface_container,
  })

  hl(0, "CursorLineNr", {
    fg = c.primary,
    bg = "NONE",
    bold = true,
  })

  ------------------------------------------------------------------------
  -- Search
  ------------------------------------------------------------------------
  hl(0, "Search", {
    fg = c.background,
    bg = c.primary,
  })

  hl(0, "IncSearch", {
    fg = c.background,
    bg = c.secondary,
  })

  ------------------------------------------------------------------------
  -- Visual
  ------------------------------------------------------------------------
  hl(0, "Visual", {
    bg = c.surface_container,
  })

  ------------------------------------------------------------------------
  -- Comments
  ------------------------------------------------------------------------
  hl(0, "Comment", {
    fg = c.outline,
    italic = true,
  })

  ------------------------------------------------------------------------
  -- Diagnostics
  ------------------------------------------------------------------------
  hl(0, "DiagnosticError", {
    fg = c.error,
  })

  hl(0, "DiagnosticWarn", {
    fg = c.tertiary,
  })

  hl(0, "DiagnosticInfo", {
    fg = c.primary,
  })

  hl(0, "DiagnosticHint", {
    fg = c.secondary,
  })

  ------------------------------------------------------------------------
  -- Popup Menu
  ------------------------------------------------------------------------
  hl(0, "Pmenu", {
    bg = "NONE",
  })

  hl(0, "PmenuSel", {
    bg = c.surface_container,
  })

  ------------------------------------------------------------------------
  -- Telescope
  ------------------------------------------------------------------------
  hl(0, "TelescopeNormal", {
    bg = "NONE",
  })

  hl(0, "TelescopeBorder", {
    bg = "NONE",
    fg = c.primary,
  })

  hl(0, "TelescopePromptNormal", {
    bg = "NONE",
  })

  hl(0, "TelescopeResultsNormal", {
    bg = "NONE",
  })

  hl(0, "TelescopePreviewNormal", {
    bg = "NONE",
  })

  ------------------------------------------------------------------------
  -- Neo-tree
  ------------------------------------------------------------------------
  hl(0, "NeoTreeNormal", {
    bg = "NONE",
  })

  hl(0, "NeoTreeNormalNC", {
    bg = "NONE",
  })

  ------------------------------------------------------------------------
  -- Mason
  ------------------------------------------------------------------------
  hl(0, "MasonNormal", {
    bg = "NONE",
  })

  ------------------------------------------------------------------------
  -- Lazy
  ------------------------------------------------------------------------
  hl(0, "LazyNormal", {
    bg = "NONE",
  })
end

return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority = 1000,

    opts = {
      transparent_background = true,
      term_colors = true,
    },

    config = function(_, opts)
      require("catppuccin").setup(opts)

      vim.cmd.colorscheme("catppuccin")

      apply_matugen()

      vim.api.nvim_create_user_command("MatugenReload", function()
        apply_matugen()
      end, {})

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          apply_matugen()
        end,
      })

      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          apply_matugen()
        end,
      })
    end,
  },
}
