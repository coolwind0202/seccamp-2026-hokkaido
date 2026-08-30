# Slide

## Setup

```sh
pnpm install
```

`slidev`を使用して資料を作成していますが、 PDF エクスポート時にスライド間リンクが機能しない問題があったため、修正したフォーク版を submodule として同梱しています。
そのため、slidev の submodule で build します。

```sh
cd slidev
pnpm run build
```

本ディレクトリに戻って、サーバーを起動します。

```sh
cd ..
pnpm run dev
```

### エクスポート用の依存関係インストール

PDF エクスポートには Playwright が使用されます。
Playwright が必要とする `libatk` などの依存関係がない場合には、次のコマンドでインストールできます。

```sh
pnpx -y playwright install-deps chromium
```
