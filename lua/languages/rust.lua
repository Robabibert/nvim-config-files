-- rust language specific settings


-- keybindings



-- Rust Hover acions


local utils=require("utils")
-- LSP Navigation
-- Code Actions
utils.map("n","<C-space>",  ":RustHoverActions<cr>")
utils.map("n", "<c-]>",     ":lua vim.lsp.buf.definition()<cr>")
utils.map("n", "<c-k>",     ":lua vim.lsp.buf.signature_help()<cr>")
utils.map("n", "K",         ":lua vim.lsp.buf.hover()<cr>")
utils.map("n", "gi",        ":lua vim.lsp.buf.implementation()<cr>")
utils.map("n", "gc",        ":lua vim.lsp.buf.incoming_calls()<cr>")
utils.map("n", "gd",        ":lua vim.lsp.buf.type_definition()<cr>")
utils.map("n", "gr",        ":lua vim.lsp.buf.references()<cr>")
utils.map("n", "gn",        ":lua vim.lsp.buf.rename()<cr>")
utils.map("n", "gs",        ":lua vim.lsp.buf.document_symbol()<cr>")
utils.map("n", "gw",        ":lua vim.lsp.buf.workspace_symbol()<cr>")

utils.map("n", "g[",        ":lua vim.diagnostic.goto_prev()<cr>")
utils.map("n", "g]",        ":lua vim.diagnostic.goto_next()<cr>")


-- Crates Nvim
utils.map("n", "<leader>ct", ":lua require('crates').toggle()<cr>")
utils.map("n", "<leader>cr", ":lua require('crates').reload()<cr>")

utils.map("n", "<leader>cv", ":lua require('crates').show_versions_popup()<cr>")
utils.map("n", "<leader>cf", ":lua require('crates').show_features_popup()<cr>")
utils.map("n", "<leader>cd", ":lua require('crates').show_dependencies_popup()<cr>")

utils.map("n", "<leader>cu", ":lua require('crates').update_crate()<cr>")
utils.map("n", "<leader>cu", ":lua require('crates').update_crates()<cr>")
utils.map("n", "<leader>ca", ":lua require('crates').update_all_crates()<cr>")
utils.map("n", "<leader>cU", ":lua require('crates').upgrade_crate()<cr>")
utils.map("n", "<leader>cU", ":lua require('crates').upgrade_crates()<cr>")
utils.map("n", "<leader>cA", ":lua require('crates').upgrade_all_crates()<cr>")

utils.map("n", "<leader>cH", ":lua require('crates').open_homepage()<cr>")
utils.map("n", "<leader>cR", ":lua require('crates').open_repository()<cr>")
utils.map("n", "<leader>cD", ":lua require('crates').open_documentation()<cr>")
utils.map("n", "<leader>cC", ":lua require('crates').open_crates_io()<cr>")
