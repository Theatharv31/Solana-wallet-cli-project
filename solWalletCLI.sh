#!/bin/bash

# Install Solana CLI
sh -c "$(curl -sSfL https://release.solana.com/v1.14.15/install)"

# Add Solana CLI to PATH
export PATH="/root/.local/share/solana/install/active_release/bin:$PATH"

# Set Solana CLI to use testnet
solana config set --url testnet

# Airdrop SOL to default wallet
solana airdrop 1 --keypair ~/.config/solana/my-wallet.json

# Check default wallet balance
solana balance

# Generate recipient wallet
solana-keygen new --outfile ~/.config/solana/recipient-wallet.json

# Check generated wallet details
solana account ~/.config/solana/recipient-wallet.json

# Set default keypair
solana config set --keypair ~/.config/solana/my-wallet.json

# Transfer SOL to recipient
solana transfer <RECIPIENT_PUBLIC_KEY> 0.1 --from ~/.config/solana/my-wallet.json

# Confirm transaction
solana confirm <TRANSACTION_SIGNATURE>

# Check balances
solana balance
solana balance <RECIPIENT_PUBLIC_KEY>