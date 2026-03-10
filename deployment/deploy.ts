// 1. Import the network object from Hardhat. It contains all the context about the blockchain we are connecting to.
import { network } from "hardhat";

async function main() {
  console.log("Starting deployment...");

  // 2. We connect to the active network (could be local Hardhat node, or a real testnet like BNB Chain).
  // The 'viem' plugin provides modern tools to interact with EVM blockchains.
  const connection = await network.connect();
  const { viem } = connection;

  // 3. Retrieve the list of local test accounts provided by Hardhat.
  // deployer represents the first account, which will pay the gas fee and become the contract 'owner'.
  const walletClients = await viem.getWalletClients();
  const deployer = walletClients[0];

  console.log(`Deploying token with account: ${deployer.account.address}`);

  // 4. The actual deployment!
  // We tell viem: "Take the compiled bytecode of 'Ebaillot42', send it to the blockchain, and wait for the receipt."
  // The empty array [] means our Solidity constructor doesn't take any extra dynamic arguments.
  const token = await viem.deployContract("Ebaillot42", []); 

  // 5. Once the transaction is mined, the blockchain assigns an address to our contract.
  console.log(`Token Ebaillot42 deployed successfully to address: ${token.address}`);
}

// 6. Standard Node.js pattern to execute the async main function and catch any fatal errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});