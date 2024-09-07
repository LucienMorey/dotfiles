local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Do not remap leader in this file if that is desired. Do so in the lazy config before plugins are loaded

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

-- Map Esc to jk
map('i', 'jk', '<Esc>')

map("n", ';', ":")

map("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>")
map("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>")
map("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>")
map("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>")
map("n", "<C-\\>", "<Cmd>NvimTmuxNavigateLastActive<CR>")
map("n", "<C-Space>", "<Cmd>NvimTmuxNavigateNavigateNext<CR>")
