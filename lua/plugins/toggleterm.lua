require("toggleterm").setup{
    size = 10, -- Size of term
	open_mapping = [[<c-\>]], -- Toggle term on ctr+\
	hide_numbers = true, -- Hide the number column in toggleterm buffer
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 1, -- The degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = true, -- Start term in Insert Mode
	insert_mappings = true, -- Whether or not the open mapping applies in insert mode
	persist_size = true,
	direction = "horizontal",
	close_on_exit = true,
	shell = vim.o.shell,
}
