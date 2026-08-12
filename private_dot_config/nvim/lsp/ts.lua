return {
    --Command and arguments to start the server
    cmd = { 'typescript-language-server', '--stdio' },

    -- Filetypes to automatically attach to
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },

    -- Sets the workspace to the directory where any of these files are found
    -- Files that share a root directory will reuse the LSP server connection
    -- Nested lists indicate equal priority, see |vim.lsp.Config|
    root_markers = { '.git', 'package.json' },

    -- Specific settings to send to the server. The schema is server-defined
    settings = {
    }
}

