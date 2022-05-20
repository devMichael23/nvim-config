require('persisted').setup({
    save_dir = vim.fn.expand(vim.fn.stdpath('data') .. '/sessions/'), -- Directory where session files are saved
    command = 'VimLeavePre', -- The autocommand for which the session is saved
    use_git_branch = true, -- Create session files based on the branch of the git enabled repository
    autosave = true, -- Automatically save session files when exiting Neovim
    autoload = false, -- Automatically load the session for the cwd on Neovim startup
    allowed_dirs = nil, -- Table of dirs that the plugin will auto-save and auto-load from
    ignored_dirs = nil, -- Table of dirs that are ignored when auto-saving and auto-loading
    before_save = function() end, -- Function to run before the session is saved to disk
    after_save = function() end, -- Function to run after the session is saved to disk
    telescope = { -- Options for the telescope extension
        before_source = function() end, -- Function to run before the session is sourced via telescope
        after_source = function() end, -- Function to run after the session is sourced via telescope
    },
})
