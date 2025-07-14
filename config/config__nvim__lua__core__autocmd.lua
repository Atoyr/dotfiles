-- autocmd.lua

vim.api.nvim_create_augroup( 'lua', {} )

local augroup_name = 'UserFormatAndLintOnSave' -- より明確なグループ名に変更することを推奨
vim.api.nvim_create_augroup(augroup_name, { clear = true })

-- Goファイル用autocmd (グループ名を変更)
vim.api.nvim_create_autocmd( {'BufWritePre'}, {
  group = augroup_name,
  pattern = "*.go",
  callback = function()
    -- Goのimports整理とフォーマット
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
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
    vim.lsp.buf.format({async = false, timeout_ms = 3000})
  end
})

-- TypeScript (*.ts) および Vue (*.vue) ファイル用の新しいautocmd
vim.api.nvim_create_autocmd({'BufWritePre'}, {
  group = augroup_name,
  pattern = {"*.ts", "*.tsx", "*.vue", "*.js", "*.jsx"}, -- 対象の拡張子を配列で指定
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()

    -- LSP を利用した Lint Fix を試みる (例: ESLint の source.fixAll)
    -- 利用可能な CodeAction の種類は LSP サーバーによって異なります。
    -- 一般的なものとして "source.fixAll", "source.fixAll.eslint" などがあります。
    -- ESLint LSP (例: eslint_d, vscode-eslint) を使っている場合、これらが有効なことが多いです。
    local params = vim.lsp.util.make_range_params(nil, bufnr) -- 現在のバッファを指定
    params.context = {
      diagnostics = vim.lsp.diagnostic.get_line_diagnostics(bufnr), -- 現在の診断情報を含める
      only = { "source.fixAll", "source.fixAll.eslint", "quickfix" } -- 試行するアクションの種類
    }

    -- textDocument/codeAction リクエストを発行
    -- タイムアウトを適切に設定 (例: 5000ms, lint処理は時間がかかることがあるため)
    local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 5000)

    local applied_fix = false
    if result then
      for client_id, client_actions in pairs(result) do
        local client = vim.lsp.get_client_by_id(client_id)
        if client and client_actions.result then
          local actions_to_apply = {}
          for _, action in ipairs(client_actions.result) do
            -- "eslint.applyAutofix" のようなコマンドや、"source.fixAll" 系のeditを持つアクションを優先
            if action.edit or (action.kind and string.find(action.kind, "source.fixAll", 1, true)) or (action.command and action.command.command) then
              table.insert(actions_to_apply, action)
            end
          end

          -- 優先度の高いアクションから適用 (ここでは単純に最初に見つかったものを適用)
          if #actions_to_apply > 0 then
            local action = actions_to_apply[1] -- より洗練された選択ロジックも可能
            if action.edit then
              vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding or "utf-16")
              vim.notify("Applied LSP lint fix: " .. (action.title or action.kind or "Unknown fix"), vim.log.levels.INFO, {title = client.name})
              applied_fix = true
            elseif action.command then
              vim.lsp.buf_execute_command(action.command)
              vim.notify("Executed LSP lint command: " .. (action.title or action.command.command), vim.log.levels.INFO, {title = client.name})
              applied_fix = true
            end
          end
        end
        if applied_fix then break end -- 最初のクライアントで修正が適用されたら抜ける
      end
    end

    if not applied_fix then
      vim.notify("No specific lint fixes applied via LSP code action.", vim.log.levels.DEBUG, {title = "LSP Lint"})
    end

    -- Lint Fix の後にフォーマットも実行したい場合は、ここに追加
    -- filter で適切なLSPクライアント (例: tsserver, volar, prettier) を指定すると良いでしょう。
    -- vim.lsp.buf.format({ async = false, bufnr = bufnr, timeout_ms = 3000 })
    -- もし Prettier などの特定のフォーマッタを ESLint とは別に実行したい場合は、
    -- その設定もここに追加できます。
  end
})
