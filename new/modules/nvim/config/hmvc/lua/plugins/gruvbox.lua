return {
  -- gruvbox-material: A retro groove color scheme for Vim/Neovim.
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    -- load this before all the other start plugins
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "soft"
      vim.g.gruvbox_material_transparent_background = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_disable_italic_comment = 1
      vim.g.gruvbox_material_cursor = "orange"
      vim.g.gruvbox_material_visual = "grey background"

      vim.opt.termguicolors = true
      vim.opt.background = "dark"
      vim.cmd('colorscheme gruvbox-material')
    end,
  },
}
