print("Hello from init.lua")

-- ------------------------------
-- --------LUA-FUNCTIONS---------
-- ------------------------------
function getLineText()
	local current_line = vim.fn.line(".")
	local text = vim.fn.getline(current_line)
	local text = string.sub(text, 1, 6)
	-- print(current_line, text)
	return text
end

-- ------------------------------
-- -------VIM-SET-OPTIONS--------
-- ------------------------------
vim.opt.nu = true
vim.opt.rnu = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.mouse = "a"
vim.opt.incsearch = true
vim.opt.termguicolors = false
vim.cmd[[tab all]]
vim.cmd[[syntax on]]
vim.cmd[[colorscheme dracula]]

-- ------------------------------
-- ---------VIM-MAPPINGS---------
-- ------------------------------
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>ww", vim.cmd.tabnext, { noremap = true })
vim.keymap.set("n", "<leader>wn", vim.cmd.tabnew, { noremap = true })
vim.keymap.set("n", "<leader>wc", vim.cmd.tabclose, { noremap = true })
vim.keymap.set("n", "<leader>ws", '<cmd>w!<cr>', { noremap = true })
vim.keymap.set("n", "<leader>wq", '<cmd>q<cr>', { noremap = true })
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { noremap = true })
vim.keymap.set("n", "<F4>", ":nohl<Cr>", { silent = true, noremap = true })


if vim.bo.filetype == 'tex' then
	vim.keymap.set("v", "<C-b>", "c\\textbf{}<Esc><S-p>")
	vim.keymap.set("v", "<C-i>", "c\\textit{}<Esc><S-p>")
end

if vim.bo.filetype == 'lua' then
	vim.keymap.set("n", "<C-_>", function () 
		if string.find(getLineText(), '%-%-%s') ~= nil then 
			vim.cmd(":normal ma^v2lx")
			vim.cmd(":normal `a3h")
		else 
			vim.cmd(":normal ma^i-- ") 
			vim.cmd(":normal `a3l") 
		end
	end)
	vim.keymap.set("n", "<C-l>", function () getLineText() end)
end

-- ------------------------------
-- ---------VIM-PLUGINS----------
-- ------------------------------

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Mofiqul's dracula theme
	use 'Mofiqul/dracula.nvim'
end)
