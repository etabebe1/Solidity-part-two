// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Interface in Solidity:

//     Definition:
//         An interface in Solidity is a way to declare the expected structure of a contract
//         without implementing the actual functionality.
//         It defines a set of functions without providing their implementation.
//         In short, it's way of interaction with other contracts

//     How it Works:
//         Contracts that implement an interface must adhere to the specified
//         function signatures defined in the interface. 
//         The implementation details are left to the implementing contract.

//     Why Use it:
//         Interfaces facilitate interoperability between contracts by 
//         ensuring that contracts conform to a common set of functions.
//         They enable contracts to interact seamlessly without specifying 
//         the complete implementation.

//     When to Use it:
//         Use interfaces when you want to establish a standard 
//         or common interface that multiple contracts can adhere to. 
//         This is especially useful in scenarios where contracts need to
//         interact with each other but don't need to share the full implementation details.


// Properties of Interfaces in Solidity:

//     Declaration Only:
//         Interfaces declare the function signatures 
//         without providing any implementation details. 
//         They act as a contract blueprint.

//     No State Variables:
//         Interfaces do not contain state variables. 
//         They focus solely on defining the expected behavior through function declarations.

//     No Function Bodies:
//         Functions declared in interfaces have no implementation
//         (no function bodies). Implementing contracts provide the actual code for these functions.

//     Implicitly External:
//         Functions in interfaces are implicitly external. 
//         They are intended to be called from external contracts, 
//         and there's no need to specify the external keyword.

//     No Constructors:
//         Interfaces cannot have constructors. 
//         They are purely for defining function signatures.

//     No Inheritance or Implementation:
//         Interfaces do not provide any implementation or 
//         inherit from other contracts. 
//         They are stand-alone structures defining a set of functions.

//     Implicit Virtual Functions:
//         All functions in interfaces are implicitly virtual. 
//         Implementing contracts can choose to override these functions, 
//         providing their own implementation.

//     Limited to Public Functions:
//         Interface functions are implicitly public. 
//         They are designed to be accessed externally, and 
//         specifying visibility is not required.

//     Cannot Be Deployed:
//         Interfaces cannot be deployed as contracts on the blockchain. 
//         They exist solely to define a set of functions that other contracts can adhere to.

//     Promotes Standardization:
//         The primary purpose of interfaces is to promote standardization across contracts,
//         enabling them to communicate seamlessly without requiring 
//         a full implementation of each other's functionality.

contract Counter {
    uint public count;

    function increment() external {
        count += 1;
    }
}

interface ICounter {
    function count() external view returns (uint);
    function increment() external; 
}

contract myContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint) {
        return ICounter(_counter).count();
    }
}

// Uniswap example 
interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB) external view returns (address pair);
}

interface UniswapV2Pair {
    function getReserves() 
        external
        view
        returns (
            uint112 reserve0, 
            uint112 reserve1, 
            uint32 blockTimestampLast
            );
}

contract UniswapExample {
    address private factory = 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB;
    address private dai = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address private weth = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;

    function getTokenReserves() external view returns (uint, uint) {
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        (uint reserve0, uint reserve1, ) = UniswapV2Pair(pair).getReserves();
        return (reserve0, reserve1);
    }
}