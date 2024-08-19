local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup(
  {
    {
      "jam1015/vim-slime",
      dir = "~/vim-slime",
      --branch = "dev",
      init = function()
        vim.g.slime_target = "neovim"
        vim.g.slime_python_ipython = false
        vim.g.slime_no_mappings = true
        vim.g.slime_input_pid = false
        vim.g.slime_suggest_default = true
        vim.g.slime_menu_config = false
        vim.g.slime_bracketed_paste = true
      end,

      config = function()
        local keymap = vim.keymap.set
        keymap("n", "gz", "<Plug>SlimeMotionSend", { remap = true, silent = false })
        keymap("n", "gzz", "<Plug>SlimeLineSend", { remap = true, silent = false })
        keymap("x", "gz", "<Plug>SlimeRegionSend", { remap = true, silent = false })
      end,
    },
  }
)
