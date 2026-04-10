-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- custom filetypes
vim.filetype.add {
  extension = {
    tf = "terraform",
    tfvars = "terraform",
  },
  pattern = {
    [".*playbook.*%.ya?ml"] = "yaml.ansible",
    [".*roles.*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*roles.*/handlers/.*%.ya?ml"] = "yaml.ansible",
    [".*inventory.*%.ya?ml"] = "yaml.ansible",
    [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
  },
}

vim.api.nvim_create_augroup("neotree", {})
vim.api.nvim_create_autocmd("UiEnter", {
  desc = "Open Neotree automatically",
  group = "neotree",
  callback = function()
    if vim.fn.argc() == 0 then
      vim.cmd "Neotree toggle"
      vim.cmd.wincmd "p"
    end
  end,
})
