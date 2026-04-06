# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 概要

このリポジトリはクロスプラットフォーム対応のdotfilesを管理する。macOS/Linux（主にDebian系）とWindowsの両方をサポートしている。

## インストールコマンド

### Unix/Linux (install.sh)

```bash
# シンボリックリンクの作成
./install.sh link

# アプリケーションのインストール（Debian系のみ）
./install.sh app

# シェルをzshに変更
./install.sh chsh

# apt更新
./install.sh apt

# すべてを一括実行（link + app + chsh）
./install.sh all

# シンボリックリンクの削除
./install.sh unlink
```

### Windows (install.ps1)

```powershell
# すべてを一括実行
.\install.ps1 all

# シンボリックリンクの作成
.\install.ps1 link

# 環境変数の設定
.\install.ps1 env

# アプリのインストール（minimal/dev/personal）
.\install.ps1 app
```

## アーキテクチャ

### ディレクトリ構成

- `config/` — シンボリックリンク先となる設定ファイル群。ファイル名の `__` はパス区切り `/` として解釈される（例: `config__alacritty__alacritty.toml` → `~/.config/alacritty/alacritty.toml`）
- `scripts/` — インストール・リンクのヘルパースクリプト
  - `scripts/lib/bash/` — ログ出力（log.sh）・ディストロ検出（distro.sh）ユーティリティ
  - `scripts/link/bash/config.sh` — シンボリックリンク作成ロジック
- `installer/` — プラットフォーム別パッケージインストーラー
- `utility.sh` — Bashスクリプト共通のユーティリティ関数

### シンボリックリンクの対象

`scripts/link/bash/config.sh` が以下をホームディレクトリへリンクする:

| ソース | リンク先 |
|---|---|
| `config/.zshenv` | `~/.zshenv` |
| `config/.config/zsh` | `~/.config/zsh` |
| `config/.config/nvim` | `~/.config/nvim` |
| `config/.config/mise` | `~/.config/mise` |
| `config/.config/zellij` | `~/.config/zellij` |
| `config/.config/wezterm` | `~/.config/wezterm` |
| `config/.config/ghostty` | `~/.config/ghostty` |

### Neovim構成

`config/.config/nvim/` はLua製のモジュール構成:

- `init.lua` — エントリポイント。`core.*` と `lsp` モジュールをロード
- `lua/core/` — base設定、キーマップ、Lazy.nvim初期化、autocmd、ステータスライン
- `lua/plugins/` — Lazy.nvimによるプラグイン定義（copilot、fzf、treesitter、LSP、cmp、nvim-tree、lazygit、claude等）
- `lazy-lock.json` — プラグインバージョンのロックファイル

カラースキーマ: tokyonight（フォールバック: default dark）

### ツール管理（mise）

`config/.config/mise/config.toml` で管理するツール:

- **ランタイム**: Node 24、Go 1.26.1、Rust (latest)
- **パッケージマネージャ**: aqua
- **CLIツール**: fzf、oh-my-posh、golangci-lint、zellij、eza、lazygit、Claude Code
- **その他**: Terraform 1.14.4、MySQL、ghq

### Zsh構成

- `config/.config/zsh/.zshenv` — XDGパス定義、ZDOTDIR設定
- `config/.config/zsh/.zshrc` — メイン設定
- `config/.config/zsh/zsh.d/` — 言語別環境設定（golang、ruby、rust、fzf）
- `config/.config/zsh/zshrc.d/` — ツール別プラグイン（direnv、fzf、k8s、oh-my-posh、zellij）

## 注意事項

- `install.sh` はカレントディレクトリをDOTFILESのルートとして扱うため、リポジトリルートから実行すること
- Debian以外のLinuxディストロは `app` コマンドが未対応
- Windowsのシンボリックリンク作成には管理者権限が必要
