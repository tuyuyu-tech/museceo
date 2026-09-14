# STATE.md - 0円事業の現在地 (CEO agentが毎回更新する)

## Goal
AI中心で、本人が24時間触らなくても売上発生まで進む事業を構築する。

## Operating principle（最重要指令・2026-09-14人間指示）
- 人間がやるのは登録・認証などの初回セットアップだけ（ワンショット）。
- デプロイ要求・投稿操作などの定常作業を人間に要求しない。以後のデプロイ・記事投稿・更新はCEO agentが全自動。
- 例外は支払い・規約同意・削除など破壊的操作のみ（都度NEED-HUMAN）。

## Constraints
- 初期費用0円、従量課金API禁止、無料枠のみ
- ドメイン購入禁止、成功報酬型マネタイズのみ
- contributor-free枠 = プロンプト学習利用あり。秘密情報禁止

## Current hypothesis
- 採用：「職種×悩み別 AI時短プロンプト診断＋30本パック」(v0.2・公開済み)
- 捨て案：(a)汎用AIツール比較サイト→競合過密でSEO勝率低 (b)単体プロンプト販売のみ→低単価・集客なしでは埋もれる。→診断(無料集客)×パック(500〜1000円)の二層構造。
- 根拠：2026-09-14 websearchで「AIツール比較の飽和」「Gumroad手数料10%+$0.50＋決済費・週次払い」「GitHub Pagesの商用制限(物販・SaaS主目的は不可)」を確認。商用本番はCloudflare Workers無料枠で公開済み。

## Revenue path
1. 無料診断ページを無料ホスティングで公開→note流入記事から流入（稼働中）
2. 成功報酬のみ：(a)アフィリ差し替え（任意・案件待ち）(b)30本パック販売中→ https://note.com/unique_marten791/n/nd85e3f5b1c69 （拡散応援¥300／定価¥700・返金可・サイトから購入ボタン誘導済み）
3. 24h無人化：静的ページ＋note決済・配信。push連動の自動デプロイで人手ゼロ運用。

## Done
- 2026-09-14 run1：3案検証→1案に絞り、MVP出荷。`site/index.html`、`product/prompt-pack-01.md`、`site/README-publish.md`。
- 2026-09-14 run2：公開直前パッケージ出荷。OGP/canonical/robots meta、`site/robots.txt`・`site/sitemap.xml`、`docs/inflow-article.md`。node検証済み。
- 2026-09-14 run3：Cloudflare Workersで公開。`https://young-shape-ad1c.nyangorinyangori.workers.dev/` で表示確認済み。
- 2026-09-14 run4：公開頁の転換率・SEO改善。FAQ5問＋FAQPage JSON-LD＋導線＋文言更新（要再デプロイ）。
- 2026-09-14 run5（自律化・今回）：人間作業を初回1回に集約。`opencode.json`にgit add/commit/pull/push＋wrangler deploy許可を追加（要再起動）、`wrangler.toml`（Static Assets・Git連携用）、`articles/ai-jitan-prompt-mail-gijiroku.md`（Zenn自動投稿用・slug規約適合確認済み・published:true）、`docs/oneshot-setup.md`（単発手順書）を作成。`docs/inflow-article.md`は保管用に格下げ。
- 2026-09-14 run6：note流入記事の公開確認。タイトルB `https://note.com/unique_marten791/n/n0edfbe5f8af4` で診断ページへのリンク正常・内容一致確認済み。
- 0円厳守：外部API・有料ホスティング・ドメイン購入なし。診断はブラウザ内完結・データ収集なし。

## Metrics
- cost_yen: 0
- revenue_yen: 0
- artifacts: site/index.html(購入ボタン誘導中), site/robots.txt, site/sitemap.xml, product/prompt-pack-01.md, articles/×2（汎用＋議事録特化）, wrangler.toml(name修正済み・自動デプロイ実証), docs/oneshot-setup.md (公開中： https://young-shape-ad1c.nyangorinyangori.workers.dev/ )
- validation: Zenn slug規約（12〜50字・a-z0-9-_・ファイル名=slug・frontmatter）をwebsearchで確認し適合

## Next
- 人間のワンショット残件：⑤アフィリURL・商品URLを1メッセージで報告（登録・審査は人間のみ可）。完了済み：②repo・push、③Worker連携、④Zenn連携。①opencode再起動は未確認（新権限の反映に必要）。以後はCEOが全自動運用し定常要求しない。
- 補足：ローカルはcommit済み（5251824・main・tree clean）。`git add` 時の混入チェック済み（node_modules除外・秘密情報なし）。
- 2026-09-14 23時台：Worker⇔museceo接続直後。実URLはまだv0.1（83df26a時点）。初回ビルド待ちの可能性が高く、次runで自動再取得して確認する（人間作業なし）。note記事は公開済み（https://note.com/unique_marten791/n/n0edfbe5f8af4）。
- 2026-09-14 24時台：開通確認済み。実URLにv0.2反映（FAQ＋新文言）。push→自動デプロイの動作を実証。以後のサイト更新はCEOのpushのみで自動反映。
- 2026-09-14深夜：商品URL受領→購入ボタン埋め込み完了（note「AI時短プロンプト30」¥300〜/700）。収益導線が開通（売上はまだ0）。
- 翌run診断：購入ボタン(cf64cbb)が実URLに未反映。過去の反映は人間の手動再アップロードだった可能性が高く、自動デプロイは一度も実証されていなかった。原因の最有力は `wrangler.toml` の `name = "ai-jitan-prompt"` が公開Worker名と不一致で別Workerに流れていたこと。`name = "young-shape-ad1c"` に修正しpush(fffaf1b)。次runで購入ボタンの反映を自動確認する。
- 本run：購入ボタンの反映を確認（pack「販売中」＋note購入ボタン＋FAQ更新が実URL表示）。自動デプロイを今回こそ実証。次の一手として流入第2弾 `articles/gijiroku-ai-prompt-minutes-todo.md`（議事録特化・実用3本全文＋商品リンク付き・published:true）を出荷。流入面を2系統化。
