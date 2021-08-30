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

## 技術構成

- API(Ruby 3.0, Rails 6.1)
- APIインフラ(Heroku)
- フロントエンド(TypeScript 4.5, Nuxt.js 2.15 ※Composition API利用)
- ホスティング(Netlify)
- 開発開発(Docker, Docker Compose)
- データベース(PostgreSQL)

## テスト・解析

- APIテスト(RSpec)
- カバレッジ計測(SimpleCov)
- 静的解析(RuboCop, Brakeman, ESLint)
- N+1(Bullet)
- CI/CD(CircleCI, GitHub Actions, Heroku Pipeline)
- API スキーマ定義(OpenAPI Specification, Committee::Rails)
- API クライアント生成(OpenAPI Generator)
- アクセス解析(nuxt/google-analytics)

## 使用機能と技術

### API

- 画像アップロード(Amason S3, CarrierWave)
- ページネーション(Kaminari)
- 問い合わせメール送信(ActionMailer)
- アイテム情報取得(Amazon Product Advertising API)
- 認証(bcrypt)

### フロント
- サイトマップ(nuxtjs/sitemap)
- SEO(Vue Meta)
- デザイン(BootstrapVue, Sass)

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
- [【Rails×Vue.js×Webpacker】|Vue2系から3系のアップデートとTypeScript 導入の手順 - Qiita](https://qiita.com/yuki_0920/items/2eab16aadbe2f3a8d73e)

## 環境構築手順

1. イメージを生成する

```
$ docker-compose build
```

2. Bundle Install

```
$ docker-compose run --rm web bundle install
```

3. データベースをセットアップする

```
$ docker-compose run --rm web bundle exec rails db:reset db:seed
```

4. npm ライブラリインストール

```
docker-compose --rm web yarn
```


5. コンテナを起動する

```
$ docker-compose up
```

6. RSpec を実行する

```
$ docker-compose run --rm bundle exec rspec
```

7. RuboCop を実行する

```
$ docker-compose run --rm bundle exec rubocop
```
## その他

### Swagger 起動

docker-compose で起動している

http://localhost:8080 で確認可能。

### OpenAPI Generator による Client の型生成

```
docker run --rm -v "${PWD}:/local" openapitools/openapi-generator-cli generate \
  -i local/openapi/openapi.yaml \
  -g typescript-axios \
  -o local/front/types/typescript-axios
```

### ローカル上のCircleCI 実行

RSpec を実行する

```
$ circleci local execute --job rspec
```

RuboCop を実行する

```
$ circleci local execute --job rubocop
```
