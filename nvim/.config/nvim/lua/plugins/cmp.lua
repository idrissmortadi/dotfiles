return {
  {
    "saghen/blink.cmp",
    location = "after",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "super-tab",
      },
      --   sources = {
      --     -- adding any nvim-cmp sources here will enable them
      --     -- with blink.compat
      --     compat = {
      --       "avante_commands",
      --       "avante_mentions",
      --       "avante_files",
      --     },
      --     default = {
      --       "lsp",
      --       "path",
      --       "snippets",
      --       "buffer",
      --       "avante_commands",
      --       "avante_mentions",
      --       "avante_files",
      --     },
      --     providers = {
      --       avante_commands = {
      --         name = "avante_commands",
      --         module = "blink.compat.source",
      --         score_offset = 90, -- show at a higher priority than lsp
      --         opts = {},
      --       },
      --       avante_files = {
      --         name = "avante_files",
      --         module = "blink.compat.source",
      --         score_offset = 100, -- show at a higher priority than lsp
      --         opts = {},
      --       },
      --       avante_mentions = {
      --         name = "avante_mentions",
      --         module = "blink.compat.source",
      --         score_offset = 1000, -- show at a higher priority than lsp
      --         opts = {},
      --       },
      --     },
      --   },
    },
  },
}
