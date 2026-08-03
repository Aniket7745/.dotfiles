return {
  "kawre/leetcode.nvim",
  build = ":TSUpdate html",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "ibhagwan/fzf-lua",
    "nvim-tree/nvim-web-devicons",
  },

  opts = {
    lang = "cpp",
    plugins = {
      non_standalone = true,
    },
  },

  keys = {
    { "<leader>ll", "<cmd>Leet list<CR>", desc = "LeetCode List" },
    { "<leader>ld", "<cmd>Leet daily<CR>", desc = "LeetCode Daily" },
    { "<leader>lr", "<cmd>Leet random<CR>", desc = "LeetCode Random" },
    { "<leader>lt", "<cmd>Leet test<CR>", desc = "LeetCode Test" },
    { "<leader>ls", "<cmd>Leet submit<CR>", desc = "LeetCode Submit" },
    { "<leader>lx", "<cmd>Leet exit<CR>", desc = "LeetCode Exit" },
    { "<leader>lc", "<cmd>Leet console<CR>", desc = "LeetCode Console" },
  },
}
