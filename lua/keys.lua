--[[ keys.lua ]]
-- Functional wrapper for mapping custom keybindings
-- mode (as in Vim modes like Normal/Insert mode)
-- lhs (the custom keybinds you need)
-- rhs (the commands or existing keybinds to customise)
-- opts (additional options like <silent>/<noremap>, see :h map-arguments for more info on it)
local utils=require("utils")


-- Load all OPTs
utils.map("n", "<F1>", ":luafile ~/.config/nvim/lua/opts.lua<cr>")


-- Enable spell checking
utils.map("n", "<F2>", ":set spell!<cr>")
-- zg to add word
-- z= to correct error
-- new words  added to ~/.config/nvim/spell/en.utf-8.add

-- Quit buffer
utils.map("n", "qq", ":q<cr>")
utils.map("n", "qa", ":qa<cr>")

vim.cmd([[
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
]])

-- Save and exit
utils.map("n", "<leader>w", ":w<CR>")
utils.map("n", "<leader>q", ":q<CR>")
utils.map("n", "<leader>qa", ":qa<CR>")

-- Window navigation
utils.map("n", "<C-j>", "<C-w>j<C-w>")
utils.map("n", "<C-h>", "<C-w>h<C-w>")
utils.map("n", "<C-k>", "<C-w>k<C-w>")
utils.map("n", "<C-l>", "<C-w>l<C-w>")
-- Tab navigation
utils.map("n", "<leader>tn", ":tabnew<CR>")
utils.map("n", "<leader>ts", ":tabn<CR>")


-- Hop
utils.map("n", "HH", ":HopWord<cr>")
utils.map("n", "HF", ":HopPattern<cr>")
utils.map("n", "HL", ":HopLineStart<cr>")

-- Telescope
utils.map("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>")
utils.map("n", "<leader>fm", ":Telescope media_files<cr>")
utils.map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>")
utils.map("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>")
utils.map("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>")
utils.map("n", "<leader>fd", ":lua require('telescope.builtin').diagnostics()<cr>")
utils.map("n", "<leader>fs", ":lua require('telescope.builtin').lsp_workspace_symbols()<cr>")
utils.map("n", "<leader>fr", ":lua require('telescope.builtin').lsp_references()<cr>")
utils.map("n", "<leader>fi", ":lua require('telescope.builtin').lsp_implementations()<cr>")
utils.map("n", "<leader>fl", ":lua require('telescope.builtin').treesitter()<cr>")
utils.map("n", "<leader>fk", ":lua require('telescope.builtin').keymaps()<cr>")

utils.map("n", "<leader>fc", ":lua require('telescope.builtin').commands()<cr>")
utils.map("n", "<leader>fch", ":lua require('telescope.builtin').command_history()<cr>")
utils.map("n", "<leader>fsh", ":lua require('telescope.builtin').search_history()<cr>")
utils.map("n", "<leader>fmp", ":lua require('telescope.builtin').man_pages()<cr>")
utils.map("n", "<leader>fgc", ":lua require('telescope.builtin').git_commits()<cr>")
utils.map("n", "<leader>fgb", ":lua require('telescope.builtin').git_branches()<cr>")


-- Todo List
utils.map("n", "<leader>qf", ":TodoQuickFix<cr>")

-- Trouble
utils.map("n", "<leader>e", ":TroubleToggle<cr>")

-- Nvim Tree
utils.map("n", "<leader>nt", ":NvimTreeToggle<CR>")

-- Transparency
utils.map("n", "<leader>\\", ":TransparentToggle<CR>")

-- Toggle colored column at 81
utils.map('n', '<leader>|', ':execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>')

-- Navigate buffers
utils.map('n', '<leader>bp', ':bprevious<CR>', {})
utils.map('n', '<leader>bn', ':bnext<CR>', {})
utils.map('n', '<leader>bf', ':bfirst<CR>', {})
utils.map('n', '<leader>bl', ':blast<CR>', {})
utils.map('n', '<leader>bd', ':bdelete<CR>', {})


-- Tagbar Toggle
-- utils.map('n', "<leader>tt", ":TagbarToggle<CR>");
utils.map('n', "<leader>tt", ":SymbolsOutline<CR>");






-- Fix common typos
vim.cmd([[
    cnoreabbrev W! w!
    cnoreabbrev W1 w!
    cnoreabbrev w1 w!
    cnoreabbrev Q! q!
    cnoreabbrev Q1 q!
    cnoreabbrev q1 q!
    cnoreabbrev Qa! qa!
    cnoreabbrev Qall! qall!
    cnoreabbrev Wa wa
    cnoreabbrev Wq wq
    cnoreabbrev wQ wq
    cnoreabbrev WQ wq
    cnoreabbrev wq1 wq!
    cnoreabbrev Wq1 wq!
    cnoreabbrev wQ1 wq!
    cnoreabbrev WQ1 wq!
    cnoreabbrev W w
    cnoreabbrev Q q
    cnoreabbrev Qa qa
    cnoreabbrev Qall qall
]])

-- Comment.nvim configuration
-- current line
vim.keymap.set('n', 'cc', '<Plug>(comment_toggle_linewise_current)')
vim.keymap.set('n', 'cb', '<Plug>(comment_toggle_blockwise_current)')

-- Toggle in VISUAL mode
vim.keymap.set('x', 'cc', '<Plug>(comment_toggle_linewise_visual)')
vim.keymap.set('x', 'cb', '<Plug>(comment_toggle_blockwise_visual)')

-- .mappings and config for rust language 


