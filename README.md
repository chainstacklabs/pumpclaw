<img width="1200" alt="Labs" src="https://user-images.githubusercontent.com/99700157/213291931-5a822628-5b8a-4768-980d-65f324985d32.png">

<p>
 <h3 align="center">Chainstack is the leading suite of services connecting developers with Web3 infrastructure</h3>
</p>

<p align="center">
  • <a target="_blank" href="https://chainstack.com/">Homepage</a> •
  <a target="_blank" href="https://chainstack.com/protocols/">Supported protocols</a> •
  <a target="_blank" href="https://chainstack.com/blog/">Chainstack blog</a> •
  <a target="_blank" href="https://docs.chainstack.com/reference/blockchain-apis">Blockchain API reference</a> • <br> 
  • <a target="_blank" href="https://console.chainstack.com/user/account/create">Start for free</a> •
</p>

An agent skill for trading on **pump.fun** and on **letsbonk.fun**, **StonkFun** and every other launchpad on Raydium LaunchLab, through [pumpfun-cli](https://github.com/chainstacklabs/pumpfun-cli). It gives your AI agent what it needs to buy and sell on the bonding curve and in PumpSwap and Raydium CPMM pools, launch pump.fun coins, and manage a wallet, with dry runs and safety checks before real funds move.

Works with any agent that supports the [Agent Skills](https://agentskills.io/home) standard: [OpenClaw](https://github.com/openclaw/openclaw), [Claude Code](https://docs.anthropic.com/en/docs/claude-code), [Cursor](https://cursor.com), [Codex](https://openai.com/index/codex/) and others.

> **Also by Chainstack**
> - [**pumpfun-cli**](https://github.com/chainstacklabs/pumpfun-cli) — the command-line tool this skill drives; usable on its own by humans and scripts.
> - [**pumpfun-bonkfun-bot**](https://github.com/chainstacklabs/pumpfun-bonkfun-bot) — trading and sniping bot for the same venues: watches for new coins, buys, and exits on a strategy you configure.

---

**🚨 SCAM ALERT**: The Issues section is regularly targeted by scam bots that try to redirect you to an external site and drain your funds. Deleted comments in issues are scam bots after your private keys — genuine outside devs are welcome and appreciated.

**⚠️ NOT FOR PRODUCTION**: This skill is for learning purposes only. We assume no responsibility for the code or its usage. An agent using it trades real funds; keep it on a wallet you can afford to lose.

---

## Getting started

### 1. Prerequisites

- [uv](https://docs.astral.sh/uv/getting-started/installation/) — it handles Python, no separate install needed
- pumpfun-cli **0.3 or later**:

  ```bash
  uv tool install git+https://github.com/chainstacklabs/pumpfun-cli.git
  ```

- A Solana RPC endpoint. Public RPC nodes won't hold up, and coins priced in anything but SOL on LaunchLab need one that serves `getProgramAccounts`.

### 2. Install the skill

```bash
# Vercel Skills CLI (any agent)
npx skills add chainstacklabs/pumpclaw

# OpenClaw — paste this link in chat
https://github.com/chainstacklabs/pumpclaw
```

### 3. Set up the CLI

```bash
pumpfun config set rpc https://your-node.chainstack.com/abc123
pumpfun wallet create
```

Set `PUMPFUN_PASSWORD` in the agent's environment so it can trade without a password prompt. [`scripts/check-prereqs.sh`](scripts/check-prereqs.sh) checks the CLI version, RPC, wallet and password are in place.

### 4. Ask your agent

"What's the price of `<mint>`?", "Buy 0.1 SOL of `<mint>`", "Sell all of `<mint>`". The skill has the agent check the coin with `pumpfun info`, preview the trade with `--dry-run`, and only then send it.

## What it covers

| Area | What the agent can do |
|---|---|
| Trading | Buy and sell on pump.fun and LaunchLab curves, and in PumpSwap and Raydium CPMM pools once a coin graduates; the CLI routes each trade and reports the `venue` |
| Quote assets | Coins priced in SOL, USDC, tokenized stocks and other tokens, with Token-2022 transfer fees counted |
| Launch | Launch a pump.fun coin from a hosted metadata URI, with an opening buy in the same transaction |
| Fees and rewards | Collect creator fees, claim cashback, trigger a pump.fun migration |
| Wallet | Create, import, export, balances, transfers, closing empty token accounts |
| Safety | Dry runs first, slippage and priority-fee guidance, the CLI's error messages and what to do about each |

Token discovery (`pumpfun tokens`) uses pump.fun's frontend API, which currently refuses non-browser clients ([pumpfun-cli#33](https://github.com/chainstacklabs/pumpfun-cli/issues/33)); until that is fixed, the agent asks for the mint.

## Structure

```
pumpclaw/
├── SKILL.md               # Main skill (what the agent reads)
├── references/
│   ├── OPERATIONS.md       # All commands with args and flags
│   └── SAFETY.md           # Trading safety guidelines
├── assets/
│   └── token-lifecycle.md  # Bonding curve → graduation → AMM, pump.fun and LaunchLab
└── scripts/
    └── check-prereqs.sh    # Verify the CLI version, RPC, wallet and password
```

## Contributing

Open an **Issue** for feedback or bugs. A change to a pumpfun-cli command or flag usually needs a matching change here; keep `SKILL.md` and `references/OPERATIONS.md` in step with the CLI's own help.
