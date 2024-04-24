return {
  "folke/trouble.nvim",
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = -- settings without a patched font or icons
  {
    icons = false,
    fold_open = "v",      -- icon used for open folds
    fold_closed = ">",    -- icon used for closed folds
    indent_lines = false, -- add an indent guide below the fold icons
    signs = {
      -- icons / text used for a diagnostic
      error = "error",
      warning = "warn",
      hint = "hint",
      information = "info"
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
  },
  keys = {
    { "<leader>xx", function() require("trouble").toggle() end,                        desc = "Trouble" },
    { "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, desc = "Workspace diagnostic" },
    { "<leader>xd", function() require("trouble").toggle("document_diagnostics") end,  desc = "Document diagnostic" },
    { "gR",         function() require("trouble").toggle("lsp_references") end,        desc = " Trouble References" },
  }
}
