local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map('n', '<C-f>', ':Telescope live_grep<CR>', default_opts)