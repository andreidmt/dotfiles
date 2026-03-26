-- eslint configuration
return {
  eslint = {
    root_markers = {
      ".eslintrc",
      ".eslintrc.json",
      ".eslintrc.js",
      ".eslintrc.cjs",
      "eslint.config.js",
    },
    settings = {
      experimental = {
        useFlatConfig = true,
      },
      workingDirectory = { mode = "auto" },
      format = true,
    },
  },
}
