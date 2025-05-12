# Windowsデスクトップ向け Webブラウザアプリ（Flutter製）

このアプリは、**Flutter**と**webview_windowsパッケージ**のみを使用して開発された、Windowsデスクトップ用の簡易Webブラウザです。

##  特徴

- Flutter製のクロスプラットフォーム技術を活用（Windowsに対応）
- Windows用WebView2（`webview_windows`）を用いてWebページを表示
- 以下の基本機能を実装済み：
  - URL入力によるページ遷移
  - 戻る／進むボタン
  - ページの再読み込み（リロード）
  - `http`や`https`で始まらない入力はGoogle検索として処理

##  制作の意図

Flutterのデスクトップ対応とWebView技術を活用した実用的なアプリを開発することで、モダンなUI開発とプラットフォーム制御の両立を実現しました。特にWindows環境でのFlutter活用事例として、ポートフォリオに加えられる内容です。

##  技術スタック

- 開発言語: Dart
- フレームワーク: Flutter
- 使用パッケージ: `webview_windows`

##  動作環境

- Windows 10以降（WebView2ランタイムが必要）
- Flutter SDK（3.0以上推奨）

##  セットアップ方法

```bash
git clone https://github.com/pikapika1774/simpleWeb.git
cd simpleWeb
flutter pub get
flutter run -d windows
