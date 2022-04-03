require('telescope').setup{
  defaults = {
    -- Default configuration
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    mappings = {
      i = {
        -- map actions.which_key to <C-h>
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
  },
  extensions = {
    -- Your extension configuration goes here:
  }
}
