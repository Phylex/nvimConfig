for k in pairs(package.loaded) do
    if k:match(".*nabla.*") then package.loaded[k] = nil end
end

require('nabla').setup()
require('nabla').colorscheme()

