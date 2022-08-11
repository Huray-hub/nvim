local status_ok, wk = pcall(require, 'which-key')
if not status_ok then
    return
end

local opts = {
    mode = 'n', 
    prefix = '<leader>',
    buffer = nil, 
    silent = true, 
    noremap = true,
    nowait = true, 
}


local setup = {

    plugins = { marks = true, registers = true },

    -- add operators that will trigger motion and text object completion
    operators = { gc = "Comments" },

    key_labels = {
      ["<space>"] = "SPC",
      ["<cr>"] = "RET",
      ["<tab>"] = "TAB",
    },

    icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "†",  -- symbol used between a key and it's label
      group = "" , -- symbol prepended to a group
    },

    popup_mappings = {
      scroll_down = '<c-d>', -- binding to scroll down inside the popup
      scroll_up = '<c-u>', -- binding to scroll up inside the popup
    },

    window = {
      border = "none", -- none, single, double, shadow
      position = "bottom", 
      margin = { 1, 0, 1, 0 },
      padding = { 2, 2, 2, 2 },
      winblend = 0
    },
  
    layout = {
      height = { min = 4, max = 15 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 2, -- spacing between columns
      align = "left", -- align columns left, center or right
    },
    
    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  
    -- hide mapping boilerplate
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, 
  
    show_help = false, -- show help message on the command line when the popup is visible
    
    triggers = {"<leader>"}, -- or specify a list manually
    
    triggers_blacklist = { i = { "j", "k" }, v = { "j", "k" } }
}

local mappings = {
    ['b'] = {
        "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
        'Buffers',
    },
    ['e'] = { '<cmd>NvimTreeToggle<cr>', 'Explorer' },
    ['w'] = { '<cmd>w!<CR>', 'Save' },
    ['c'] = { '<cmd>Bdelete!<CR>', 'Close Buffer' },
    ['C'] = { '<cmd>silent! execute "%bd|e#|bd#"<CR>', 'Close all buffers but this' },
    ['h'] = { '<cmd>nohlsearch<CR>', 'No Highlight' },
    ['f'] = {
        "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({previewer = false}))<cr>",
        'Find files',
    },
    ['F'] = { '<cmd>Telescope live_grep theme=ivy<cr>', 'Find Text' },
    ['P'] = { '<cmd>Telescope projects<cr>', 'Projects' },
    ['r'] = { '<cmd>lua require("renamer").rename({empty = false})<cr>', 'Rename' },
    ['/'] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>', 'Comment' },
    ['Q'] = { '<cmd>qa!<CR>', 'Quit' },

     p = {
        name = 'Packer',
        c = { '<cmd>PackerCompile<cr>', 'Compile' },
        i = { '<cmd>PackerInstall<cr>', 'Install' },
        s = { '<cmd>PackerSync<cr>', 'Sync' },
        S = { '<cmd>PackerStatus<cr>', 'Status' },
        u = { '<cmd>PackerUpdate<cr>', 'Update' },
    },

    l = {
        name = 'LSP',
        a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code Action' },
        d = {
            '<cmd>Telescope lsp_document_diagnostics<cr>',
            'Document Diagnostics',
        },
        w = {
            '<cmd>Telescope lsp_workspace_diagnostics<cr>',
            'Workspace Diagnostics',
        },
        f = { '<cmd>lua vim.lsp.buf.formatting()<cr>', 'Format' },
        i = { '<cmd>LspInfo<cr>', 'Info' },
        I = { '<cmd>LspInstallInfo<cr>', 'Installer Info' },
        j = {
            '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
            'Next Diagnostic',
        },
        k = {
            '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>',
            'Prev Diagnostic',
        },
        l = { '<cmd>lua vim.lsp.codelens.run()<cr>', 'CodeLens Action' },
        q = { '<cmd>lua vim.diagnostic.setloclist()<cr>', 'Quickfix' },
        r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
        s = { '<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols' },
        S = {
            '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
            'Workspace Symbols',
        },
    }
}

wk.setup(setup)
wk.register(mappings, opts)
