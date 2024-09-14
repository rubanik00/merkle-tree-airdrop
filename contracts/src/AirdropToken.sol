// SPDX-License-Identifier: GNU Lesser General Public License v3.0
pragma solidity 0.8.27;

import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";


contract AirdropToken is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
    bytes32 public immutable merkleRoot;
    mapping(address => bool) public hasClaimed;

    /// @dev Check if caller is minter
    modifier onlyMinter() {
        require(hasRole(MINTER_ROLE, msg.sender), "Caller is not a minter");
        _;
    }

    /// @notice Thrown if address has already claimed
    error AlreadyClaimed();
    /// @notice Thrown if address/amount are not part of Merkle tree
    error NotInMerkle();

    /// @notice Emitted after a successful token claim
    /// @param to recipient of claim
    /// @param amount of tokens claimed
    event Claim(address indexed to, uint256 amount);

    constructor(bytes32 _root) ERC20("Airdrop Token", "ATKN") {
        merkleRoot = _root;
    }

    /**
     * @dev Function to mint tokens by only minter role.
     * @param to The address that will receive the minted tokens
     * @param value The amount of tokens to mint
     */
    function mint(address to, uint256 value) public onlyMinter {
        _mint(to, value);
    }

    /**
     * @dev Function to claim tokens by providing merkle proof.
     * @param to The address that will receive the minted tokens
     * @param amount The amount of tokens to mint
     * @param proof The merkle proof to verify the claim
     */
    function claim(address to, uint256 amount, bytes32[] calldata proof) external {
        // Throw if address has already claimed tokens
        if (hasClaimed[to]) revert AlreadyClaimed();

        // Verify merkle proof, or revert if not in tree or wrong proof
        bytes32 leaf = keccak256(bytes.concat(keccak256(abi.encode(to, amount))));
        bool isValidLeaf = MerkleProof.verify(proof, merkleRoot, leaf);
        if (!isValidLeaf) revert NotInMerkle();

        // Set address to claimed
        hasClaimed[to] = true;

        // Mint tokens to address
        _mint(to, amount);

        // Emit claim event
        emit Claim(to, amount);
    }
}
