# Token Lifecycle: Bonding Curve → Graduation → AMM

## Phase 1: Launch (Bonding Curve)

```
pumpfun launch --name "MyToken" --ticker "MTK" --desc "..." [--buy 0.1] [--quote-mint <mint>]
```

- Token is created on pump.fun with a bonding curve, priced in SOL unless `--quote-mint` names another asset
- Price starts low and increases as more of the quote asset is deposited
- All buys/sells go through the bonding curve formula
- Creator can optionally buy initial supply with `--buy`, in the same transaction as the create

## Phase 2: Trading on Bonding Curve

```
pumpfun buy <mint> <amount>  # Buy from bonding curve, amount in the quote asset
pumpfun sell <mint> <amount> # Sell to bonding curve
```

- Price is deterministic — follows the bonding curve formula
- As the quote asset enters, price increases; as it exits, price decreases
- Check progress: `pumpfun info <mint>` shows bonding curve completion %
- Tokens appear in `pumpfun tokens graduating` as they approach completion

## Phase 3: Graduation Trigger

```
pumpfun migrate <mint> --confirm
```

- When bonding curve reaches 100%, the token is eligible for migration
- Migration moves liquidity from bonding curve to a PumpSwap pool in the same quote asset
- This is a one-time, irreversible operation
- Anyone can trigger migration — not just the creator

## Phase 4: PumpSwap AMM Trading

```
pumpfun buy <mint> <amount> --force-amm # Buy from AMM
pumpfun sell <mint> <amount> --force-amm # Sell on AMM
```

- After graduation, trades route through PumpSwap AMM automatically
- `--force-amm` can be used explicitly but is usually unnecessary
- AMM provides deeper liquidity and standard constant-product pricing
- Creator fees accumulate in PumpSwap vaults

## Phase 5: Fee Collection

```
pumpfun collect-creator-fee --confirm  # Creator fees from both vaults (add --quote-mint for non-SOL coins)
pumpfun claim-cashback --confirm       # Volume-based rewards
pumpfun close-volume-acc               # Recover rent from volume tracker
```

## Status Check at Any Phase

```
pumpfun info <mint>
```

Returns:
- Current price, in the quote asset
- Bonding curve progress (if applicable)
- Quote and token reserves
- Whether token has graduated
- Which routing path buy/sell will use
