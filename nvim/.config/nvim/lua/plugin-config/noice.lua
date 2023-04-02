local status, noice = pcall(require, "noice")
if not status then
	vim.notify("not found noice")
	return
end

noice.setup(){
  background_colour = "#000000"
}
