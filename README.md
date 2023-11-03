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

## フォルダ構成
```
codecheck/lib
├── core // アプリ全体で使うコードやユーティリティ、拡張コードを格納
│   ├── exception // エラーの定義。エラーに応じて、メッセージを表示したい場合は`exception_message.dart`に定義している。
│   └── router // ルーティングの定義
├── data // APIの利用や、DBへの保存などはこの層で行う
│   ├── repository // APIを利用したコードやDBを利用するコードを格納。
│   ├── request // APIのクエリパラメータやリクエストボディをJsonにシリアライズするためのコードを格納
│   └── response // APIのレスポンスをJsonからデシリアライズするためのコードを格納
├── domain // ビジネスロジックのコードを格納。DDDでいうエンティティ、リポジトリのインターフェース定義をこの層に格納している
│   ├── entity // DDDでいうエンティティを格納
│   └── repository // データに対する操作の定義を格納。ここでは`abstract class`を定義し、実際のコードはdata層に持つ
├── presentation // UIに関するコードを格納
│   ├── page // 一画面単位でファイルを格納
│   ├── provider // 主にAPIの実行結果や、アプリ全体で共有する状態をRiverpodを使い定義。このプロジェクトでは、APIの実行はUseCaseを通じて行うようにしているため、UseCaseを呼び出すのが主になる。
│   ├── validator // 入力テキストなどのバリデータを格納
│   └── widget // ボタンやテキストなどのコンポーネントや、コンポーネントを組み合わせたテンプレとを格納
└── usecase // アプリで実行するユースケースのコードを格納。presentation層から入力を受け取り、domain層のリポジトリを使って何かを行うのが主になる。
```

## テストについて
### Unit Test
現在は対象のロジックがないので追加していないが、何らかのロジックを追加する際はそれの単体テストを追加する。

### Widget Test
表示の確認をしやすくするため、 [golden_toolkit](https://pub.dev/packages/golden_toolkit)を導入している。  
テストを実行すると、`goldens`フォルダにある画像ファイルとテスト実行時の表示を比較して、差異がなければ成功、差異があれば失敗となる。  
新しくテストを追加したときや、変更した時は、`flutter test --update-goldens --tags=golden`を実行すれば、`goldens`フォルダにある画像ファイルを更新できる。  
  
複数の表示状態を確認したいときや、表示崩れがないか確認したい場合に、テストを書けば簡単にチェックができる。  
ただ、文言が変わったり、デザインが変わった場合、テストが失敗するので、GoldenTestだけではなく、WidgetTestと併用する。  
以下の方針で、確認することによってざっくり使い分ける。  
  
|  テスト種別  |  確認すること  |
| ---- | ---- |
|  Widget Test |  表示状態、操作の結果  |
|  Golden Test  |  表示状態、デザイン、表示崩れがないか  |

Widgetの種別（コンポーネント、テンプレート、ページ）の観点では以下になります。

|  テスト種別  |  Widget種別  |
| ---- | ---- |
|  Widget Test |  ページ、テンプレート  |
|  Golden Test  |  コンポーネント、テンプレート  |

コンポーネント : ボタン、テキストフィールドなどのパーツ  
テンプレート : フォームなどコンポーネントを組み合わせたもの  
ページ : 画面  
コンポーネント、テンプレートについては、[デザイン庁のデザインシステム](https://www.figma.com/community/file/1255349027535859598/design-system-1-4-0)のイメージです。

### Integration Test
リリースする前に、リリースする機能のユースケースを実行するIntegration Testを追加する。
