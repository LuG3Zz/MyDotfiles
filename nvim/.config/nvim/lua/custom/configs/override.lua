local nvimTreeList = {
	-- Open a file or folder
	{ key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
	-- Split screen to open files
	{ key = "v", action = "vsplit" },
	{ key = "h", action = "split" },
	-- show hidden files
	{ key = "i", action = "toggle_custom" }, -- Corresponds to custom (node_modules) in filters
	{ key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
	-- file operations
	{ key = "<F5>", action = "refresh" },
	{ key = "a", action = "create" },
	{ key = "d", action = "remove" },
	{ key = "r", action = "rename" },
	{ key = "x", action = "cut" },
	{ key = "c", action = "copy" },
	{ key = "p", action = "paste" },
	{ key = "s", action = "system_open" },
}
return {

	{
		"nvim-treesitter/nvim-treesitter",
		ensure_installed = {
			-- default
			"vim",
			"lua",

			-- 前端开发
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"json",

			-- go语言
			"go",
			"gomod",
			"gosum",

			-- rust语言
			"rust",
			"toml",
			-- python语言
			"python",

			-- 其他
			"dockerfile",
			"git_config",
			"gitignore",
			"markdown",
			"yaml",
		},
		indent = {
			enable = true,
			-- disable = {
			--   "python"
			-- },
		},
	},

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"css-lsp",
				"lua-language-server",
				"html-lsp",
				"prettier",
				"pyright",
				"stylua",
				"rust-analyzer",
				"clangd",
				-- python
				"debugpy",
				"black",
				"ruff",
				-- rust
				"codelldb",
				--markdown
				"marksman",
				--GO
				"gopls",
			},
		},
	},

	-- git support in nvimtree
	{ -- Don't show git status icons
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({})
			vim.api.nvim_create_autocmd("BufEnter", {
				nested = true,
				callback = function()
					if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
						vim.cmd("quit")
					end
				end,
			})
		end,
		opt = {
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
					list = nvimTreeList,
				}, -- Shortcut keys in custom lists
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
			-- Hide .files and node_modules folders
			renderer = {
				highlight_git = true,
				icons = {
					show = {
						git = true,
					},
				},
			},
		},
	},
}
