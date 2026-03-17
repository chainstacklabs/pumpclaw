#!/usr/bin/env bash
# Check that pumpfun-cli prerequisites are met before trading.
set -euo pipefail

errors=0

# Check pumpfun CLI is available
if ! command -v pumpfun &>/dev/null && ! uv run pumpfun --version &>/dev/null 2>&1; then
    echo "ERROR: pumpfun CLI not found. Install via: uv tool install git+https://github.com/chainstacklabs/pumpfun-cli.git"
    errors=$((errors + 1))
else
    echo "OK: pumpfun CLI available"
fi

# Check RPC endpoint
if [ -z "${PUMPFUN_RPC:-}" ]; then
    echo "WARNING: PUMPFUN_RPC not set. You'll need --rpc flag or config set rpc <url>"
else
    echo "OK: PUMPFUN_RPC is set"
fi

# Check wallet
if pumpfun wallet show &>/dev/null 2>&1 || uv run pumpfun wallet show &>/dev/null 2>&1; then
    echo "OK: Wallet keystore found"
else
    echo "WARNING: No wallet found. Create one: pumpfun wallet create"
fi

# Check password
if [ -z "${PUMPFUN_PASSWORD:-}" ]; then
    echo "INFO: PUMPFUN_PASSWORD not set — you'll be prompted for each trade"
else
    echo "OK: PUMPFUN_PASSWORD is set"
fi

if [ "$errors" -gt 0 ]; then
    echo ""
    echo "FAILED: $errors critical error(s) found"
    exit 1
else
    echo ""
    echo "All prerequisites met. Ready to trade."
fi
