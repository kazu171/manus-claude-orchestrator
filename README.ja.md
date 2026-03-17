# Manus Claude Orchestrator

> [Manus Desktop](https://manus.im/invitation/LM102IK4RRBDDY) と [Claude Code](https://claude.ai/code) を繋ぐ、世界初のスキル。
> Manus を CEO にして、コーディングセッションを指揮させよう。

## なぜ作ったか

**Manus は考える。Claude はコードを書く。でも、お互いに話せない。**

Manus Desktop の「My Computer」機能はターミナルを操作できます — Claude Code の REPL も含めて。このスキルは、Manus が Claude Code を CEO のように指揮するためのプレイブックです。

このスキルがなければ、Manus は Claude Code に盲目的にタイプするだけ。このスキルがあれば、構造化されたプロトコルに従います：コーディング前の計画、ポリシーベースの承認、安全ガード、継続的改善。

## 特徴

- **Session Lifecycle** — 6 フェーズの決定論的パイプライン
- **Policy-Driven Approvals** — YAML で自動承認・確認・拒否を制御
- **Task Templates** — 5 つの構造化テンプレート（機能、バグ修正、リファクタ、レビュー、プロジェクトフェーズ）
- **Safety Guards** — Git 保護、コスト上限、エスカレーション、シークレット管理
- **Self-Improvement Loop** — セッション後の振り返りがポリシーを進化させる
- **Dialogue Protocol** — あらゆる状況に対応する対話パターン集

## 前提条件

- [Manus Desktop](https://manus.im/invitation/LM102IK4RRBDDY) — コンピュータ制御が可能な AI エージェント
- [Claude Code](https://claude.ai/code) — Anthropic の CLI ツール

> **Manus を持っていない？** [こちらからアクセス](https://manus.im/invitation/LM102IK4RRBDDY) — 「My Computer」機能だけでも価値があります。

## インストール

```bash
# 方法 1: npx skills（推奨）
npx skills add kazuya-hibara/manus-claude-orchestrator

# 方法 2: 手動
git clone https://github.com/kazuya-hibara/manus-claude-orchestrator.git ~/.agents/skills/manus-orchestrator
```

## クイックスタート（5 分）

[examples/quickstart.md](examples/quickstart.md) を参照してください。

## アーキテクチャ

```
┌─────────────────────────────────────────────┐
│                 Manus Desktop               │
│  ┌─────────────┐  ┌──────────────────────┐  │
│  │ Instructions │  │   "My Computer"      │  │
│  │ (CEO の頭脳) │  │   ターミナル制御     │  │
│  └──────┬──────┘  └──────────┬───────────┘  │
│         │    判断             │  ターミナル   │
│         └────────┬───────────┘  入力         │
└──────────────────┼──────────────────────────┘
                   │ stdin/stdout
┌──────────────────┼──────────────────────────┐
│          Claude Code REPL                    │
│  ┌────────────────────────────────────────┐  │
│  │  Skills · Teams · Agent · Plan Mode    │  │
│  │  （CC の全機能がそのまま動作）          │  │
│  └────────────────────────────────────────┘  │
└──────────────────────────────────────────────┘
```

## ライセンス

[MIT](LICENSE)

---

Built by [@kazuya-hibara](https://github.com/kazuya-hibara) | [Manus Desktop を入手](https://manus.im/invitation/LM102IK4RRBDDY)
