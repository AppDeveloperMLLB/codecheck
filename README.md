# codecheck
## Flutterのバージョン
使用するFlutterのバージョンは`3.13.9`
＊2023/10/28 プロジェクト作成時の最新

## 対象OSバージョン

|  OS  |  Version  |
| ---- | ---- |
|  iOS  |  11.0 ~ 17.1  |
|  Android  |  4.4 ~ 13  |

＊2023/10/28 プロジェクト作成時

## 開発環境構築手順
本プロジェクトでは、開発環境整備のため、以下のことを行なっている。
- fvmでFlutterのバージョン管理
- githooksでコミット前にコード整形

### fvmの導入
以下の手順を実行し、fvmを導入する
- 下記を参照し、fvmをインストールする
https://zenn.dev/altiveinc/articles/flutter-version-management
- Terminalでプロジェクトのフォルダに移動する
- 下記コマンドを実行し、Flutterのバージョンをインストールする
```
fvm install
````
- 下記コマンドを実行し、Flutterのバージョンが`3.13.9`であることを確認する
```
fvm flutter --version
````
以降、本プロジェクトで`flutter`コマンドを使う場合、`fvm flutter`コマンドを使用する必要がある。

### githooksの設定
以下の手順を実行し、プロジェクトのgithooksを参照するように設定する
- Terminalでプロジェクトのフォルダに移動する
- 下記コマンドを実行し、githooksを設定する
```
git config --local core.hookspath .githooks
```
- 下記コマンドを実行し、githooksの実行権限を付与する
```
chmod a+x .githooks/*
```
- 下記コマンドを実行し、参照先が`.githooks`になっていることを確認する
```
git config --local --list | grep core.hookspath
```