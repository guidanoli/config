-- Neovim configuration file
-- =========================

-- Color scheme
-- Default: "default"
vim.cmd.colorscheme "torte"

-- Globals
-- -------

 -- Leader key binding, used by
 -- https://github.com/whonore/Coqtail
 vim.g.mapleader = "\\"

 -- CamelCase motion key binding, used by
 -- https://github.com/bkad/CamelCaseMotion
 vim.g.camelcasemotion_key = ";"
 
-- Options
-- -------

-- Whether pressing Tab procudes spaces
-- Default: false
vim.opt.expandtab = true

-- How many spaces are produced
-- by shifts (<<, >>) and auto-indentation (=)
-- Default: 8
vim.opt.shiftwidth = 4

-- Whether undo files should be persisted
-- Default: false
vim.opt.undofile = true

-- Key mappings
-- ------------

-- Clear higlight-search
vim.keymap.set("n", "<leader>n", "<cmd>nohlsearch<cr>")

-- Go to previous buffer
vim.keymap.set("n", "<leader>h", "<cmd>bprevious<cr>")

-- Go to next buffer
vim.keymap.set("n", "<leader>l", "<cmd>bnext<cr>")

-- Plugin manager
-- --------------

vim.pack.add{
    -- Provides CamelCase motion through words
    "https://github.com/bkad/CamelCaseMotion",

    -- Opens files in the last place of edit
    "https://github.com/farmergreg/vim-lastplace",

    -- Sensible LSP configuration defaults
    "https://github.com/neovim/nvim-lspconfig",

    -- Interactive Coq (now-called Rocq) proofs
    "https://github.com/whonore/Coqtail",
}

-- Language server providers
-- -------------------------

vim.lsp.enable "clangd"
vim.lsp.enable "gopls"
vim.lsp.enable "lua_ls"
vim.lsp.enable "rust_analyzer"
vim.lsp.enable "ts_ls"
vim.lsp.enable "yamlls"

-- LSP keymaps
-- -----------

local function get_lsp_client_method (key)
    assert(type(key) == "string", "Method key is not string")
    local method = vim.lsp.protocol.Methods[key]
    assert(method, "Unknown LSP client method " .. tostring(key))
    assert(type(method) == "string", "Method is not string")
    return method
end

local function supports_method (lsp_client, key)
    assert(lsp_client ~= nil, "LSP client is nil")
    local method = get_lsp_client_method(key)
    local supports = lsp_client:supports_method(method)
    assert(type(supports) == "boolean", "Return value is not boolean")
    return supports
end

local function get_lsp_client (ev)
    assert(type(ev) == "table", "Event is not a table")
    assert(type(ev.data) == "table", "Event data is not a table")
    local client_id = ev.data.client_id
    assert(client_id, "Could not retrieve LSP client ID from event data")
    local client = vim.lsp.get_client_by_id(client_id)
    assert(client, "Invalid LSP client ID")
    return client
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function (ev)
        local lsp_client = get_lsp_client(ev)
        if supports_method(lsp_client, "textDocument_definition") then
            vim.keymap.set("n", "gd", vim.lsp.buf.definition)
        end
    end,
})
