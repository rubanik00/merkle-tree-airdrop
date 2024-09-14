# MerkleClaimERC20

ERC20 token claimable by members of a [Merkle tree](https://en.wikipedia.org/wiki/Merkle_tree)

## Test

Tests use [Foundry: Forge](https://github.com/gakonst/foundry).

Install Foundry using the installation steps in the README of the linked repo.

### Run tests

```bash
# Go to contracts directory, if not already there
cd contracts/

# Get dependencies
forge update

# Run tests
forge test -vv
```

## Deploy

Follow the `forge create` instructions ([CLI README](https://github.com/gakonst/foundry/blob/master/cli/README.md#build)) to deploy your contracts or use [Remix](https://remix.ethereum.org/).

You can specify the airdrop `merkleRoot` upon deploy.
