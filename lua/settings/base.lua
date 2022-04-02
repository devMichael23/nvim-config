local opt = vim.opt
local cmd = vim.cmd




------------------------------------------------------------------------------
-- Main options
------------------------------------------------------------------------------
opt.colorcolumn = '200'              -- Separate at 200 symbols
opt.cursorline = true               -- Highlighting a line with a cursor
opt.spelllang = { 'en_us', 'ru' }   -- Dictionary
opt.number = true 		            -- On line number
-- opt.relativenumber = true 	        -- Highlighting a line with a cursor
opt.splitright = true               -- Vertical split 
opt.splitbelow = true               -- Horizontal split


------------------------------------------------------------------------------
-- Tabs options
------------------------------------------------------------------------------
cmd([[
filetype indent plugin on
syntax enable
]])
opt.expandtab = true      -- Use spaces instead of tabs
opt.shiftwidth = 4        -- Shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- Autoindent new lines


------------------------------------------------------------------------------
-- IDE options
------------------------------------------------------------------------------
-- Remembers where nvim last edited the file
cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]
