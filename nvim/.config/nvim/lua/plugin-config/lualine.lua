-- If the lualine component is not found, do not continue execution
local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("not found lualine")
	return
end

local noice_status, noice = pcall(require, "noice")
if not noice_status then
	vim.notify("not found lualine")
	return
end

lualine.setup({
	options = {
		theme = "github_dark_default",
		component_separators = { left = "|", right = "|" },
		-- https://github.com/ryanoasis/powerline-extra-symbols
		section_separators = { left = " ", right = "" },
	},
	extensions = { "nvim-tree", "nvim-dap-ui", "symbols-outline" },
	sections = {
		lualine_c = {
			"filename",
			{
				noice.api.status.message.get_hl,
				cond = noice.api.status.message.has,
			},
			-- {
			-- "lsp_progress",
			-- spinner_symbols = { " ", " ", " ", " ", " ", " " },
			-- },
		},
		lualine_x = {
			{
				noice.api.status.search.get,
				noice.api.status.search.has,
				color = { fg = "#ff9e64" },
			},
			{
				noice.api.status.command.get,
				cond = noice.api.status.command.has,
				color = { fg = "#ff9e64" },
			},
			"filesize",
			{
				"fileformat",
				symbols = {
					unix = "", -- e712
					dos = "", -- e70f
					mac = "", -- e711
				},
			},
			"encoding",
			"filetype",
		},
	},
})
