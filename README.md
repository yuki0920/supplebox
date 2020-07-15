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
  
## 機能と使用技術

- インフラ(Heroku)
- 単体・統合テスト(RSpec, factory_bot, capybara)
- データベース(PostgreSQL)
- 画像アップロード(Amason S3, carrierwave, mini_magick, fog)
- ページネーション(kaminari)
- お問い合わせメール送信(ActionMailer)  
- アイテム情報取得(Amazon Product API, amazon-ecs)
- 検索(ransack)
- アクセス解析(google-analytics-rails)
- サイトマップ(sitemap_generator)
- メタタグ(meta-tags)
- パンくずリスト(gretel)
- デザイン(Bootstrap)  
- 認証関連(ログイン, 管理者ユーザー)
- ユーザー関連（フォロー・フォロワー）
- アイテム関連（お気に入り登録, ランキング表示）

## 環境

- 言語(Ruby 2.5.3)
- フレームワーク(Rails 5.2.3) 
- 開発(Cloud9)

## プロモーション

プロテインを買う方が、1人あたりかけるお金は1ヶ月3,000円から10,000円ほど。
送料がかかるため、まとめ買いをするケースも多いです。

それだけ大きな買い物にも関わらず、「思っていた味と違った」、「前飲んでいたプロテインの方が安いしおいしかった」などど、失敗しまうケースがよく生じてしまいます。
こうしたプロテイン選びのミスは、金額面の損失に加えてトレーニングへのモチベーションにも直結するため、健康面にもデメリットとなります。

当サービスは、リアルなプロテインの口コミを集中させることで、初心者から上級者まで、自分にあったプロテイン選びができるようサポートします。

## 環境構築手順

1. イメージを生成する

```
$ docker-compose build
```


2. コンテナを起動する
データベースセットアップ前にコンテナを起動していないとデータベースのセットアップコマンドが失敗する
```
$ docker-compose up
```

3. データベースをセットアップする
```
$ docker-compose exec rails bundle exec rails db:create db:migrate db:seed
```

4. RSpecを実行する
```
$ docker-compose run rails rspec
```

5. RuboCopを実行する
```
$ docker-compose run rails rubocop
```

## コンテンツ更新手順
1. サイトマップ `config/sitemap.rb` を修正する

修正後GitHubへPush

2. Herokuインタンス上のサイトマップを更新する
```
$ heroku run rails sitemap:refresh
```

定期的なサイトマップ更新はHerokuSchedulerでやっている
