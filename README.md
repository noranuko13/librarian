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
$ docker compose up -d
# コンテナに入る
$ docker compose exec review bash
# 製本する
$ rake bookbinding:pdf[repository/inspect,tech]
# コンテナから出る
$ exit
# コンテナを停止する
$ docker compose down
```

```shell
# アップグレード差分を更新する
$ review-init upgrade --without-doc --force
```


## Mechanism

全体の流れは [Bookbinding::Command](./lib/bookbinding/command.rb) および Process モジュールの各クラスを参照ください。

実行していることは単純で、
- 素材ファイルを作業ディレクトリにコピー・マージする。
- Re:VIEW を実行する。
- 成果物を dist ディレクトリに格納する。

しています。

利用する上で重要なのは [Process::Collect](./lib/bookbinding/process/collect.rb), [Process::Merge](./lib/bookbinding/process/merge.rb) です。  
ファイルの優先順位・マージの詳細は、最新のソースコードを参照ください。


## How to

jackets, shelves の各ディレクトリは .gitignore で除外されています。  
直下に別リポジトリで管理している jacket, shelve を設置することで、装丁・紙束を入れ替えできます。

### jackets

書籍の装丁の部分を取り出したディレクトリです。

種類は気が向いたら増やしますが、元々の目的が「業務で手順書やマニュアルを作成するときに、同じ装丁の管理しんどい」なので、
今のところ tech 以外を増やす予定はありません。

### shelves

書籍の本文が書かれている紙束の部分を取り出したディレクトリです。

１リポジトリに対して、複数の書籍を格納することを想定しています。


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
