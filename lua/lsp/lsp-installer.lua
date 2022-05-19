local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
    return
end

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require('lsp.handlers').on_attach,
        capabilities = require('lsp.handlers').capabilities,
    }

     if server.name == 'sumneko_lua' then
         local sumneko_opts = require('lsp.settings.sumneko_lua')
         opts = vim.tbl_deep_extend('force', sumneko_opts, opts)
     end

     if server.name == 'ccls' then
        local ccls = require('lsp.settings.ccls')
        opts = vim.tbl_deep_extend('force', ccls, opts)
     end

     if server.name == 'clang' then
        local clang = require('lsp.settings.clang')
        opts = vim.tbl_deep_extend('force', clang, opts)
     end

     if server.name == 'cmake' then
        local cmake = require('lsp.settings.cmake')
        opts = vim.tbl_deep_extend('force', cmake, opts)
     end

     if server.name == 'pylsp' then
        local pylsp = require('lsp.settings.pylsp')
        opts = vim.tbl_deep_extend('force', pylsp, opts)
     end

     if server.name == 'pyright' then
        local pyright = require('lsp.settings.pyright')
        opts = vim.tbl_deep_extend('force', pyright, opts)
     end

    server:setup(opts)
end)

