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

## 使用機能と技術

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
- 認証関連(ログイン, 管理者ユーザー)
- ユーザー関連（フォロー・フォロワー）
- アイテム関連（お気に入り登録, ランキング表示）

## テスト・解析

- 単体・統合テスト(RSpec, Capybara)
- カバレッジ計測(SimpleCov)
- 静的解析(RuboCop, Brakeman)
- N+1(Bullet)
- CI/CD(CircleCI, Heroku Pipeline)
- アクセス解析(google-analytics-rails)

## 環境

- 言語(Ruby 3.0.0)
- フレームワーク(Rails 6.1.0)
- 本番環境インフラ(Heroku)
- 開発開発(Docker for Mac)
- データベース(PostgreSQL)

## プロモーション

プロテインを買う方が、1人あたりかけるお金は1ヶ月3,000円から10,000円ほど。
送料がかかるため、まとめ買いをするケースも多いです。

それだけ大きな買い物にも関わらず、「思っていた味と違った」、「前飲んでいたプロテインの方が安いしおいしかった」などど、失敗しまうケースがよく生じてしまいます。
こうしたプロテイン選びのミスは、金額面の損失に加えてトレーニングへのモチベーションにも直結するため、健康面にもデメリットとなります。

当サービスは、リアルなプロテインの口コミを集中させることで、初心者から上級者まで、自分にあったプロテイン選びができるようサポートします。

## 開発しながら得たTips

- [レビュー用の星★の評価を実装する（入力、保存、表示） - Qiita](https://qiita.com/yuki_0920/items/a966d9fa2bdb621f805d)
- [RailsでAmazonAPIを使ってみよう！ - Qiita](https://qiita.com/yuki_0920/items/7e7e9dcd955fed777bc1)
- [Dockerの環境構築で`could not connect to server: Connection refused`のエラーが出た時の対処法 - Qiita](https://qiita.com/yuki_0920/items/84e2ca260bfe13cf3072)
- [Herokuでデプロイに失敗するときの対処法(Ruby app detected されない問題) - Qiita](https://qiita.com/yuki_0920/items/b1065777edf090351052)

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

5. RSpecを実行する
```
$ docker-compose run --rm bundle exec rails rspec
```

6. RuboCopを実行する
```
$ docker-compose run --rm bundle exec rails rubocop
```

## コンテンツ更新手順
1. サイトマップ `config/sitemap.rb` を修正する

修正後GitHubへPush

2. Herokuインタンス上のサイトマップを更新する
```
$ heroku run rails sitemap:refresh
```

定期的なサイトマップ更新はHerokuSchedulerでやっている
