# Rails Functions Task

ユーザー登録、ログイン、プロフィール表示、ログアウトを通して、Railsの基本的な認証機能を学ぶための教材用アプリケーションです。

## 動作環境

- Ruby 4.0.5
- Ruby on Rails 8.1.3
- Bundler 4.0.16
- PostgreSQL 18.4
- Node.js 24.18.0 LTS (Krypton)
- Yarn 1.22.22

JavaScriptはShakapacker 10とWebpack 5で管理し、既存のTurbolinksとRails UJSを使用します。

## セットアップ

PostgreSQLを起動した後、次のコマンドを実行してください。

```bash
bundle install
yarn install --frozen-lockfile
bundle exec rails db:prepare
bundle exec rails db:migrate:status
```

まとめてセットアップする場合は、次のコマンドも利用できます。

```bash
bin/setup
```

## 起動

```bash
bundle exec rails server
```

ブラウザで `http://localhost:3000/users/new` または `http://localhost:3000/sessions/new` を開いてください。

## テストと検証

```bash
bundle exec rails test
bundle exec rails zeitwerk:check
bundle exec rails routes
RAILS_ENV=test NODE_ENV=production bundle exec bin/shakapacker
```

RSpec評価コードが配置されている環境では、次のコマンドも実行します。

```bash
bundle exec rspec
```

## 環境変数

ローカル開発では環境変数は必須ではありません。接続先を上書きする場合は `DATABASE_URL` を設定してください。本番環境ではDB設定に応じて `rails_functions_task_DATABASE_PASSWORD` を、暗号化credentialsを利用する場合は `RAILS_MASTER_KEY` を設定します。
