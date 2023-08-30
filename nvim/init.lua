-- Neovim configuration file
-- =========================

-- globals
do
    local g = vim.g

    g.mapleader='\\'
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

    lazy.setup{
        {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    }
end
