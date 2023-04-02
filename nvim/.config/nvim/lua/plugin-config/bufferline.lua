local status, bufferline = pcall(require, "bufferline")
if not status then
	vim.notify("not found bufferline")
	return
end

-- bufferline config
-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
	options = {
		-- To close the Tab command, use moll/vim-bbye's :Bdelete command here
		close_command = "Bdelete! %d",
		right_mouse_command = "Bdelete! %d",
		-- sidebar configuration
		-- The left side gives up the position of nvim-tree, showing the text File Explorer
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				text_align = "left",
			},
		},
		-- Using nvim's built-in LSP will be configured later in the course
		diagnostics = "nvim_lsp",
		-- Optional, show LSP error icon
		---@diagnostic disable-next-line: unused-local
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end,
	},
})
