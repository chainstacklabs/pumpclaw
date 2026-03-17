# Complete Operations Reference

## Trading Operations

### `pumpfun buy <mint> <sol_amount>`
Buy tokens with SOL. Smart-routes between bonding curve and PumpSwap AMM.

| Option | Type | Default | Description |
|---|---|---|---|
| `--slippage` | INTEGER | 15 | Slippage tolerance percent |
| `--force-amm` | FLAG | off | Skip bonding curve, buy directly on PumpSwap AMM |
| `--confirm` | FLAG | off | Wait for transaction confirmation |
| `--dry-run` | FLAG | off | Simulate trade without sending transaction |

### `pumpfun sell <mint> <amount>`
Sell tokens for SOL. Amount can be a number or `all`.

| Option | Type | Default | Description |
|---|---|---|---|
| `--slippage` | INTEGER | 15 | Slippage tolerance percent |
| `--force-amm` | FLAG | off | Skip bonding curve, sell directly on PumpSwap AMM |
| `--confirm` | FLAG | off | Wait for transaction confirmation |
| `--dry-run` | FLAG | off | Simulate trade without sending transaction |

### `pumpfun info <mint>`
Display on-chain token info — price, bonding progress, reserves, graduation status.

| Option | Type | Default | Description |
|---|---|---|---|
| `--timeout` | FLOAT | 30.0 | RPC timeout in seconds |

## Token Launch

### `pumpfun launch`
Launch a new token on pump.fun (create_v2 + extend_account).

| Option | Type | Required | Description |
|---|---|---|---|
| `--name` | TEXT | Yes | Token name |
| `--ticker` | TEXT | Yes | Token ticker/symbol |
| `--desc` | TEXT | Yes | Token description |
| `--image` | TEXT | No | Path to token image |
| `--buy` | FLOAT | No | Initial buy amount in SOL |
| `--mayhem` | FLAG | No | Enable mayhem mode |

## Migration

### `pumpfun migrate <mint>`
Trigger migration from bonding curve to PumpSwap AMM. Only works when bonding curve is complete.

| Option | Type | Default | Description |
|---|---|---|---|
| `--confirm` | FLAG | off | Wait for transaction confirmation |

## Rewards & Fees

### `pumpfun claim-cashback`
Claim volume-based cashback rewards.

| Option | Type | Default | Description |
|---|---|---|---|
| `--confirm` | FLAG | off | Wait for transaction confirmation |

### `pumpfun close-volume-acc`
Close volume accumulator account and recover rent SOL.

| Option | Type | Default | Description |
|---|---|---|---|
| `--confirm` | FLAG | off | Wait for transaction confirmation |

### `pumpfun collect-creator-fee`
Collect creator fees from pump.fun and PumpSwap vaults.

| Option | Type | Default | Description |
|---|---|---|---|
| `--confirm` | FLAG | off | Wait for transaction confirmation |

## Transaction Status

### `pumpfun tx-status <signature>`
Check transaction confirmation status, slot, fee, and errors.

- `signature`: transaction signature in base58

## Wallet Management

### `pumpfun wallet create`
Generate a new wallet keypair and encrypt it.

| Option | Type | Description |
|---|---|---|
| `--force` | FLAG | Overwrite existing wallet file |
| `--password` | TEXT | Wallet password (or set `PUMPFUN_PASSWORD` env var) |

### `pumpfun wallet import <keypair_json>`
Import an existing Solana keypair JSON file and encrypt it.

| Option | Type | Description |
|---|---|---|
| `--force` | FLAG | Overwrite existing wallet file |
| `--password` | TEXT | Wallet password (or set `PUMPFUN_PASSWORD` env var) |

### `pumpfun wallet show`
Display wallet public key (no password needed).

### `pumpfun wallet export`
Export wallet as standard Solana keypair JSON (unencrypted).

| Option | Type | Required | Description |
|---|---|---|---|
| `--output` | TEXT | Yes | Output path for Solana keypair JSON |

### `pumpfun wallet balance`
Check SOL balance (no password needed).

### `pumpfun wallet tokens`
List all token accounts with balances (no password needed).

### `pumpfun wallet transfer <recipient> <amount>`
Transfer SOL or tokens to another wallet. Amount can be a number or `all`.

| Option | Type | Description |
|---|---|---|
| `--mint` | TEXT | Token mint address (omit for SOL transfer) |
| `--confirm` | FLAG | Wait for transaction confirmation |

### `pumpfun wallet close-atas`
Close empty token accounts and recover rent SOL.

| Option | Type | Description |
|---|---|---|
| `--confirm` | FLAG | Wait for transaction confirmation |

### `pumpfun wallet drain <recipient>`
Close empty ATAs, then transfer all remaining SOL to recipient.

| Option | Type | Description |
|---|---|---|
| `--confirm` | FLAG | Wait for transaction confirmation |

## Token Discovery

### `pumpfun tokens trending [--limit N]`
Top runners + recommended tokens.

| Option | Type | Default | Description |
|---|---|---|---|
| `--limit` / `-n` | INTEGER | 20 | Number of tokens to show |

### `pumpfun tokens new [--limit N]`
Recently launched tokens.

| Option | Type | Default | Description |
|---|---|---|---|
| `--limit` / `-n` | INTEGER | 20 | Number of tokens to show |

### `pumpfun tokens graduating [--limit N]`
Tokens near bonding curve completion.

| Option | Type | Default | Description |
|---|---|---|---|
| `--limit` / `-n` | INTEGER | 20 | Number of tokens to show |

### `pumpfun tokens recommended [--limit N]`
Recommended tokens by pump.fun.

| Option | Type | Default | Description |
|---|---|---|---|
| `--limit` / `-n` | INTEGER | 20 | Number of tokens to show |

### `pumpfun tokens search <query> [--limit N]`
Search tokens by keyword.

| Option | Type | Default | Description |
|---|---|---|---|
| `--limit` / `-n` | INTEGER | 20 | Number of tokens to show |

## Configuration

### `pumpfun config set <key> <value>`
Set a config value (e.g., `pumpfun config set rpc https://...`).

### `pumpfun config get <key>`
Get a config value.

### `pumpfun config list`
List all config values.

### `pumpfun config delete <key>`
Delete a config value.

## Global Options (apply to all commands)

| Option | Type | Description |
|---|---|---|
| `--json` | FLAG | Output as JSON |
| `--rpc` | TEXT | Solana RPC endpoint URL |
| `--keyfile` | TEXT | Path to encrypted wallet keystore |
| `--priority-fee` | INTEGER | Priority fee in micro-lamports |
| `--compute-units` | INTEGER | Compute unit limit |
