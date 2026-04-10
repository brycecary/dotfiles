-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "regex",
      "comment",
      "diff",
      "gitcommit",
      "git_rebase",
      "ssh_config",
      "ini",
      "sql",
      "graphql",
      "proto",
      "make",
      "cmake",
      "xml",
      "http",
      "jq",
      "hcl",
      "csv",
      "c_sharp",
      "dockerfile",
      -- Language packs auto-install: typescript, tsx, javascript, jsdoc, go, gomod,
      -- gosum, rust, python, json, json5, jsonc, yaml, toml, markdown,
      -- markdown_inline, dockerfile, terraform, html, css, scss, bash
    },
  },
}
