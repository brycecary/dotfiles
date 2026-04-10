---@type LazySpec
return {

  -- Theme: One Dark Pro Darker (matches VS Code "One Dark Pro Darker")
  {
    "olimorris/onedarkpro.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      colors = {
        onedark = {
          bg = "#23272e",
          cursorline = "#2c313a",
          selection = "#383e49",
          float_bg = "#1e2227",
        },
      },
      options = {
        transparency = false,
        cursorline = true,
      },
    },
  },

  -- JSON/YAML schema support
  { "b0o/schemastore.nvim", lazy = true },

  -- Surround text objects (cs, ds, ys)
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  -- Better UI for messages, cmdline, and popupmenu
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        { filter = { find = "vim.lsp.with%(%) is deprecated" }, opts = { skip = true } },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
    },
  },

  -- Project-wide search and replace
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Spectre",
    opts = {},
  },

  -- Dashboard
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = { "" }
      return opts
    end,
  },

  -- Escape key mappings
  { "max397574/better-escape.nvim", enabled = true },

  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts)
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  -- Auto-pairing brackets
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts)
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            :with_pair(cond.not_after_regex "%%")
            :with_pair(cond.not_before_regex("xxx", 3))
            :with_move(cond.none())
            :with_del(cond.not_after_regex "xx")
            :with_cr(cond.none()),
        },
        Rule("a", "a", "-vim")
      )
    end,
  },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.filesystem.filtered_items = {
        hide_gitignoreed = false,
      }
      opts.filesystem.hijack_netrw_behavior = "open_default"
      return opts
    end,
  },
}
