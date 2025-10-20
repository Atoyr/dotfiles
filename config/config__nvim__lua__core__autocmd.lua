-- autocmd.lua

vim.api.nvim_create_augroup('lua', {})

local augroup_name = 'UserFormatAndLintOnSave' -- より明確なグループ名に変更することを推奨
vim.api.nvim_create_augroup(augroup_name, { clear = true })

-- Goファイル用autocmd (グループ名を変更)
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = augroup_name,
  pattern = "*.go",
  callback = function()
    -- Goのimports整理とフォーマット
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    -- タイムアウトを適切に設定 (例: 3000ms)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    if result then
      for cid, res in pairs(result) do
        if res.result then
          for _, r in pairs(res.result) do
            if r.edit then
              local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
              vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
          end
        end
      end
    end
    vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
  end
})
