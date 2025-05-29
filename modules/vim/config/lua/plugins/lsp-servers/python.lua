return function(on_attach)
  local lspconfig = require("lspconfig")

  lspconfig.pylsp.setup({
    on_attach = on_attach,
    cmd = { "pylsp" },
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
    root_dir = lspconfig.util.root_pattern(
      "pyproject.toml",
      "setup.py",
      ".git"
    ),
  })
end
