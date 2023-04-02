local status, comment = pcall(require, "Comment")
if not status then
	vim.notify("Not found Comment")
	return
end
comment.setup()
