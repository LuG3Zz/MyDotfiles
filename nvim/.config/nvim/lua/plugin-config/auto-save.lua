local status, autoSave = pcall(require, "auto-save")
if not status then
	vim.notify("not found auto-save")
	return
end

autoSave.setup({
	enabled = false,
})
