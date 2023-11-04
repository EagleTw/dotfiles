-------------------------------------------------
-- EASYALIGN NEOVIM CONFIGURATION
-------------------------------------------------

local NS = { noremap = true, silent = true }

-- Align to rightmost character
vim.keymap.set('v', 'aa', function()
    require'align'.align_to_char()
end, NS)

-- Align to rightmost 2 characters
vim.keymap.set('v', 'aq', function()
    require'align'.align_to_char(2)
end, NS)

-- Align to most feasible leftward character
vim.keymap.set('v', 'ac', function()
    require'align'.align_to_char(1, true)
end, NS)

-- Align to rightmost string
vim.keymap.set('v', 'aw', function()
    require'align'.align_to_string()
end, NS)

-- Align to most feasible leftward character
vim.keymap.set('v', 'as', function()
    require'align'.align_to_string(false, true)
end, NS)

-- Align to rightmost pattern
vim.keymap.set('v', 'ar', function()
    require'align'.align_to_string(true)
end, NS)

-- Align to most feasible leftward pattern
vim.keymap.set('v', 'ae', function()
    require'align'.align_to_string(true, true)
end, NS)

