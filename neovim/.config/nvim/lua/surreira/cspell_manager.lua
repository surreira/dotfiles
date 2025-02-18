-- CSpell Manager: install dictionaries
--  * Install CSpell dictionaries
--  * Add word to spell list

local M = {}

function M.get_cspell_install_path()
	local ok, cspell = pcall(require("mason-registry").get_package, "cspell")

	if not ok or not cspell then
		vim.notify("cspell is not installed via Mason", vim.log.levels.ERROR)
		return nil
	end

	return cspell:get_install_path()
end

function M.install_cspell_dictionary(dictionary_name, verbose)
	local package_path = M.get_cspell_install_path()
	if not package_path then
		return
	end

	local redirect = ""
	if not verbose then
		redirect = " > /dev/null 2>&1"
	end

	local cmd = string.format("cd %s && npm install %s%s", package_path, dictionary_name, redirect)
	vim.notify(string.format("CSpell: installing dictionary %s", dictionary_name), vim.log.levels.INFO)

	local return_value = os.execute(cmd)
	if return_value == 0 then
		vim.notify("Successful install.", vim.log.levels.INFO)
	else
		vim.notify(string.format("Failed to install %s", dictionary_name), vim.log.levels.ERROR)
	end
end

function M.add_word_to_spell_list()
	local word = vim.fn.expand("<cword>")
	if word == "" then
		vim.notify("No word under cursor", vim.log.levels.WARN)
	end
	vim.notify(string.format("word: (%s)", word))

	local list_path = vim.fn.expand("$HOME/.config/cspell/custom-words.txt")
	local list_file_read = io.open(list_path, "r")
	if not list_file_read then
		vim.notify("Error opening spell list file", vim.log.levels.ERROR)
	end

	local content = list_file_read:read("*a")
	list_file_read:close()
	if content:find(word, 1, true) then
		vim.notify(string.format("The word %s already exists in the dictionary", word), vim.log.levels.INFO)
		return
	end

	local list_file_write = io.open(list_path, "a+")
	if not list_file_write then
		vim.notify("Error opening spell list file to write", vim.log.levels.ERROR)
		return
	end

	list_file_write:write(string.format("%s\n", word))
	list_file_write:close()
	vim.notify(string.format("Added word %s to the list", word))

	vim.schedule(function()
		require("lint").try_lint("cspell")
	end)
end

return M
