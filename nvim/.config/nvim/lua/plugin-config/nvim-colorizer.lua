local status, color = pcall(require, "colorizer")
if not status then
	vim.notify("not found colorizer")
	return
end

color.setup()
