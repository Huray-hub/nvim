libs = {
    './pkgs/lsp-installer',
    './pkgs/tree-sitter',
    './pkgs/telescope',
    './pkgs/nvim-tree',
    './pkgs/cmp',
    './pkgs/presence',
    './pkgs/lsp-config',
    './pkgs/alpha',
    './pkgs/project',
    './pkgs/which-key'
}

for index, item in ipairs(libs) do 

    local status_ok, lib = pcall(require, item)
    if not status_ok then 
        return 'Error. ' + lib + ' broke.'
    end

    if item == './pkgs/lsp-config' then 
        -- Sorry hardcoded :/
        local lib_ok, _ = lib.setup()
        if not lib_ok then
            return "Could not setup lsp-config"
        end
    end
end