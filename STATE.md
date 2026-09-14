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
1. 無料診断ページを無料ホスティングで公開→Zenn自動投稿記事から流入（自動化済み・連携待ち）
2. 成功報酬のみ：(a)AIツール公式へのアフィリ差し替え（URL報告待ち・以後自動）(b)30本パック700円案をGumroad/noteで販売（URL報告待ち・以後自動）
3. 24h無人化：静的ページ＋プラットフォーム決済・配信。push連動の自動デプロイ・自動投稿で人手ゼロ運用。

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
- artifacts: site/index.html(v0.2), site/robots.txt, site/sitemap.xml, product/prompt-pack-01.md, articles/ai-jitan-prompt-mail-gijiroku.md, wrangler.toml, docs/oneshot-setup.md (公開中： https://young-shape-ad1c.nyangorinyangori.workers.dev/ )
- validation: Zenn slug規約（12〜50字・a-z0-9-_・ファイル名=slug・frontmatter）をwebsearchで確認し適合

## Next
- 人間のワンショット残件：⑤アフィリURL・商品URLを1メッセージで報告（登録・審査は人間のみ可）。完了済み：②repo・push、③Worker連携、④Zenn連携。①opencode再起動は未確認（新権限の反映に必要）。以後はCEOが全自動運用し定常要求しない。
- 補足：ローカルはcommit済み（5251824・main・tree clean）。`git add` 時の混入チェック済み（node_modules除外・秘密情報なし）。
