# Rocket Answer

[![Code Climate](https://codeclimate.com/github/kosen-venture/RocketAnswer/badges/gpa.svg)](https://codeclimate.com/github/kosen-venture/RocketAnswer)


編入試験・解答共有サービス

## 開発環境

* Ruby 2.4
* Ruby on Rails 5.1.2
* MariaDB

## 開発の手順

### リポジトリの取得

```sh
git clone git@github.com:kosen-venture/RocketAnswer.git
cd RocketAnswer

docker-compose build
docker-compose up

docker-compose run --rm app rails db:setup
```

### Dockerを使わない場合

- MySQL or MariaDBを用意する
- mailcatcher gemをインストールして起動しておく
    - https://mailcatcher.me/
    - 開発用のメールSMTPサーバ（ブラウザで送信されたメールが全て見られる）
- 以下の環境変数を設定する
    - `.env.local` というファイルをつくっておけば自動でロードされます

```
DATABASE_HOST=localhost
DATABASE_USER=RocketAnswer
DATABASE_PASSWORD=hogehoge
SMTP_HOST=localhost
SMTP_PORT=1025
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


### License

* GPL v2


### Copyright

(C) 2014-2017 Rocket Answer, Kosen Venture.
