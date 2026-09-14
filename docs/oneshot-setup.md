# ワンショット・セットアップ（人間が1回だけ行う初期設定・所要30〜60分）

> 運営原則（最重要指令）：人間がやるのは登録・認証などの初回セットアップだけ。
> 以後のデプロイ・記事投稿・文言更新・ファイル追加はすべてCEO agentが自動実行し、
> 人間に定常の操作要求をしない。例外は支払い・規約同意・削除など破壊的操作のみ。

## 0. opencodeを再起動する（1回だけ・必須）

今回 `opencode.json` の権限を更新した（`git add/commit/pull/push` と `npx wrangler deploy` を許可）。
設定は起動時にしか読み込まれないため、opencodeを一度終了→再起動すること。
再起動後はCEO agentがコミット・プッシュ・デプロイを独断で実行できる。

## 1. GitHubリポジトリ作成＋初回プッシュ（5分）

1. GitHubで新規リポジトリを作成（public推奨・無料。秘密情報はリポジトリ内に一切なし）。
2. このフォルダで以下を実行（初回のみ。以後のadd/commit/pushはCEOが自動）：

```
git add -A
git commit -m "ship v0.2: FAQ+JSON-LD, wrangler, zenn article"
git branch -M main
git remote add origin https://github.com/<あなた>/<リポジトリ名>.git
git push -u origin main
```

## 2. Cloudflare WorkerにGit連携する（5分・以後デプロイ要求なし）

1. Cloudflareダッシュボード → 公開中のWorker（`young-shape-ad1c`）→ Settings → Version control（Git連携）で手順1のリポジトリを接続。
2. 以後 `main` へのpushで自動デプロイ。CEOが `site/` を更新→pushするだけで反映される。
3. うまく接続できない場合の代替：Pagesで同リポジトリを接続（Buildなし・出力`site/`）。その場合は新しいURLをCEOに1回だけ知らせる。

## 3. ZennにGitHub連携する（5分・以後投稿操作なし）

1. https://zenn.dev/dashboard/deploys →「リポジトリを連携する」で手順1のリポジトリを連携。
2. `articles/ai-jitan-prompt-mail-gijiroku.md`（`published: true` 済み）が自動公開される。
3. 以後の記事はCEOが `articles/` に追加→pushするだけで自動公開。修正も同様。

## 4. アフィリエイト登録（10〜20分・審査待ち含まず）

1. A8.net / Amazonアソシエイト等に無料登録（支払い情報の入力は禁止・求められたら中断してCEOに報告）。
2. 発行された紹介URLを1回だけCEOに貼る。以後の差し替え・再デプロイはCEOが自動。

## 5. デジタル商品の出品（10分）

1. Gumroad または note に無料登録し、`product/prompt-pack-01.md` の内容で商品を作成（価格案700円・成功報酬手数料のみ）。
2. 商品URLを1回だけCEOに貼る。以後の購入ボタン埋め込み・再デプロイはCEOが自動。

## 完了報告フォーマット（1メッセージでOK）

```
setup done
repo: <GitHubリポジトリURL>
site: <公開URL（変更なければ従来通り）>
affiliate: <紹介URL×n>（未取得なら none）
product: <商品URL>（未出品なら none）
```

## 禁止事項（再掲）
- 有料API・有料ホスティング・ドメイン購入・支払い情報入力は禁止。
- 秘密鍵・個人情報は扱わない。診断ページはブラウザ内完結・収集なしを維持。
- 大量投稿・自動DM・無差別宣伝はしない（Zennは1記事ずつ・実用記事のみ）。
