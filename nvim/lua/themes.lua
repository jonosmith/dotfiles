local U = require("utils")

-- Theme Setters

M = {}

M.paperColor = function()
  if vim.o.background == "light" then
    vim.g.colorscheme = "papercolor_light"
  else
    vim.g.colorscheme = "papercolor_dark"
  end

  vim.cmd("colorscheme PaperColor")
  vim.cmd("hi BufferInactive guifg=#eeeeee guibg=#005f87")
end

-- @param variant string - "high" | "flat" | "low"
M.solarized = function(variant)
  if vim.o.background == "light" then
    vim.g.colorscheme = "solarized_light"
  else
    vim.g.colorscheme = "solarized_dark"

    if variant == "high" then
      vim.cmd("hi Normal guibg=#001e26")
    end
  end

  local name = "solarized"

  if variant then
    name = name .. "-" .. variant
  end

  vim.cmd("colorscheme " .. name)
end


return M
