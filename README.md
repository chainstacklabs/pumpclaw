# pumpclaw

An agent skill for trading on pump.fun through [pumpfun-cli](https://github.com/chainstacklabs/pumpfun-cli).

Works with any agent that supports the Agent Skills standard: [OpenClaw](https://github.com/openclaw/openclaw), [Claude Code](https://docs.anthropic.com/en/docs/claude-code), [Cursor](https://cursor.com), [Codex](https://openai.com/index/codex/), and others.

## Install

```bash
# Vercel Skills CLI (any agent)
npx skills add chainstacklabs/pumpclaw

# OpenClaw — paste this link in chat
https://github.com/chainstacklabs/pumpclaw
```

## Prerequisites

- [uv](https://docs.astral.sh/uv/getting-started/installation/) (handles Python automatically — no separate Python install needed)
- pumpfun-cli: `uv tool install git+https://github.com/chainstacklabs/pumpfun-cli.git`

## What it does

Gives your AI agent the knowledge to operate pumpfun-cli: buy, sell, launch tokens, manage wallets, browse trending tokens, and handle migrations from bonding curve to PumpSwap AMM.

Includes trading safety guardrails: dry-run simulation, slippage checks, balance validation.

## Structure

```
pumpclaw/
├── SKILL.md               # Main skill (what the agent reads)
├── references/
│   ├── OPERATIONS.md       # All commands with args and flags
│   └── SAFETY.md           # Trading safety guidelines
├── assets/
│   └── token-lifecycle.md  # Bonding curve → graduation → AMM
└── scripts/
    └── check-prereqs.sh    # Verify uv, wallet, RPC are set up
```
