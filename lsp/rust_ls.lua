return {
  -- The command to execute the rust-analyzer language server.
  -- This assumes you have `rust-analyzer` installed and in your PATH.
  cmd = { 'rust-analyzer' },

  -- The file types the language server should activate for.
  filetypes = { 'rust' },

  -- The markers used to determine the project root.
  -- rust-analyzer typically looks for `Cargo.toml`.
  root_markers = { 'Cargo.toml' },

  -- General settings for the language server.
  settings = {
    ['rust-analyzer'] = {
      -- Example setting: enables additional inlay hints for method chains.
      inlayHints = {
        chainingHints = true,
      },
      -- Example setting: enables the experimental proc macro support (often useful).
      procMacro = {
        enable = true,
      },
    },
  },
}
