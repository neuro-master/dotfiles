-- VIM OPTIONS

-- For autocompletion suggestions, open a menu (even if only one option available), show additional info (if any) and do not pre-insert text until selection chosen
vim.o.completeopt = "menuone,popup,noinsert"

-- Tab setup
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true

-- Enable line numbers (relative numbering)
vim.opt.number = true
vim.opt.relativenumber = true

-- Make delete key behave more expected
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- Use block cursor for everything
vim.opt.guicursor = ''



-- GLOBAL VARIABLES

-- Set <Leader> Key
vim.g.mapleader = ' '



-- LANGUAGE SERVER PROTOCOL CONFIGURATION

-- Enable the configuration of following LSPs
vim.lsp.enable('clangd')    -- C/C++ (clang)
vim.lsp.enable('html')      -- HTML (vscode-html-languageserver)
vim.lsp.enable('css')       -- CSS (vscode-css-languageserver)
vim.lsp.enable('ts')        -- JavaScript/Typescript (typescript-languageserver)

-- Create Autocommand whenever LSP is initiated
vim.api.nvim_create_autocmd('LspAttach', {

    -- Create the autocommand under the augroup 'my_lsp'
    group = vim.api.nvim_create_augroup('my_lsp', { clear = true }),

    -- Function associated with this autocommand
    callback = function(event)

        -- Get client object to query for feature-support
        local client = assert(vim.lsp.get_client_by_id(event.data.client_id))


        -- LSP KEYMAPS

        -- Pass these option(s) for vim.keymap.set() to enable the keymapping only for LSP buffers
        local opts = { buffer = event.buf }

        -- Jump to implementation (mainly C++)
        if client:supports_method('textDocument/implementation') then
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        end

        -- Enable auto-completion
        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        end

        -- Map Ctrl-Space to trigger autocompletion menu
        vim.keymap.set('i', '<C-Space>', function() vim.lsp.completion.get() end, opts)

        -- Basic (go-to) keymappings
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

        -- Rename symbol
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)

        -- Open code actions window
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)

        -- See information about function signature
        vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, opts)

        -- Open diagnostic information window
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)

        -- Jump to next diagnostic
        vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, opts)

        -- Jump to previous diagnostic
        vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, opts)

    end
})

