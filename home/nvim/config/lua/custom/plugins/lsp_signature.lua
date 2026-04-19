return {
  "ray-x/lsp_signature.nvim",
  event = "InsertEnter",
  opts = {
    -- cfg options
  },
  config = function()
    vim.keymap.set({ "n" }, "<C-k>", function()
      require("lsp_signature").toggle_float_win()
    end, { silent = true, noremap = true, desc = "toggle signature" })
  end,
}
