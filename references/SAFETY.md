# Trading Safety Guidelines

## Before Every Trade

1. **Dry-run first** — always simulate with `--dry-run` before committing funds
2. **Check token info** — run `pumpfun info <mint>` to understand current price, reserves, and graduation status
3. **Verify balance** — `pumpfun wallet balance` to confirm you can cover the trade (in the coin's quote asset) + transaction fees in SOL
4. **Know the routing** — bonding curve tokens and graduated AMM tokens behave differently, and `venue` says which one a trade used

## Slippage Management

- Default slippage is **15%** — appropriate for most small trades
- For trades > 1 SOL, consider tightening to **5-10%**
- For volatile/new tokens, you may need **20-25%**
- Use `--dry-run` to see expected output before committing

## Priority Fees

- Default priority fee works for normal network conditions
- During congestion, increase with `--priority-fee <micro_lamports>`
- Higher priority = faster confirmation but higher cost
- Check recent network conditions before setting aggressive fees

## Compute Units

- Default CU limit handles standard trades
- Complex operations (migration, multi-instruction) may need higher limits
- Use `--compute-units <limit>` to override when transactions fail with CU exhaustion

## Token Status Awareness

| Status | Routing | Notes |
|---|---|---|
| On bonding curve | pump.fun or LaunchLab bonding curve | Price follows curve formula |
| Near graduation | Bonding curve | Watch for graduation — liquidity shift incoming |
| Graduated (AMM) | PumpSwap (pump.fun) or Raydium CPMM (LaunchLab) | Standard AMM pricing, deeper liquidity |
| LaunchLab coin waiting for its pool | None | "CPMM pool is not open yet": retry once it opens |

## Red Flags

- Token with very low liquidity on bonding curve — high slippage risk
- Token that just graduated — liquidity may be thin on AMM initially
- Selling `all` of a large position — may move price significantly
- Multiple rapid trades — each one pays transaction fees
- A coin priced in something other than SOL — `buy` spends that asset, not SOL; check `quote_symbol` first
- A coin with a transfer fee (`transfer_fee_bps` in `info`) — a round trip pays it twice, on top of trading fees
- A sell result with `tokens_kept` — the curve couldn't pay for all of them; those tokens are still in the wallet

## Password Handling

- Set `PUMPFUN_PASSWORD` env var to avoid repeated password prompts
- Never store password in plain text files or git-tracked configs
- Use the encrypted keystore (`--keyfile`) for wallet security
