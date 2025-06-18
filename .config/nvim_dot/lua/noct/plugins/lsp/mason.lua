local mason_status, mason = pcall(require, "mason")
if not mason_status then
	print("mason not found")
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	print("mason lspconfig not found")
	return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		"ts_ls",
		"html",
		"cssls",
		"eslint",
		"marksman",
		"tailwindcss",
		"lua_ls",
		"emmet_ls",
		"pyright",
		"gopls",
	},
})
mason_lspconfig.setup_handlers({
	-- Will be called for each installed server that doesn't have
	-- a dedicated handler.
	--
	function(server_name) -- default handler (optional)
		-- https://github.com/neovim/nvim-lspconfig/pull/3232
		if server_name == "tsserver" then
			server_name = "ts_ls"
		end
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		require("lspconfig")[server_name].setup({

			capabilities = capabilities,
		})
	end,
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})
