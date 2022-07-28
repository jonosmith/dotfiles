local present, neotest = pcall(require, "neotest")
if not present then
	return
end

neotest.setup({
	adapters = {
		require("neotest-jest")({
			jestCommand = "npm test --",
			jestConfigFile = "jest.config.ts",
		}),
	},
})
