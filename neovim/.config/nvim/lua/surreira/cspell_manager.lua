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

return M
