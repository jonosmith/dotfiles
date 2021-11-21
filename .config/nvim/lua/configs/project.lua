local present, project = pcall(require, "project")
if not present then
	return
end

project.setup({
	require("telescope").load_extension("projects"),
})
