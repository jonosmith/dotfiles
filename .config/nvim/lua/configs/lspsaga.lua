local present, saga = pcall(require, "lspsaga")
if not present then
	return
end

saga.init_lsp_saga({
	error_sign = "",
	warn_sign = "",
	hint_sign = "",
	infor_sign = "",
	border_style = "round",
	code_action_prompt = {
		enable = false, --to turn off light bulb
	},
})
