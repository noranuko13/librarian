= Re:VIEW記法

特殊な記法を用いたとき、この書籍に同様の記述を追加する。

バージョンアップや改修の際は、この書籍が出力できることを確認し完了とする。
それ以外はサポート対象外とし、エラーの解決は各リポジトリ・書籍配下で記法変更によってのみ行うこと。


== 記法


=== 箇条書き・リスト

==== 前提条件

 * 1件目のトラッカーにカスタムフィールドが設定されていない。
 * 2件目のトラッカーにカスタムフィールドが設定されている。
 ** 整数（末尾に『＊』が付与されているものN件）
 ** 整数（末尾に『［＊］』が付与されているもの1件）

==== 再現手順

 1. 管理者としてログインする。
 2. プロジェクトを選択する。
 3. 新しいチケット画面を開く。
 4. トラッカーを変更する。


=== ソースコード

例えば @<code>{puts "Hello, world!"} と書くと、『Hello, world!』という文字列を出力する。

//source[]{
$ docker compose up -d
$ docker ps
//}


=== 画像

@<href>{https://pixabay.com/ja/users/cocoparisienne-127419/?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=1285634, Anja}
による
@<href>{https://pixabay.com/ja//?utm_source=link-attribution&utm_medium=referral&utm_campaign=image&utm_content=1285634, Pixabay}
からの画像

//indepimage[001][@<href>{https://pixabay.com/ja/photos/1285634/, 青い目の猫}][scale=0.9]{
//}


=== テーブル

テーブルの行を区切るのは、スペースではなくタブ。

//table[environments][環境]{
呼称	説明
-----------
本番環境	契約中のお客様が利用する稼働中の環境。
ステージング環境	本番環境に近いが、スペックが少し低い環境。
営業・社外向けデモ環境	イベントや商談で使用するサンプル環境。
社内検証環境	developブランチの最新がデプロイされている環境。
ローカル環境	各開発者のパソコンに構築されている実装を行う環境。
//}


=== 囲み記事

種類が多いので使用するものは以下に限る。
また囲みの装飾は難易度が高いので、config.ymlでカスタマイズできる範囲に留める。

memo（メモ）・info（情報）・tip（Tips）は、note（ノート）に統合する。

//note[ノート]{
猫の模様の種類。成長すると変わることがあるらしい。

 * 白・黒・灰・白黒・三毛
 * キジトラ・サバトラ・茶トラ
 * ヒョウ柄・サビ
 * 靴下・はちわれ・ポイント
//}

//blankline
//blankline

notice（注意）・caution（警告）・important（重要）は、warning（注意）に統合する。

//warning[注意]{
猫にとって毒になる食べ物。

間違って口にしてしまわないように、これらの食べ物は出しっ放しにしないようにしましょう。

 * ネギ類・ナッツ類・一部の果物
 * 生肉・生卵・牛乳
 * チョコレート
 * アルコール・カフェイン・キシリトール入り
//}


=== インライン命令

 * 外部リンク
 ** @<href>{https://github.com/, GitHub}
 ** @<href>{http://www.google.com/}
 * 内部リンク
 ** @<chapref>{chaps02}
 * 装飾
 ** @<strong>{太字}


== 図

//graph[testdot][plantuml][testdot]{
@startuml
!define URL http://resources:80/shelves/repository/inspect/plantumls
!include URL/chaps01/testdot.puml
@enduml
//}

//graph[choice][plantuml][choice]{
@startuml
!define URL http://resources:80/shelves/repository/inspect/plantumls
!include URL/chaps01/choice.puml
@enduml
//}
