local present, vgit = pcall(require, "vgit")
if not present then
	return
end

vgit.setup({
	live_blame = {
		enabled = false,
	},
	scene = {
		diff_preference = "split",
	},
})
