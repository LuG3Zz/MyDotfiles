local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("not found telescope")
	return
end

telescope.setup({
	defaults = {
		-- The initial mode entered after opening the pop-up window, the default is insert, it can also be normal
		initial_mode = "insert",
		-- Shortcut keys in the window
		mappings = require("keybindings").telescopeList,
		file_ignore_patterns = { "node_modules", "dist", "__pycache__" },
	},
	pickers = {
		-- Built-in pickers configuration
		find_files = {
			-- Find files for skinning, supported parameters are: dropdown, cursor, ivy
			-- theme = "dropdown",
		},
	},
	extensions = {
		-- Extensions
	},
})

-- Telescope extensions
pcall(telescope.load_extension, "env")
pcall(telescope.load_extension, "dap")
pcall(telescope.load_extension, "noice")
