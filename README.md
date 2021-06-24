# SuppleBox

<a href="https://img.shields.io/github/issues-raw/yuki0920/supplebox.svg"><img alt="GitHub issues" src="https://img.shields.io/github/issues-raw/yuki0920/supplebox.svg"></a>
<a href="https://img.shields.io/github/issues-closed-raw/yuki0920/supplebox.svg"><img alt="GitHub closed issues" src="https://img.shields.io/github/issues-closed-raw/yuki0920/supplebox.svg"></a>
<a href="https://img.shields.io/github/languages/top/yuki0920/supplebox"><img alt="GitHub top language" src="https://img.shields.io/github/languages/top/yuki0920/supplebox"></a>

「プロテイン選びで失敗したくない」方に向けたプロテイン特化型口コミ共有サービスです。

<https://supplebox.jp/>

## デモアカウント

```md
メールアドレス:test@supplebox.jp
パスワード:test
```

## 環境

- サーバーサイド(Ruby 3.0.0, Rails 6.1.0)
- フロントエンド(JavaScript, Vue.js, jQuery)
- 本番環境インフラ(Heroku)
- 開発開発(Docker, Docker Compose)
- データベース(PostgreSQL)

## テスト・解析

- 単体・統合テスト(RSpec, Capybara)
- カバレッジ計測(SimpleCov)
- 静的解析(RuboCop, Brakeman, ESLint)
- N+1(Bullet)
- CI/CD(CircleCI, GitHub Actions, Heroku Pipeline)
- アクセス解析(google-analytics-rails)
- API スキーマ定義(OpenAPI Specification, committee-rails)
- API Client(OpenAPI Generator, typescript-axios)
- UI 検証(StoryBook & Chromatic) https://www.chromatic.com/builds?appId=600cbad853382200215b7275

## 使用機能と技術

- フロントエンド(Vuejs 3, Composition API, TypeScript)
- 画像アップロード(Amason S3, carrierwave, mini_magick, fog)
- ページネーション(kaminari)
- お問い合わせメール送信(ActionMailer, ActiveJob)
- アイテム情報取得(Amazon Product API, vacuum)
- 検索(ransack)
- サイトマップ(sitemap_generator, Heroku Scheduler)
- メタタグ(meta-tags)
- パンくずリスト(gretel)
- 星評価機能(jQuery Raty)
- デザイン(Bootstrap, Sass)
- 認証(Gem を使わず実装)
- アイテム関連(お気に入り登録)

## プロモーション

プロテインを買う方が、1 人あたりかけるお金は 1 ヶ月 3,000 円から 10,000 円ほど。
送料がかかるため、まとめ買いをするケースも多いです。

それだけ大きな買い物にも関わらず、「思っていた味と違った」、「前飲んでいたプロテインの方が安いしおいしかった」などど、失敗しまうケースがよく生じてしまいます。
こうしたプロテイン選びのミスは、金額面の損失に加えてトレーニングへのモチベーションにも直結するため、健康面にもデメリットとなります。

当サービスは、リアルなプロテインの口コミを集中させることで、初心者から上級者まで、自分にあったプロテイン選びができるようサポートします。

## 開発しながら得た Tips

- [レビュー用の星 ★ の評価を実装する（入力、保存、表示） - Qiita](https://qiita.com/yuki_0920/items/a966d9fa2bdb621f805d)
- [Rails で AmazonAPI を使ってみよう！ - Qiita](https://qiita.com/yuki_0920/items/7e7e9dcd955fed777bc1)
- [Docker の環境構築で`could not connect to server: Connection refused`のエラーが出た時の対処法 - Qiita](https://qiita.com/yuki_0920/items/84e2ca260bfe13cf3072)
- [Heroku でデプロイに失敗するときの対処法(Ruby app detected されない問題) - Qiita](https://qiita.com/yuki_0920/items/b1065777edf090351052)
- [Rails×Vue.js(2 系)×Webpacker のアプリの Vue 2 -> 3 アップデートと TypeScript 導入の手順 - Qiita](https://qiita.com/yuki_0920/items/2eab16aadbe2f3a8d73e)

## 環境構築手順

1. イメージを生成する

```
$ docker-compose build
```

2. Bundle Install

```
$ docker-compose run --rm bundle install
```

3. コンテナを起動する
   データベースセットアップ前にコンテナを起動していないとデータベースのセットアップコマンドが失敗する

```
$ docker-compose up
```

4. データベースをセットアップする

```
$ docker-compose exec rails bundle exec rails db:create db:migrate db:seed
```

5. RSpec を実行する

```
$ docker-compose run --rm bundle exec rails rspec
```

6. RuboCop を実行する

```
$ docker-compose run --rm bundle exec rubocop
```

## npm ライブラリインストール

```
docker-compose --rm web yarn
```

docker-compose を利用しないとホスト用のライブラリがインストールされてしまい、Docker イメージ上の Linux OS 上で実行できなくなる場合がある。

## OpenAPI Generator による Client の型生成

### コマンド

```
docker run --rm -v "${PWD}:/local" openapitools/openapi-generator-cli generate \
  -i local/openapi/openapi.yaml \
  -g typescript-axios \
  -o local/app/javascript/types/typescript-axios
```

### 型生成の問題点

OpenaAPI 定義の server から、型生成のたびに BASE_PATH が書き換えられてしまうので、リクエスト失敗したら確認する。

```diff
// app/javascript/types/typescript-axios/base.ts
- export const BASE_PATH = "http://localhost".replace(/\/+$/, "");
+ export const BASE_PATH = ""
```

## コンテンツ更新手順

1. サイトマップ `config/sitemap.rb` を修正する

修正後 GitHub へ Push

2. Heroku インタンス上のサイトマップを更新する

```
$ heroku run rails sitemap:refresh
```

定期的なサイトマップ更新は HerokuScheduler でやっている

## その他

### Swagger 起動

docker-compose で起動している

http://localhost:8080 で確認可能。

### StoryBook

#### 起動

```
$ docker-compose run -p 9009:9009 --rm web yarn storybook
```

http://localhost:9009 で確認可能。

コンテナ上のランタイムで起動し、ポートを手動で設定する。

#### デプロイ

GitHub Actions によって PUSH の度に自動デプロイしている。

https://www.chromatic.com/builds?appId=600cbad853382200215b7275 で確認可能。

#### CircleCI 実行

RSpec を実行する

```
$ circleci local execute --job rspec
```

RuboCop を実行する

```
$ circleci local execute --job rubocop
```
