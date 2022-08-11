local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
    return
end

local servers = {} 
servers['sumneko_lua'] = require('pkgs.lsps.sumneko_lua')
servers['pyright'] = require('pkgs.lsps.pyright') 
servers['clangd'] = require('pkgs.lsps.clangd')
servers['jsonls'] = require('pkgs.lsps.jsonls')
servers['gopls'] = require('pkgs.lsps.gopls')


-- servers['bashls'] = "" 
-- servers['cmake'] = "" 
-- servers['dockerls'] = "" 
-- servers['eslint'] = "" 
-- servers['html'] = "" 
-- servers['jdtls'] = ""  
-- servers['rust_analyzer'] = "" 
-- servers['sqls'] = "" 
-- servers['yamlls'] = ""

-- TODO , fix this damn thing not working

lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = require('pkgs.lsp-config').on_attach,
      capabilities = require('pkgs.lsp-config').capabilities,
    } 

    for index, key in ipairs(servers) do        
        opts = vim.tbl_deep_extend('force', key, opts) 
    end  
    server:setup(opts)
end) 