// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

import {AirdropToken} from "../../src/AirdropToken.sol";

/// @title AirdropTokenUser
/// @notice Mock AirdropToken user
contract AirdropTokenUser {
    /// @dev AirdropToken contract
    AirdropToken internal immutable TOKEN;

    /// @notice Creates a new AirdropTokenUser
    /// @param _TOKEN AirdropToken contract
    constructor(AirdropToken _TOKEN) {
        TOKEN = _TOKEN;
    }

    /// @notice Returns users' token balance
    function tokenBalance() public view returns (uint256) {
        return TOKEN.balanceOf(address(this));
    }

    /// @notice Allows user to claim tokens from contract
    /// @param to address of claimee
    /// @param amount of tokens owed to claimee
    /// @param proof merkle proof to prove address and amount are in tree
    function claim(address to, uint256 amount, bytes32[] calldata proof) public {
        TOKEN.claim(to, amount, proof);
    }
}
