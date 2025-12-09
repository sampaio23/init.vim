return {
  -- The command to execute the pyright language server.
  -- This assumes you have 'pyright-langserver' (or 'pyright') installed via npm or your package manager.
  cmd = { 'pyright-langserver', '--stdio' },

  -- The file types the language server should activate for.
  filetypes = { 'python' },

  -- The markers used to determine the project root.
  -- Pyright looks for standard Python project files like pyproject.toml or a virtual environment marker.
  root_markers = { 'pyproject.toml', 'setup.py', '.git', '.venv', 'venv' },

  -- General settings for the language server.
  settings = {
    -- The top-level key for Pyright settings
    pyright = {
      -- Specifies the Python platform (e.g., auto, Linux, Windows, Darwin)
      -- 'auto' usually works well.
      -- platform = 'auto',

      -- Specifies the type checking mode. 'basic' is a good starting point.
      -- Other options are 'strict' and 'off'.
      typeCheckingMode = 'basic',

      -- Path to the local Python environment (virtual environment).
      -- If not set, Pyright will try to auto-discover it.
      -- pythonPath = 'venv/bin/python',

      -- Allows Pyright to look for stub files (*.pyi) in the site-packages
      -- of your environment.
      reportMissingTypeStubs = false,
    },
  },
}
