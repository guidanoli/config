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

vim.lsp.enable "ts_ls"
vim.lsp.enable "clangd"
vim.lsp.enable "rust_analyzer"
vim.lsp.enable "gopls"
vim.lsp.enable "yamlls"
