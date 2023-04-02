local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("not found nvim-tree")
	return
end

-- List operation shortcuts
local list_keys = require("keybindings").nvimTreeList
nvim_tree.setup({
	-- Don't show git status icons
	git = {
		enable = false,
	},
	-- project plugin needs to be set like this
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	-- Hide .files and node_modules folders
	filters = {
		dotfiles = true,
		custom = { "node_modules", "__pycache__" },
	},
	view = {
		-- Width
		width = 40,
		-- 'right' is ok
		side = "left",
		-- hide root directory
		hide_root_folder = false,
		-- Shortcut keys in custom lists
		mappings = {
			custom_only = false,
			list = list_keys,
		},
		-- Don't show row count
		number = false,
		relativenumber = false,
		-- Show icon
		signcolumn = "yes",
	},
	actions = {
		open_file = {
			-- Open size fit for the first time
			resize_window = true,
			-- Close when file is opened
			quit_on_open = true,
		},
	},
	system_open = {
		cmd = "",
	},
})
-- Auto close
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
