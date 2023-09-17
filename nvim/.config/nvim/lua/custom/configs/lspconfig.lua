local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local servers = { "html", "cssls", "clangd", "marksman" }

capabilities.offsetEncoding = { "utf-16" }
lspconfig.clangd.setup({ capabilities = capabilities })

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- 对于不想使用通用配置的语言lsp，我们还可以自定义
--
lspconfig.pyright.setup({
	on_attach = function(client, bufnr)
		local map = function(mode, lhs, rhs, desc)
			if desc then
				desc = desc
			end
			vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
		end
           -- stylua: ignore
           if client.name == "pyright" then
             map("n", "<leader>lo", "<cmd>PyrightOrganizeImports<cr>",  "Organize Imports" )
             map("n", "<leader>lC", function() require("dap-python").test_class() end,  "Debug Class" )
             map("n", "<leader>lM", function() require("dap-python").test_method() end,  "Debug Method" )
             map("v", "<leader>lE", function() require("dap-python").debug_selection() end, "Debug Selection" )
           end
	end,
	capabilities = capabilities,
})
lspconfig.rust_analyzer.setup({
	on_attach = function(client, bufnr)
		local map = function(mode, lhs, rhs, desc)
			if desc then
				desc = desc
			end
			vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
		end
            -- stylua: ignore
            if client.name == "rust_analyzer" then
              map("n", "<leader>le", "<cmd>RustRunnables<cr>", "Runnables")
              map("n", "<leader>ll", function() vim.lsp.codelens.run() end, "Code Lens" )
              map("n", "<leader>lt", "<cmd>Cargo test<cr>", "Cargo test" )
              map("n", "<leader>lR", "<cmd>Cargo run<cr>", "Cargo run" )
            end
	end,
	capabilities = capabilities,
	-- Server-specific settings...
	filetypes = { "rust" },
	root_dir = util.root_pattern("Cargo.toml"),
	setting = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
})
lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	setting = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
		},
	},
})

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
}

--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
