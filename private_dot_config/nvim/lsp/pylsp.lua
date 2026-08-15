return {
    --Command and arguments to start the server
    cmd = { 'pylsp' },

    -- Filetypes to automatically attach to
    filetypes = { 'python' },

    -- Sets the workspace to the directory where any of these files are found
    -- Files that share a root directory will reuse the LSP server connection
    -- Nested lists indicate equal priority, see |vim.lsp.Config|
    root_markers = { '.git' },

    -- Specific settings to send to the server. The schema is server-defined
    settings = {
    }
}

