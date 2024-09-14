// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol"; // DSTest
import {AirdropToken} from "../../src/AirdropToken.sol"; // AirdropToken contract
import {AirdropTokenUser} from "./AirdropTokenUser.sol"; // AirdropToken user

/// @title AirdropTokenTest
/// @notice Scaffolding for AirdropToken tests
contract AirdropTokenTest is DSTest {
    /// @dev AirdropToken contract
    AirdropToken internal TOKEN;
    /// @dev User: Alice (in merkle tree)
    AirdropTokenUser internal ALICE;
    /// @dev User: Bob (not in merkle tree)
    AirdropTokenUser internal BOB;

    function setUp() public virtual {
        // Create airdrop token
        TOKEN = new AirdropToken(
            // Merkle root containing ALICE with 100e18 tokens but no BOB
            0xb75b97152d464c0fcf2b97add2814aa07d7f38f863be7268140d5369f8144bc8
        );

        // Setup airdrop users
        ALICE = new AirdropTokenUser(TOKEN); // 0x2e234DAe75C793f67A35089C9d99245E1C58470b
        BOB = new AirdropTokenUser(TOKEN); // 0xF62849F9A0B5Bf2913b396098F7c7019b51A820a
    }
}
