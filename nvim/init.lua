-- Define a function to execute the required actions
function process_file()
	local filetype = vim.bo.filetype

	if filetype == "templ" then
		local bufnr = vim.api.nvim_get_current_buf()
		local filename = vim.api.nvim_buf_get_name(bufnr)
		local cmd = "templ fmt " .. vim.fn.shellescape(filename)

		vim.fn.jobstart(cmd, {
			on_exit = function()
				-- Reload the buffer only if it's still the current buffer
				if vim.api.nvim_get_current_buf() == bufnr then
					vim.cmd('e!')
				end
			end,
		})
		return
	end

	vim.cmd('silent! normal gg=G``') -- Format the entire buffer
	if filetype == "go" then
		vim.cmd('silent! %!gofmt') -- Run gofmt on the entire buffer
		vim.cmd('silent! %!goimports') -- Run goimports on the entire buffer
	end
end


vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 7 spaces for tabs (prettier default)
opt.softtabstop= 4 --  Number of spaces for a TAB in insert mode
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = false -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor
opt.cursorline = true -- highlight the current cursor lie
opt.guicursor = "a:block"

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

vim.filetype.add({ extension = { templ = "templ" } })
require("aminmag.remap")
require("aminmag.lazy")
