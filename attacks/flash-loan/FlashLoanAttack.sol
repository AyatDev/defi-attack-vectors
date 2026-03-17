// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Demonstrates a flash loan price manipulation attack
interface ILendingPool {
    function flashLoan(address receiver, address asset, uint256 amount, bytes calldata params) external;
}

interface IDEX {
    function getPrice(address token) external view returns (uint256);
    function swap(address tokenIn, address tokenOut, uint256 amount) external;
}

// EDUCATIONAL PURPOSE ONLY
contract FlashLoanAttackDemo {
    ILendingPool public lendingPool;
    IDEX public dex;

    constructor(address _lendingPool, address _dex) {
        lendingPool = ILendingPool(_lendingPool);
        dex = IDEX(_dex);
    }

    // Step 1: Borrow large amount
    // Step 2: Manipulate price on DEX
    // Step 3: Exploit protocol using manipulated price
    // Step 4: Repay flash loan + fee
    function executeAttack(address asset, uint256 amount) external {
        lendingPool.flashLoan(address(this), asset, amount, "");
    }
}

// MITIGATION: Use TWAP oracles instead of spot price
