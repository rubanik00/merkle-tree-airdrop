# Generator

A merkle root for use in a AirdropToken contract

## Run locally

### First way (without OpenZeppelin library)

```bash
# Navigate to generator directory, if not already there
cd generator/

# Install dependencies
yarn

# Edit config.json
vim config.json

# Run script
yarn generate
```

Outputs a `merkle.json`, in the following format:

```json
{
  "root": "0x6a0b89fc219e9e72ad683e00d9c152532ec8e5c559600e04160d310936400a00",
  "tree": {
    "duplicateOdd": false,
    "hashLeaves": false,
    "isBitcoinTree": false,
    "leaves": [
      ...
    ],
    "layers": [
      [...],
      [...]
    ],
    "sortLeaves": false,
    "sortPairs": true,
    "sort": false,
    "fillDefaultHash": null
  }
}
```

### Second way (with OpenZeppelin library)

```bash
# Navigate to generator directory, if not already there
cd generator/

# Install dependencies
yarn

# Run script
yarn generate-oz
```

Outputs a `tree.json`, in the following format:

```json
{
  "format": "standard-v1",
  "leafEncoding": ["address", "uint256"],
  "tree": [
    "0xb75b97152d464c0fcf2b97add2814aa07d7f38f863be7268140d5369f8144bc8",
    "0x8c83934830c0e36e3a81b817f73aa8251333af8cd9955e6f274d838d8d67d12a",
    "0x6c877f3788a93cc7b599ceff4ae6285c7a4967eafcaa0e7b55f1f05d9de0b8ed"
  ],
  "values": [
    {
      "value": [
        "0x016C8780e5ccB32E5CAA342a926794cE64d9C364",
        "10000000000000000000"
      ],
      "treeIndex": 2
    },
    {
      "value": [
        "0x2e234DAe75C793f67A35089C9d99245E1C58470b",
        "100000000000000000000"
      ],
      "treeIndex": 1
    }
  ]
}
```

Output console logs:

```bash
Merkle Root: 0xb75b97152d464c0fcf2b97add2814aa07d7f38f863be7268140d5369f8144bc8
Value: [
  '0x2e234DAe75C793f67A35089C9d99245E1C58470b',
  '100000000000000000000'
]
Proof: [
  '0x6c877f3788a93cc7b599ceff4ae6285c7a4967eafcaa0e7b55f1f05d9de0b8ed'
]
```
