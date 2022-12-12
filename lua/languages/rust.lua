-- rust language specific settings


-- keybindings



-- Rust Hover acions

require'mapx'.setup{ global = true }


-- LSP Navigation
-- Code Actions
nnoremap("<C-space>",  ":RustHoverActions<cr>","silent",{ft="rust"})
nnoremap("<c-]>",     ":lua vim.lsp.buf.definition()<cr>",'silent',{ft='rust'})
nnoremap("K",         ":lua vim.lsp.buf.hover()<cr>",'silent',{ft='rust'})
nnoremap("gi",        ":lua vim.lsp.buf.implementation()<cr>",'silent',{ft='rust'})
nnoremap("gc",        ":lua vim.lsp.buf.incoming_calls()<cr>",'silent',{ft='rust'})
nnoremap("gd",        ":lua vim.lsp.buf.type_definition()<cr>",'silent',{ft='rust'})
nnoremap("gr",        ":lua vim.lsp.buf.references()<cr>",'silent',{ft='rust'})
nnoremap("gn",        ":lua vim.lsp.buf.rename()<cr>",'silent',{ft='rust'})
nnoremap("gs",        ":lua vim.lsp.buf.document_symbol()<cr>",'silent',{ft='rust'})
nnoremap("gw",        ":lua vim.lsp.buf.workspace_symbol()<cr>",'silent',{ft='rust'})
nnoremap("g[",        ":lua vim.diagnostic.goto_prev()<cr>",'silent',{ft='rust'})
nnoremap("g]",        ":lua vim.diagnostic.goto_next()<cr>",'silent',{ft='rust'})
nnoremap("<leader>ct",":lua require('crates').toggle()<cr>",'silent',{ft='rust'})
nnoremap("<leader>cr",":lua require('crates').reload()<cr>",'silent',{ft='rust'})
nnoremap("<leader>cv",":lua require('crates').show_versions_popup()<cr>",'silent',{ft='toml'})
nnoremap("<leader>cf",":lua require('crates').show_features_popup()<cr>",'silent',{ft='toml'})
nnoremap("<leader>cd",":lua require('crates').show_dependencies_popup()<cr>",'silent',{ft='rust'})
nnoremap("<leader>cu",":lua require('crates').update_crate()<cr>",'silent',{ft='rust'})
nnoremap("<leader>cu",":lua require('crates').update_crates()<cr>",'silent',{ft='rust'})
nnoremap("<leader>ca",":lua require('crates').update_all_crates()<cr>",'silent',{ft='rust'})
nnoremap("<leader>cU",":lua require('crates').upgrade_crate()<cr>",'silent',{ft='rust'})
nnoremap("<leader>cU",":lua require('crates').upgrade_crates()<cr>",'silent',{ft='rust'})
nnoremap("<leader>cA",":lua require('crates').upgrade_all_crates()<cr>",'silent',{ft='rust'})
nnoremap("<leader>cH",":lua require('crates').open_homepage()<cr>",'silent',{ft='rust'})
nnoremap("<leader>cR",":lua require('crates').open_repository()<cr>",'silent',{ft='rust'})
nnoremap("<leader>cD",":lua require('crates').open_documentation()<cr>",'silent',{ft='rust'})
nnoremap("<leader>cC",":lua require('crates').open_crates_io()<cr>",'silent',{ft='rust'})
