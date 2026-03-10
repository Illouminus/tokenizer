// SPDX-License-Identifier: MIT
// 1. Indicates the compiler version to be used. The caret (^) means "compatible with 0.8.28".
pragma solidity ^0.8.28;

// 2. Importing audited standard contracts from the OpenZeppelin library.
// ERC20: The base standard implementation for fungible tokens (contains name, symbol, transfer, etc.)
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// ERC20Burnable: Extension allowing token holders to destroy their tokens (reducing total supply).
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
// Pausable: A security mechanism to halt token transfers in case of emergency.
import "@openzeppelin/contracts/utils/Pausable.sol";
// Ownable: Access control module, providing a basic authorization mechanism (owner).
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Ebaillot42
 * @dev Implementation of the 42 School Tokenizer project.
 */
// 3. Our contract inherits from the imported OpenZeppelin contracts.
contract Ebaillot42 is ERC20, ERC20Burnable, Pausable, Ownable {
    
    /**
     * @dev Constructor is executed only once during contract deployment.
     * It sets the token name, symbol, and mints the initial supply.
     */
    // 4. We initialize the parent contracts. ERC20 gets the name/symbol, Ownable gets the deployer address.
    constructor() ERC20("Ebaillot 42", "EB42") Ownable(msg.sender) {
        // 5. Minting exactly 42,000,000 tokens to the deployer's address. 
        // 10 ** decimals() adjusts the value for 18 decimal places (standard for ERC20/BEP20).
        _mint(msg.sender, 42000000 * 10 ** decimals());
    }

    /**
     * @dev Triggers the paused state. Only the contract owner can call this.
     */
    // 6. Security feature: owner can pause the contract.
    function pause() public onlyOwner {
        _pause();
    }

    /**
     * @dev Returns the contract to normal state. Only the contract owner can call this.
     */
    // 7. Security feature: owner can unpause the contract.
    function unpause() public onlyOwner {
        _unpause();
    }

    /**
     * @dev Internal hook triggered before any token transfer (including minting and burning).
     * Overridden to enforce the 'whenNotPaused' modifier.
     */
    // 8. Overriding the internal _update function (called during any transfer).
    // The 'whenNotPaused' modifier ensures this function throws an error if the contract is paused.
    function _update(address from, address to, uint256 value)
        internal
        override
        whenNotPaused
    {
        // Calls the original _update function from the parent contract (ERC20)
        super._update(from, to, value);
    }
}