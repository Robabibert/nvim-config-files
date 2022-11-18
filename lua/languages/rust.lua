-- rust language specific settings


-- keybindings

local m=require('mapx').setup({ global = "force", whichkey = true })

-- Also supports setting WhichKey group names
nnoremap("<F5>", "<Cmd>lua require'dap'.continue()<CR>","silent")
nnoremap("<F10>", "<Cmd>lua require'dap'.step_over()<CR>","silent")
nnoremap("<F11>", "<Cmd>lua require'dap'.step_into()<CR>","silent")
nnoremap("<F12>", "<Cmd>lua require'dap'.step_out()<CR>","silent")
nnoremap("<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>","silent")
nnoremap("<Leader>B", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>","silent")
nnoremap("<Leader>lp", "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>","silent")
nnoremap("<Leader>dr", "<Cmd>lua require'dap'.repl.open()<CR>","silent")
nnoremap("<Leader>dl", "<Cmd>lua require'dap'.run_last()<CR>","silent")


-- Rust Hover acions
nnoremap("<C-space>","<Cmd>RustHoverActions<CR>")



-- LSP Navigation
-- Code Actions
map('n', "ca", ":lua vim.lsp.buf.code_action()<CR>")
vim.cmd([[
nnoremap <silent> <c-]>     <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> <c-k>     <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> K         <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi        <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gc        <cmd>lua vim.lsp.buf.incoming_calls()<CR>
nnoremap <silent> gd        <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr        <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gn        <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> gs        <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gw        <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
]])

vim.cmd([[
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>
]])


-- Crates Nvim
vim.cmd([[
nnoremap <silent> <leader>ct :lua require('crates').toggle()<cr>
nnoremap <silent> <leader>cr :lua require('crates').reload()<cr>

nnoremap <silent> <leader>cv :lua require('crates').show_versions_popup()<cr>
nnoremap <silent> <leader>cf :lua require('crates').show_features_popup()<cr>
nnoremap <silent> <leader>cd :lua require('crates').show_dependencies_popup()<cr>

nnoremap <silent> <leader>cu :lua require('crates').update_crate()<cr>
vnoremap <silent> <leader>cu :lua require('crates').update_crates()<cr>
nnoremap <silent> <leader>ca :lua require('crates').update_all_crates()<cr>
nnoremap <silent> <leader>cU :lua require('crates').upgrade_crate()<cr>
vnoremap <silent> <leader>cU :lua require('crates').upgrade_crates()<cr>
nnoremap <silent> <leader>cA :lua require('crates').upgrade_all_crates()<cr>

nnoremap <silent> <leader>cH :lua require('crates').open_homepage()<cr>
nnoremap <silent> <leader>cR :lua require('crates').open_repository()<cr>
nnoremap <silent> <leader>cD :lua require('crates').open_documentation()<cr>
nnoremap <silent> <leader>cC :lua require('crates').open_crates_io()<cr>
]])
