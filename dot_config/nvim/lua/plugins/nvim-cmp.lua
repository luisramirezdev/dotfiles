return {
  {
    "nvim-cmp",
    opts = function(_, opts)
      -- Filtrar la fuente de LuaSnip para que no se incluya en el autocompletado
      opts.sources = vim.tbl_filter(function(v)
        return not vim.tbl_contains({ "luasnip" }, v.name)
      end, opts.sources)
    end,
  },
}
