# Tokenizer - School 42 Project

## Overview
This project involves the creation, deployment, and verification of a custom BEP-20 smart contract. The token is deployed on the **BNB Smart Chain Testnet** and includes standard security features such as burning mechanisms and pausing capabilities.

## Smart Contract Details
- **Token Name:** Ebaillot42
- **Token Symbol:** EB42
- **Decimals:** 18
- **Initial Supply:** 42,000,000 EB42
- **Network:** BNB Smart Chain Testnet (Chain ID: 97)
- **Contract Address:** `0x076abcc0d679529d24f08b65a26f5d4bca8c904d`
- **Verified Explorer Link:** [BscScan Contract Page](https://testnet.bscscan.com/address/0x076abcc0d679529d24f08b65a26f5d4bca8c904d#writeContract)

## Choices & Reasoning
As requested by the subject, here are the technical choices made for this project and the reasons behind them:

1. **Network (BNB Smart Chain Testnet):** * *Reason:* BNB Chain offers high speed and low transaction fees. The testnet was chosen to ensure safe deployment and testing without spending real money, strictly following the project guidelines.
2. **Framework (Hardhat v3):** * *Reason:* Hardhat is the current industry standard for EVM development. It provides excellent debugging tools, native TypeScript support, and built-in plugins for contract verification (`hardhat-verify`).
3. **Libraries (OpenZeppelin):**
   * *Reason:* Writing cryptographic security features from scratch is prone to errors. OpenZeppelin provides community-audited, battle-tested standard implementations for ERC20/BEP20, Ownable, Pausable, and Burnable features, ensuring the highest level of security.
4. **Token Name (Ebaillot42):**
   * *Reason:* Meets the mandatory project constraint of including "42" in the token name.

## Features Implemented
- **BEP-20 Standard:** Fully compliant with the standard token interface.
- **Ownable & Pausable:** The contract creator (owner) can freeze all token transfers in case of an emergency (`pause` and `unpause`), protecting users from vulnerabilities.
- **Burnable:** Token holders can permanently destroy a portion of their tokens (`burn`), decreasing the total circulating supply.

## Repository Structure
- `/code`: Contains the `Ebaillot42.sol` smart contract source code.
- `/deployment`: Contains the Hardhat deployment scripts and configuration files.
- `/documentation`: Contains additional information about the token's purpose.
- `README.md`: This file, explaining the project setup and technical choices.

## How to interact with the Token
Since the contract is fully verified, you can interact with it directly through the block explorer:
1. Go to the [BscScan Contract Page](https://testnet.bscscan.com/address/0x076abcc0d679529d24f08b65a26f5d4bca8c904d#writeContract).
2. Click on **Connect to Web3** and connect your MetaMask wallet (ensure you are on the BNB Smart Chain Testnet).
3. Use the `Write Contract` tab to execute features like `transfer`, `burn`, and `pause`.