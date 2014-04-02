# KaitouShare

編入試験・解答共有サービス

## 開発環境

* Ruby 2.1.1
* Ruby on Rails 4.0.4
* MySQL

## 開発の手順

### リポジトリの取得

```sh
git clone git@github.com:kosen-venture/KaitouShare.git
cd KaitouShare

# gemのインストール
bundle install --path vendor/bundle --without production

# DBの設定
cp config/database{.yml.sample,.yml}
# config/database.yml を各自の環境に合わせて設定してください

# DBの作成
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed # 簡単なテストデータが投入される
```


### ブランチの役割について

git-flow的なブランチの管理をします。
開発は、基本的にdevelop, issueブランチを使います。

* master
  * 最新のリリース版
* develop
  * 開発ブランチ
* issue/(issue\_id)
  * 機能ブランチ
  * 最新のdevelopからブランチを切る
* release/(version)
  * 各バージョンのリリース


### チケットの機能開発を始めるとき

最新のdevelopブランチから、issueブランチを作成してください。
issueブランチには対応する、チケットIDを含めます。

```sh
git pull origin
git checkout develop
git checkout -b issue/*
```

### チケットの機能開発を終えるとき

コミット後にpushしてください。

```sh
# 対象のファイルをステージングして
git commit -m 'commit message(#issue_id)'
git push origin
```

push後に、Pull Requestを発行してマージの申請をください。




### Copyright

(C) 2014 KosenVenture, All rights reserved.

