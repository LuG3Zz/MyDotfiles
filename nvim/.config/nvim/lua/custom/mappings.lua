local M = {}
M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["s"] = "",
    ["S"] = "",
  },
  i = {
    ["<C-g>"] = "",
  },
}
-- Your custom mappings
M.Move = {
  n = {

    --["<C-n>"] = {"<cmd> Telescope <CR>", "Telescope"},
    --["<C-s>"] = {":Telescope Files <CR>", "Telescope Files"},
    ["L"] = { "$", "Go to end of line" },
    ["H"] = { "0", "Go to head of line" },
  },

  i = {
    ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
  },
}

M.Windows = {
  n = {
    ["vs"] = { ":vsp<CR>", "window split screen shortcuts" },
    ["sv"] = { ":sp<CR>", "window split screen shortcuts" },
    ["sc"] = { "<C-w>c", "close current window" },
    ["so"] = { "<C-w>o", "close other window" },
    ["sh"] = { ":vertical resize -20<CR>", "resize window" },
    ["sl"] = { ":vertical resize +20<CR>", "resize window" },
    ["sj"] = { ":resize +10<CR>", "resize window" },
    ["sk"] = { ":resize -10<CR>", "resize window" },
  },
}
M.NvimTree = {
  n = {
    ["<A-m>"] = { ":NvimTreeToggle<CR>", "Toggle NvimTree" },
  },
}
M.crates = {
  n = {
    ["<leader>rcu"] = {
      function()
        require("crates").upgrade_all_crates()
      end,
      "upgrade_all_crates",
    },
  },
}
M.Others = {
  n = {
    ["<leader>ol"] = { ":SymbolsOutline<CR>", "SymbolsOutline " },
    ["<leader>777"] = { ":!chmod 777 %<CR>", "chmod" },
    ["<leader>rr"] = { ":CellularAutomaton make_it_rain<CR>", "CellularAutomaton" },
  },
}
M.Copilot = {
  i = {
    ["<A-]>"] = {
      function()
        return vim.fn["codeium#CycleCompletions"](1)
      end,
      "next suggestion",
    },
    ["<A-[>"] = {
      function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end,
      "previous suggestion",
    },
    ["<C-x>"] = {
      function()
        return vim.fn["codeium#Clear"]()
      end,
      "clear suggestion",
    },
  },
}
M.translate = { -- translator
  n = {

    ["tl"] = { "<cmd>TranslateW<CR>", "translate" },
  },
  v = {
    ["tl"] = { "<cmd>TranslateW<CR>", "translate" },
  },
}
M.lspsaga = {
  n = {

    ["gk"] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "go to prev diagnostic" },
    ["gj"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "go to next diagnostic" },
    ["gd"] = { "<cmd>Lspsaga goto_definition<CR>", "Go to definition" },
  },
}
vim.keymap.set("n", "<leader>o", "<cmd>Portal jumplist backward<cr>")
vim.keymap.set("n", "<leader>i", "<cmd>Portal jumplist forward<cr>")
M.portal = {
  n = {
    ["<leader>j"] = { "<cmd>Portal jumplist backward<cr>", "go to prev" },
    ["<leader>k"] = { "<cmd>Portal jumplist forward<cr>", "go to next" },
  },
}
M.gpt = {

  n = {
    ["<leader>gpt"] = { "<cmd>ChatGPT<cr>", "open ChatGPT window" },
    ["<leader>ga"] = { "<cmd>ChatGPTActAs <cr>", "ChatGPT act" },
  },
  v = {
    ["<leader>gi"] = { "<cmd>ChatGPTEditWithInstructions<cr>", "use GPT instructions select code" },
    ["<leader>ge"] = { "<cmd>ChatGPTRun explain_code<cr>", "use GPT explain select code" },
    ["<leader>gc"] = { "<cmd>ChatGPTRun docstring<cr>", "use GPT Generate code comments." },
  },
}
return M
