return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
    },
    config = function()
        -- Set up key mappings for CopilotChat
        -- <leader>c: Open CopilotChat
        -- <leader>x: Close CopilotChat
        -- <leader>l: Open CopilotChat documentation
        vim.api.nvim_set_keymap("n", "<leader>c", ":CopilotChat<CR>", {})
        vim.api.nvim_set_keymap("n", "<leader>x", ":CopilotChatClose<CR>", {})
        vim.api.nvim_set_keymap("n", "<leader>l", ":CopilotChatDocs<CR>", {})
        vim.api.nvim_set_keymap("n", "<leader>h", ":CopilotChatReset<CR>", {})

        -- Initialize CopilotChat with default settings
        require("CopilotChat").setup({})
    end
  },
}
