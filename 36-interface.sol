// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// This code contains contracts and interfaces for a simple counter
// and for interacting with Uniswap V2, demonstrating basic contract interactions, interface usage, 
// and integration with external DeFi protocols.

// NOTE: We can interact with other contracts by declaring an Interface.

// Interface

//     cannot have any functions implemented
//     can inherit from other interfaces
//     all declared functions must be external
//     cannot declare a constructor
//     cannot declare state variables


// A simple contract that maintains a counter.
contract Counter {
    uint public count;  // Public state variable to store the count.

    // Function to increment the count by 1.
    function increment() external {
        count += 1;
    }
}

// Interface for the Counter contract.
interface ICounter {
    function count() external view returns (uint); // Function to get the current count.

    function increment() external; // Function to increment the count.
}

// Contract that interacts with the Counter contract.
contract MyContract {
    // Function to increment the count of a Counter contract.
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    // Function to get the count from a Counter contract.
    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).count();
    }
}

// Uniswap V2 Factory interface.
interface UniswapV2Factory {
    // Function to get the address of a pair for two tokens.
    function getPair(
        address tokenA,
        address tokenB
    ) external view returns (address pair);
}

// Uniswap V2 Pair interface.
interface UniswapV2Pair {
    // Function to get reserves of the pair and the last block timestamp.
    function getReserves()
        external
        view
        returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

// Contract to interact with Uniswap V2.
contract UniswapExample {
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f; // Address of Uniswap V2 Factory.
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F; // DAI token address.
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // WETH token address.

    // Function to get the reserves of the DAI/WETH pair from Uniswap.
    function getTokenReserves() external view returns (uint, uint) {
        // Get the address of the DAI/WETH pair.
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        // Get the reserves of the pair.
        (uint reserve0, uint reserve1, ) = UniswapV2Pair(pair).getReserves();
        return (reserve0, reserve1); // Return the reserves.
    }
}
