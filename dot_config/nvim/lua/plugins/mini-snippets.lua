return {
  {
    "echasnovski/mini.snippets",
    opts = function(_, opts)
      local gen_loader = require("mini.snippets").gen_loader

      opts.snippets = {
        -- Primero carga tus snippets personalizados
        gen_loader.from_file(vim.fn.expand("~/.config/nvim/snippets/typescriptreact/typescriptreact.json")),

        -- Luego carga los snippets predeterminados del sistema (si quieres)
        -- gen_loader.from_lang(vim.fn.expand("~/.config/nvim/snippets")),
      }

      return opts
    end,
  },
}
