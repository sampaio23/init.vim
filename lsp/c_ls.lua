return {
  -- The command to execute the clangd language server.
  -- Like with pyright, it needs '--stdio' for Neovim's built-in client.
  cmd = { 'clangd' },

  -- The file types the language server should activate for.
  -- This covers C, C++, and C++ headers.
  filetypes = { 'c', 'cpp', 'cc', 'cxx', 'h', 'hpp' },

  -- The markers used to determine the project root.
  -- clangd relies primarily on compile_commands.json (or compile_flags.txt)
  root_markers = { 'compile_commands.json', 'compile_flags.txt', '.git' },

  -- General settings for the language server.
  settings = {
    clangd = {
      -- Example setting: enables inlay hints, which show deduced types, parameter names, etc.
      inlayHints = {
        enabled = true,
      },
      -- Example setting: allows clangd to index project files in the background.
      backgroundIndex = true,
    },
  },
}
