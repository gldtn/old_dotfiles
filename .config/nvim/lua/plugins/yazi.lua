return {
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    keys = {
      {
        "<leader>y",
        function() require("yazi").yazi() end,
        desc = "Yazi file manager",
      },
    },
    ---@type YaziConfig
    opts = {
      open_for_directories = true,
    },
    config = function(_, opts)
      require("yazi").setup(opts)
    end,
  },
}
