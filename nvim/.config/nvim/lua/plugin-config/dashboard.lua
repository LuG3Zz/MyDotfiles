local status, db = pcall(require, "dashboard")
if not status then
	vim.notify("Not find dashboard")
	return
end

local custom_footer = {
	"",
	"Nothing is easy, but who wants nothing?",
	"                         ——Donald Trump",
}

local custom_center = {
	{
		icon = "  ",
		icon_hl = "Title",
		desc = "Projects                            ",
		desc_hl = "String",
		action = "Telescope projects",
	},
	{
		icon = "  ",
		icon_hl = "Title",
		desc = "Recently files                      ",
		desc_hl = "String",
		action = "Telescope oldfiles",
	},
	{
		icon = "  ",
		icon_hl = "Title",
		desc = "Edit keybindings                    ",
		desc_hl = "String",
		action = "edit ~/.config/nvim/lua/keybindings.lua",
	},
	{
		icon = "  ",
		icon_hl = "Title",
		desc = "Edit Projects                       ",
		desc_hl = "String",
		action = "edit ~/.local/share/nvim/project_nvim/project_history",
	},
	{
		icon = "  ",
		icon_hl = "Title",
		desc = "Edit .zshrc                         ",
		desc_hl = "String",
		action = "edit ~/.zshrc",
	},
	-- {
	--   icon = "  ",
	--   desc = "Change colorscheme                  ",
	--   action = "ChangeColorScheme",
	-- },
	-- {
	--   icon = "  ",
	--   desc = "Edit init.lua                       ",
	--   action = "edit ~/.config/nvim/init.lua",
	-- },
	-- {
	--   icon = "  ",
	--   desc = "Find file                           ",
	--   action = "Telescope find_files",
	-- },
	-- {
	--   icon = "  ",
	--   desc = "Find text                           ",
	--   action = "Telescopecope live_grep",
	-- },
}

local custom_header = {
	[[                                            ]],
	[[                                            ]],
	[[                                            ]],
	[[██▓     █    ██   ▄████  ▄▄▄       ██▀███   ]],
	[[▓██▒     ██  ▓██▒ ██▒ ▀█▒▒████▄    ▓██ ▒ ██▒]],
	[[▒██░    ▓██  ▒██░▒██░▄▄▄░▒██  ▀█▄  ▓██ ░▄█ ▒]],
	[[▒██░    ▓▓█  ░██░░▓█  ██▓░██▄▄▄▄██ ▒██▀▀█▄  ]],
	[[░██████▒▒▒█████▓ ░▒▓███▀▒ ▓█   ▓██▒░██▓ ▒██▒]],
	[[░ ▒░▓  ░░▒▓▒ ▒ ▒  ░▒   ▒  ▒▒   ▓▒█░░ ▒▓ ░▒▓░]],
	[[░ ░ ▒  ░░░▒░ ░ ░   ░   ░   ▒   ▒▒ ░  ░▒ ░ ▒░]],
	[[  ░ ░    ░░░ ░ ░ ░ ░   ░   ░   ▒     ░░   ░ ]],
	[[    ░  ░   ░           ░       ░  ░   ░     ]],
	[[                                            ]],
}
db.setup({
	theme = "doom",
	config = {
		header = custom_header, --your header
		center = custom_center,
		footer = custom_footer, --your footer
	},
})
