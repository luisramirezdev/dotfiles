return {
  {
    "nvim-cmp",
    enabled = true,
    opts = function(_, opts)
      opts.sources = vim.tbl_filter(function(v)
        return not vim.tbl_contains({ "luasnip" }, v.name)
      end, opts.sources or {}) -- asegurarse de que sea una tabla
    end,
  },
}
