-- pylsp configuration
return {
  pylsp = {
    cmd = { "pylsp" },
    root_markers = { "pyproject.toml", "setup.py", ".git" },
    settings = {
      pylsp = {
        configurationSources = { "flake8" },
        plugins = {
          jedi = {
            environment = vim.fn.getcwd() .. "/.venv/bin/python",
          },
          black = { enabled = true, line_length = 99 },
          isort = { enabled = true, profile = "black" },
          pylama = { enabled = true },
          pycodestyle = { enabled = false },
          mccabe = { enabled = false },
          pyflakes = { enabled = false },
          flake8 = { enabled = false },
          rope_completion = { enabled = true },
          rope_autoimport = { enabled = true },
        },
      },
    },
  },
}
