-- ~/.config/nvim/lua/plugins/cmp.lua
return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "giuxtaposition/blink-cmp-copilot",
    },
    opts = {
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" }, -- Enterで確定
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,
            transform_items = function(_, items)
              local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
              if not CompletionItemKind["Copilot"] then
                local kind_idx = #CompletionItemKind + 1
                CompletionItemKind[kind_idx] = "Copilot"
                CompletionItemKind["Copilot"] = kind_idx
              end
              for _, item in ipairs(items) do
                item.kind = CompletionItemKind["Copilot"]
                item.kind_icon = ""
              end
              return items
            end,
          },
        },
      },
      completion = {
        list = {
          selection = {
            preselect = true,    -- 最初の候補を自動選択
            auto_insert = false, -- 選択しただけでは挿入しない
          },
        },
        documentation = {
          auto_show = true, -- ドキュメントを自動表示
          auto_show_delay_ms = 200,
        },
      },
      appearance = {
        nerd_font_variant = "mono",
        kind_icons = {
          Text = "󰉿",
          Method = "󰊕",
          Function = "󰊕",
          Constructor = "󰒓",
          Field = "󰜢",
          Variable = "󰆦",
          Property = "󰖷",
          Class = "󱡠",
          Interface = "󱡠",
          Struct = "󱡠",
          Module = "󰅩",
          Unit = "󰪚",
          Value = "󰦨",
          Enum = "󰦨",
          EnumMember = "󰦨",
          Keyword = "󰻾",
          Constant = "󰏿",
          Snippet = "󱄽",
          Color = "󰏘",
          File = "󰈔",
          Reference = "󰬲",
          Folder = "󰉋",
          Event = "󱐋",
          Operator = "󰪚",
          TypeParameter = "󰬛",
        },
      },
    },
  },
}
