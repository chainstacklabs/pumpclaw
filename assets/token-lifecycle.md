# Token Lifecycle: Bonding Curve → Graduation → AMM

## Phase 1: Launch (Bonding Curve)

```
pumpfun launch --name "MyToken" --ticker "MTK" --desc "..." [--buy 0.1]
```

- Token is created on pump.fun with a bonding curve
- Price starts low and increases as more SOL is deposited
- All buys/sells go through the bonding curve formula
- Creator can optionally buy initial supply with `--buy`

## Phase 2: Trading on Bonding Curve

```
pumpfun buy <mint> <sol>     # Buy from bonding curve
pumpfun sell <mint> <amount> # Sell to bonding curve
```

- Price is deterministic — follows the bonding curve formula
- As more SOL enters, price increases; as SOL exits, price decreases
- Check progress: `pumpfun info <mint>` shows bonding curve completion %
- Tokens appear in `pumpfun tokens graduating` as they approach completion

## Phase 3: Graduation Trigger

```
pumpfun migrate <mint> --confirm
```

- When bonding curve reaches 100%, the token is eligible for migration
- Migration moves liquidity from bonding curve to PumpSwap AMM
- This is a one-time, irreversible operation (24 accounts involved)
- Anyone can trigger migration — not just the creator

## Phase 4: PumpSwap AMM Trading

```
pumpfun buy <mint> <sol> --force-amm    # Buy from AMM
pumpfun sell <mint> <amount> --force-amm # Sell on AMM
```

- After graduation, trades route through PumpSwap AMM automatically
- `--force-amm` can be used explicitly but is usually unnecessary
- AMM provides deeper liquidity and standard constant-product pricing
- Creator fees accumulate in PumpSwap vaults

## Phase 5: Fee Collection

```
pumpfun collect-creator-fee --confirm  # Creator fees from both vaults
pumpfun claim-cashback --confirm       # Volume-based rewards
pumpfun close-volume-acc               # Recover rent from volume tracker
```

## Status Check at Any Phase

```
pumpfun info <mint>
```

Returns:
- Current price
- Bonding curve progress (if applicable)
- SOL and token reserves
- Whether token has graduated
- Which routing path buy/sell will use
