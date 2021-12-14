local present, null_ls = pcall(require, "null-ls")
if not present then
	return
end

local conditionEslint = function(utils)
	return utils.root_has_file(".eslintrc.json") or utils.root_has_file(".eslintrc.js")
end

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.eslint_d.with({
			condition = conditionEslint,
		}),
		null_ls.builtins.code_actions.eslint_d.with({
			condition = conditionEslint,
		}),
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.stylua,
	},
})
