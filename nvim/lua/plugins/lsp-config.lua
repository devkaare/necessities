return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.tsserver.setup({ capabilities = capabilities })
            lspconfig.solargraph.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })
            lspconfig.golangci_lint_ls.setup({
                capabilities = capabilities,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

            -- Customize diagnostic display
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics, {
                    -- Enable underline, use default values
                    underline = true,
                    -- Enable virtual text, override spacing to 4
                    virtual_text = {
                        spacing = 4,
                        prefix = '~',
                    },
                    -- Use a function to dynamically turn signs off
                    -- and on, using buffer local variables
                    signs = function(bufnr, client_id)
                        local ok, result = pcall(vim.api.nvim_buf_get_var, bufnr, 'show_signs')
                        -- No buffer local variable set, so just enable by default
                        if not ok then
                            return true
                        end

                        return result
                    end,
                    -- Disable a feature
                    update_in_insert = false,
                }
            )
        end,
    },
}
