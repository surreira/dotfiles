function ColorTerm(color)
	color = color or "nord"
	vim.cmd.colorscheme(color)
end

ColorTerm()
