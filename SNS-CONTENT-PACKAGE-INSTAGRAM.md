# SNS Content Package — Instagram

## Campaign: manus-claude-orchestrator OSS Launch
## Format: Carousel (5 slides, 1080x1080)
## Language: Japanese + English (tech terms)
## Brand: cc-teacher-sns

---

### Slide 1: Cover / Hook

**Text elements:**
- Headline: `Manus x Claude Code = AI CEO`
- Subtext: `世界初のオーケストレーション Skill を OSS 公開`
- Badge (上部): `OPEN SOURCE`

**Visual direction:**
- ダークグラデーション背景 (#0D1117 → #161B22)
- Headline はサンセリフ太字、白 (#FFFFFF)、中央配置
- 「Manus」を Manus ブランドカラー (#4A90D9) でハイライト
- 「Claude Code」を Anthropic オレンジ (#D97757) でハイライト
- 下部に薄い回路基板パターンをオーバーレイ
- 右下に cc-teacher-sns ロゴ (小)

**Colors:**
- Background: #0D1117 → #161B22
- Primary text: #FFFFFF
- Accent blue: #4A90D9
- Accent orange: #D97757

---

### Slide 2: Architecture

**Text elements:**
- Title: `アーキテクチャ`
- Subtitle: `Manus thinks. Claude codes. This skill is the bridge.`
- Diagram labels:
  - `Manus Desktop` — 戦略・計画・意思決定
  - `Terminal I/O` — 標準入出力ブリッジ
  - `Claude Code REPL` — 実装・テスト・Git 操作

**Visual direction:**
- 横並び 3 ブロックのフローチャート (左 → 中央 → 右)
- 各ブロックは角丸カード (#1C2128 背景、1px #30363D ボーダー)
- ブロック間を矢印 (→) で接続、矢印上に「stdin/stdout」ラベル
- Manus ブロックに脳アイコン、Terminal にターミナルアイコン、Claude Code にコードアイコン
- 下部に補足: 「Skill がこの接続を自動管理」(#8B949E テキスト)

**Colors:**
- Background: #0D1117
- Cards: #1C2128 with #30363D border
- Arrows: #4A90D9
- Labels: #C9D1D9
- Subtitle: #8B949E

---

### Slide 3: 5 Features

**Text elements:**
- Title: `5つの特徴`

| # | Feature | Description |
|---|---------|-------------|
| 1 | Session Lifecycle | 6 フェーズの自動管理 (Init → Plan → Execute → Monitor → Review → Close) |
| 2 | Policy YAML | 承認基準を YAML で外部化。チームで共有可能 |
| 3 | Task Templates | coding / research / refactor / testing / review の 5 種類 |
| 4 | Safety Guards | Git ブランチ保護 + コスト上限 + 自動バックアップ |
| 5 | Improvement Loop | セッション終了後に自動で振り返り・ルール改善 |

**Visual direction:**
- 縦積みリスト、各行にナンバーバッジ + アイコン + テキスト
- ナンバーバッジ: #4A90D9 背景の円形、白テキスト
- アイコン (線画スタイル):
  1. 回転矢印 (lifecycle)
  2. 歯車 + ファイル (policy)
  3. テンプレートアイコン (templates)
  4. シールド (safety)
  5. 上昇矢印ループ (improvement)
- 各行の間に薄いセパレーター (#21262D)

**Colors:**
- Background: #0D1117
- Number badges: #4A90D9
- Feature name: #FFFFFF (bold)
- Description: #C9D1D9
- Icons: #D97757

---

### Slide 4: Install

**Text elements:**
- Title: `3分で始める`
- Code block:
  ```
  npx skills add kazu171/manus-claude-orchestrator
  ```
- Steps:
  1. `Install` — 上のコマンドを実行
  2. `Configure` — policy.yaml をカスタマイズ
  3. `Run` — Manus Desktop から Claude Code を起動

**Visual direction:**
- コードブロックは中央配置、モノスペースフォント
- コード背景: #161B22、左にターミナルプロンプト記号 `$`
- コードテキスト: #79C0FF (シンタックスハイライト風)
- 3 ステップは横並びカード、各カードにステップ番号の丸バッジ
- ステップ番号は大きく、グラデーション (#4A90D9 → #D97757)
- 下部に「Prerequisites: Node.js 18+, Claude Code CLI」を小さく表示

**Colors:**
- Background: #0D1117
- Code block bg: #161B22
- Code text: #79C0FF
- Step badges: gradient #4A90D9 → #D97757
- Step text: #FFFFFF
- Prerequisite note: #8B949E

---

### Slide 5: CTA

**Text elements:**
- Headline: `試してみよう`
- CTA 1: `GitHub でコードを見る` → github.com/kazu171/manus-claude-orchestrator
- CTA 2: `Star the repo` (星アイコン付き)
- CTA 3: `Manus を始める` → manus.im/invitation/LM102IK4RRBDDY
- Footer: `@cc_teacher_sns | Link in bio`

**Visual direction:**
- Headline は大きく中央配置
- 3 つの CTA をボタンスタイルのカードで縦積み
  - GitHub ボタン: #1C2128 背景、GitHub アイコン付き
  - Star ボタン: #D97757 背景 (アクセント)、星アイコン付き
  - Manus ボタン: #4A90D9 背景、ロケットアイコン付き
- Footer は下部に小さく、#8B949E テキスト
- 背景に微細なグリッドパターン

**Colors:**
- Background: #0D1117
- Headline: #FFFFFF
- GitHub button: #1C2128 with #30363D border
- Star button: #D97757
- Manus button: #4A90D9
- Footer: #8B949E

---

### Caption

```
Manus が考え、Claude Code が実装する。

その橋渡しをする Skill を OSS で公開しました。

「manus-claude-orchestrator」は、Manus Desktop と Claude Code を接続する世界初のオーケストレーション Skill です。

Session Lifecycle で 6 フェーズを自動管理。
Policy YAML で承認基準を外部化。
Safety Guards で Git を保護。
セッション後に自動改善する Improvement Loop 搭載。

導入は 1 コマンド:
npx skills add kazu171/manus-claude-orchestrator

GitHub リポジトリは bio のリンクから。
Manus 未登録の方は招待リンクもあります。

#ClaudeCode #Manus #AIAgent #オープンソース #AIオーケストレーション #プログラミング #開発ツール #AI自動化 #Claude #Anthropic #OSS #DevTools #AIエージェント #エンジニア #プロンプトエンジニアリング
```

---

### Hashtags

**Primary (必須):**
- #ClaudeCode
- #Manus
- #AIAgent
- #オープンソース
- #AIオーケストレーション

**Secondary (推奨):**
- #プログラミング
- #開発ツール
- #AI自動化
- #Claude
- #Anthropic
- #OSS
- #DevTools

**Reach (拡散用):**
- #AIエージェント
- #エンジニア
- #プロンプトエンジニアリング
- #テック
- #自動化
- #DX
- #開発効率化

---

### 投稿設定

- **Format:** Carousel (カルーセル)
- **Aspect:** 1:1 (1080x1080px)
- **Slides:** 5 枚
- **Account:** @cc_teacher_sns

**Alt text (アクセシビリティ):**
1. Slide 1: 「Manus x Claude Code = AI CEO。世界初のオーケストレーション Skill を OSS 公開。ダーク背景に白い太字テキスト。」
2. Slide 2: 「アーキテクチャ図。Manus Desktop から Terminal I/O を経由して Claude Code REPL に接続するフローチャート。」
3. Slide 3: 「5つの特徴リスト。Session Lifecycle、Policy YAML、Task Templates、Safety Guards、Improvement Loop。」
4. Slide 4: 「インストール手順。npx skills add コマンドと 3 ステップのクイックガイド。ダーク背景にコードブロック。」
5. Slide 5: 「CTA スライド。GitHub リポジトリへのリンク、Star ボタン、Manus 招待リンクの 3 つのアクションボタン。」

**投稿タイミング:**
- 推奨: 平日 12:00-13:00 または 20:00-21:00 (JST)
- エンジニア層のアクティブ時間帯

**Cross-post:**
- Twitter/X 版は SNS-CONTENT-PACKAGE-TWITTER.md を参照
