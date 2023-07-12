return {
  -- code rain
  {
    "eandrju/cellular-automaton.nvim",
    keys = { "<leader>r" },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
      require("noice").setup()
      require("notify").setup {
        background_colour = "#1a1b26",
      }
      local notify = vim.notify
      vim.g.notify = function(msg, ...)
        if msg:match "warning: multiple different client offset_encodings" then
          return
        end

        notify(msg, ...)
      end

      notify = function(msg, ...)
        if
          msg:match "warning: multiple different client offset_encodings detected for buffer, this is not supported yet"
        then
          return
        end
        notify(msg, ...)
      end
    end,

    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  {
    "Dhanus3133/LeetBuddy.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("leetbuddy").setup {
        domain = "cn", -- `cn` for chinese leetcode
        language = "cpp",
      }
    end,
    keys = {
      { "<leader>lq", "<cmd>LBQuestions<cr>", desc = "List Questions" },
      { "<leader>ll", "<cmd>LBQuestion<cr>", desc = "View Question" },
      { "<leader>lr", "<cmd>LBReset<cr>", desc = "Reset Code" },
      { "<leader>lt", "<cmd>LBTest<cr>", desc = "Run Code" },
      { "<leader>lp", "<cmd>LBSubmit<cr>", desc = "Submit Code" },
    },
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
}
