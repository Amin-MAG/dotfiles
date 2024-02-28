local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {"golangci_lint_ls", "gopls", "lua_ls", "pylsp", "pylyzer", "pyright", "yamlls", "html", "htmx", "cssls", "rust_analyzer", "zk", "templ", "clangd", "arduino_language_server", "biome"},
	handlers = {
		lsp_zero.default_setup,
	},
})
