# SNS Content Package — note.com

## Campaign: manus-claude-orchestrator OSS Launch
## Format: 記事 (article)
## Language: Japanese
## Brand: cc-teacher-sns

### タイトル
世界初：Manus Desktop × Claude Code オーケストレーション Skill を OSS 公開した

### 本文

Manus Desktop の「My Computer」機能を使ったことはありますか？

この機能は Manus にあなたの PC を直接操作させるもので、ブラウザやファイル操作だけでなく、ターミナルも操作できます。ある日、ふと気づきました。「ターミナルを操作できるなら、Claude Code の REPL も操作できるのでは？」と。

実際にやってみたら、動きました。Manus が Claude Code に指示を出し、結果を読み取り、次の判断をする。CEO が エンジニアに仕事を任せるように。

ただし、そのままでは Manus は Claude Code に「盲目的に」タイプするだけ。計画もなく、安全策もなく、学習もない。そこで、Manus に「経営判断のプレイブック」を渡す Skill を作りました。

---

## 課題：考える AI と作る AI の断絶

Manus は優れた思考・計画能力を持っています。Claude Code は強力なコーディング能力を持っています。しかし、両者を繋ぐ仕組みがありませんでした。

結果として、ユーザーが間に立って指示をコピペしたり、毎ステップを監視する必要がありました。「AI が AI を使う」未来はすぐそこにあるのに、橋がなかったのです。

---

## アーキテクチャ：API 不要、ターミナル I/O だけ

この Skill のアーキテクチャは驚くほどシンプルです。

```
┌─────────────────────────────────────────────┐
│              Manus Desktop                  │
│  ┌─────────────┐  ┌──────────────────────┐  │
│  │ Instructions │  │   "My Computer"      │  │
│  │ (CEO の頭脳) │  │   ターミナル操作     │  │
│  └──────┬──────┘  └──────────┬───────────┘  │
│         │    意思決定        │  タイプ入力   │
│         └────────┬───────────┘              │
└──────────────────┼──────────────────────────┘
                   │ stdin/stdout
┌──────────────────┼──────────────────────────┐
│          Claude Code REPL                   │
│  ┌────────────────────────────────────────┐  │
│  │  Skills · Teams · Agent · Plan Mode   │  │
│  │  (CC の全機能がそのまま動作)           │  │
│  └────────────────────────────────────────┘  │
└──────────────────────────────────────────────┘
```

ポイントは **API 連携が一切不要** ということ。Manus は人間と同じターミナルインターフェースを使って Claude Code を操作します。つまり、Claude Code の既存機能（Skills、Teams、Agent、Plan Mode）がすべてそのまま動きます。

Manus の Instructions フィールドに指示書を貼るだけで、Manus は「CEO」として振る舞い始めます。

---

## 5つの特徴

### 1. Session Lifecycle：6フェーズの決定論的パイプライン

セッションは常に同じ6フェーズを辿ります。

```
SESSION_START → PLAN_MODE → TASK_DELEGATION → INTERACTIVE_EXECUTION → REVIEW_AND_ITERATE → SESSION_END
```

「まず計画、次に実行、最後に振り返り」という流れが構造的に保証されます。Manus が暴走して計画なしにコードを書き始める、ということが起きません。

### 2. Policy-Driven Approvals：YAML で承認基準を外部化

何を自動承認し、何を人間に聞き、何を常に拒否するか。すべて `policy.yaml` に定義します。

- `always_allow`：ファイル読み書き、テスト実行など
- `ask_once`：パッケージインストールなど
- `always_deny`：本番 DB への直接操作など

判断基準がコードにハードコードされていないので、プロジェクトごとにカスタマイズできます。

### 3. Task Templates：5種類の構造化テンプレート

新機能開発、バグ修正、リファクタリング、コードレビュー、プロジェクトフェーズの5種類。Manus がタスクの意図を判別し、適切なテンプレートを自動で選択します。

テンプレートには目的、受け入れ基準、検証方法が含まれているので、Claude Code への指示が構造化されます。

### 4. Safety Guards：Git 保護、コスト上限、エスカレーション

安全策は多層的に設計しています。

- **Git 保護**：feature ブランチでの作業を強制
- **コスト上限**：セッションあたりの予算キャップ
- **エスカレーション**：本番環境への操作やセキュリティ関連は自動停止して人間に確認
- **3回連続エラーで停止**：無限ループを防止

Claude Code 側の承認ダイアログは無効化（Bypass モード）するため、Manus が唯一の安全レイヤーになります。だからこそ、このガードが重要です。

### 5. Self-Improvement Loop：セッション後の振り返りがポリシーを進化させる

セッション終了時に自動で振り返りを実行します。何がうまくいき、何がうまくいかなかったか。その結果が `policy.yaml` の改善提案として出力されます。

使えば使うほど、あなたのワークフローに最適化されていく仕組みです。

---

## 使い方クイックスタート（3ステップ）

**前提条件**：[Manus Desktop](https://manus.im/invitation/LM102IK4RRBDDY)（まだの方はこちらから）と Claude Code が必要です。

**Step 1：インストール**

```bash
npx skills add kazu171/manus-claude-orchestrator
```

**Step 2：Manus に指示書を設定**

`assets/manus-instructions.md` の内容を Manus Desktop の Instructions フィールドにコピペ。

**Step 3：Manus にゴールを伝える**

「ユーザー管理の REST API を作って」のように自然言語で指示するだけ。Manus が Claude Code を起動し、Session Lifecycle に沿って自律的に開発を進めます。

---

## まとめ

Manus Desktop × Claude Code のオーケストレーションは、「AI が AI を使う」開発ワークフローの第一歩です。

この Skill はオープンソースで公開しています。Star、Issue、PR、すべて歓迎します。

- **GitHub**: https://github.com/kazu171/manus-claude-orchestrator
- **インストール**: `npx skills add kazu171/manus-claude-orchestrator`
- **Manus Desktop**: https://manus.im/invitation/LM102IK4RRBDDY

これは v1 です。一緒に育てていきましょう。

### タグ
Claude Code, Manus Desktop, AI エージェント, オープンソース, AI 開発ツール, オーケストレーション, 自律開発, LLM

### 投稿設定
- 公開設定: 全体公開
- コメント: 許可
- マガジン: Claude Code 実践ガイド
