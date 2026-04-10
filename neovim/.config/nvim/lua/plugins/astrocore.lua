-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics_mode = 3,
      highlighturl = true,
      notifications = true,
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = {
        prefix = "●",
        source = "if_many",
        spacing = 4,
      },
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
      },
    },
    -- vim options can be configured here
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
        clipboard = "unnamedplus",
        scrolloff = 8,
        sidescrolloff = 8,
        tabstop = 2,
        shiftwidth = 2,
        expandtab = true,
        smartindent = true,
        termguicolors = true,
        undofile = true,
        updatetime = 250,
        timeoutlen = 300,
        splitbelow = true,
        splitright = true,
        cursorline = true,
        ignorecase = true,
        smartcase = true,
      },
      g = {},
    },
    -- Mappings can be configured through AstroCore as well.
    mappings = {
      n = {
        -- Buffer navigation
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Tab>"] = { "<cmd>bnext<cr>", desc = "Next buffer" },
        ["<S-Tab>"] = { "<cmd>bprev<cr>", desc = "Previous buffer" },

        -- Buffer close from tabline
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- Quick save
        ["<C-s>"] = { "<cmd>w<cr>", desc = "Save file" },

        -- Window navigation via smart-splits
        ["<C-h>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
        ["<C-j>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" },
        ["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" },
        ["<C-l>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },

        -- Resize splits
        ["<C-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
        ["<C-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
        ["<C-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
        ["<C-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },

        -- Diagnostics navigation
        ["]d"] = { function() vim.diagnostic.goto_next() end, desc = "Next diagnostic" },
        ["[d"] = { function() vim.diagnostic.goto_prev() end, desc = "Previous diagnostic" },
        ["gl"] = { function() vim.diagnostic.open_float() end, desc = "Hover diagnostic" },

        -- Trouble diagnostics panel
        ["<Leader>xx"] = { "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace diagnostics (Trouble)" },
        ["<Leader>xd"] = { "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics (Trouble)" },
        ["<Leader>xl"] = { "<cmd>Trouble loclist toggle<cr>", desc = "Location list (Trouble)" },
        ["<Leader>xq"] = { "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list (Trouble)" },

        -- Search and replace
        ["<Leader>sr"] = { function() require("spectre").toggle() end, desc = "Search and replace (Spectre)" },

        -- LazyGit
        ["<Leader>gg"] = {
          function()
            local Terminal = require("toggleterm.terminal").Terminal
            Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" }):toggle()
          end,
          desc = "LazyGit",
        },

        -- Terminal
        ["<Leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "Float terminal" },
        ["<Leader>th"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "Horizontal terminal" },
        ["<Leader>tv"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "Vertical terminal" },

        -- Which-key group labels
        ["<Leader>x"] = { desc = "Trouble" },
        ["<Leader>t"] = { desc = "Terminal" },
        ["<Leader>s"] = { desc = "Search" },
      },
      i = {
        ["<C-s>"] = { "<esc><cmd>w<cr>", desc = "Save file" },
      },
      v = {
        -- Move lines up/down
        ["J"] = { ":m '>+1<CR>gv=gv", desc = "Move selection down" },
        ["K"] = { ":m '<-2<CR>gv=gv", desc = "Move selection up" },
        -- Better indenting (stay in visual mode)
        ["<"] = { "<gv", desc = "Indent left" },
        [">"] = { ">gv", desc = "Indent right" },
      },
      t = {
        ["<C-\\>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
        ["<Esc>"] = { "<C-\\><C-n>", desc = "Exit terminal mode" },
      },
    },
  },
}
