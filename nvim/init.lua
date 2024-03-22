-- Neovim configuration file
-- =========================

-- globals
do
    local g = vim.g

    g.mapleader='\\'

    -- bkad/CamelCaseMotion
    g.camelcasemotion_key = ';'
end

-- options
do
    local opt = vim.opt

    opt.expandtab = true
    opt.shiftwidth = 4
    opt.softtabstop = 4
    opt.tabstop = 4
    opt.undodir = vim.fn.stdpath"config" .. "/undo"
    opt.undofile = true
end

-- key mappings
do
    local nmap = function (lhs, rhs)
        vim.keymap.set('n', lhs, rhs, {silent = true})
    end

    -- clear search highlight
    nmap('<leader>n', ':noh<cr>')

    -- go to next buffer
    nmap('<leader>l', ':bn<cr>')

    -- go to previous buffer
    nmap('<leader>h', ':bp<cr>')
end

-- lazy setup
do
    local lazypath = vim.fn.stdpath"data" .. "/lazy/lazy.nvim"

    if not vim.loop.fs_stat(lazypath) then
        vim.fn.system{
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
        }
    end

    vim.opt.rtp:prepend(lazypath)

    local lazy = require"lazy"

    lazy.setup"plugins"
end

-- lsp
do
    local lspconfig = require"lspconfig"
    lspconfig.tsserver.setup{}

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        local map = function (mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        local nmap = function (lhs, rhs)
            map('n', lhs, rhs)
        end

        local nvmap = function (lhs, rhs)
            map({'n', 'v'}, lhs, rhs)
        end

        nmap('gD', vim.lsp.buf.declaration)
        nmap('gd', vim.lsp.buf.definition)
        nmap('K', vim.lsp.buf.hover)
        nmap('gi', vim.lsp.buf.implementation)
        nmap('<C-k>', vim.lsp.buf.signature_help)
        nmap('<space>wa', vim.lsp.buf.add_workspace_folder)
        nmap('<space>wr', vim.lsp.buf.remove_workspace_folder)
        nmap('<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end)
        nmap('<space>D', vim.lsp.buf.type_definition)
        nmap('<space>rn', vim.lsp.buf.rename)
        nvmap('<space>ca', vim.lsp.buf.code_action)
        nmap('gr', vim.lsp.buf.references)
        nmap('<space>f', function()
          vim.lsp.buf.format { async = true }
        end)
      end,
    })
end
