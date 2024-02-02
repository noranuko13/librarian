# librarian


## Requirements

Docker, Docker Compose がインストールされている必要がある。

```shell
$ docker -v
$ docker compose version
```


## Reference

```shell
# イメージをビルドする
$ docker compose build
$ docker compose build --no-cache
# コンテナを起動する
$ docker compose up review -d
# コンテナに入る
$ docker compose exec review bash
# 製本する
$ rake bookbinding:pdf[repository/inspect,tech]
# コンテナから出る
$ exit
# コンテナを停止する
$ docker compose down review
```

```shell
# アップグレード差分を更新する
$ review-init upgrade --without-doc --force
```


## License

Re:VIEW が LGPL-2.1 license です。

今のところライブラリ内のソースコードを用いた改造を施す予定はありませんが、
一時の気の迷いかもしれないので、このリポジトリ自体も LGPL-2.1 license を指定しています。

- [kmuto/review](https://github.com/kmuto/review)
  - [License](https://github.com/kmuto/review?tab=readme-ov-file#license)
  - [Copyright](https://github.com/kmuto/review?tab=readme-ov-file#copyright)

他は基本的には Simplified BSD, MIT ライセンスで構成されています。
その他の細かいライセンスについては [pivotal/LicenseFinder](https://github.com/pivotal/LicenseFinder) をインストールしてあるので活用ください。

```shell
# 使用されたパッケージ＋ライセンス一覧を表示する
$ license_finder
```
