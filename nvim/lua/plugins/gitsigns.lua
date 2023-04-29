-- import gitsigns plugin safely
local setup, gitsigns = pcall(require, "gitsigns")
if not setup then
  print("could not import gitsigns")
	return
end

-- configure/enable gitsigns
gitsigns.setup()
