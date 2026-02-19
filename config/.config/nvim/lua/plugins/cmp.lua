-- ~/.config/nvim/lua/plugins/copilot.lua
return {
  -----------------------------------------------------------
  -- blink.cmp + Copilotソース
  -----------------------------------------------------------
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "giuxtaposition/blink-cmp-copilot",
    },
    opts = {
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
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = "Copilot"
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
          },
        },
      },
      appearance = {
        kind_icons = {
          Copilot = "",
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
-- return{
--   {
--     "giuxtaposition/blink-cmp-copilot",
--   },
--   {
--     "saghen/blink.cmp",
--     dependencies = {
--       {
--         "giuxtaposition/blink-cmp-copilot",
--       },
--     },
--     version = "1.*",
--     ---@module 'blink.cmp'
--     ---@type blink.cmp.Config
--     opts = {
--       keymap = { preset = "enter" },
--       appearance = {
--         nerd_font_variant = "mono",
--       },
--       completion = { documentation = { auto_show = true } },
--       sources = {
--         default = { "lsp", "path", "snippets", "buffer", "copilot"},
--         providers = {
--           copilot = {
--             name = "copilot",
--             module = "blink-cmp-copilot",
--             score_offset = 100,
--             async = true,
--             transform_items = function(_, items)
--               local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
--               local kind_idx = #CompletionItemKind + 1
--               CompletionItemKind[kind_idx] = "Copilot"
--               for _, item in ipairs(items) do
--                 item.kind = kind_idx
--               end
--               return items
--             end,
--           },
--         },
--       },
--       appearance = {
--         -- Blink does not expose its default kind icons so you must copy them all (or set your custom ones) and add Copilot
--         kind_icons = {
--           Copilot = "",
--           Text = '󰉿',
--           Method = '󰊕',
--           Function = '󰊕',
--           Constructor = '󰒓',
--
--           Field = '󰜢',
--           Variable = '󰆦',
--           Property = '󰖷',
--
--           Class = '󱡠',
--           Interface = '󱡠',
--           Struct = '󱡠',
--           Module = '󰅩',
--
--           Unit = '󰪚',
--           Value = '󰦨',
--           Enum = '󰦨',
--           EnumMember = '󰦨',
--
--           Keyword = '󰻾',
--           Constant = '󰏿',
--
--           Snippet = '󱄽',
--           Color = '󰏘',
--           File = '󰈔',
--           Reference = '󰬲',
--           Folder = '󰉋',
--           Event = '󱐋',
--           Operator = '󰪚',
--           TypeParameter = '󰬛',
--         },
--     },
--       fuzzy = {
--         -- versionを指定してないとバイナリが特定できずLuaにfallbackするwarningが表示される
--         implementation = "prefer_rust_with_warning",
--       },
--     },
--     opts_extend = { "sources.default" },
--   }
-- }
