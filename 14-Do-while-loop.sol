// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Do while loop

contract doWhileLoop {
    // state variables
    uint256[] data;
    uint256 initalValue;

    function DoWhileLoop(uint256 _number) public returns (uint256[] memory) {
        // do while algo
        do {
            _number++;
            data.push(_number);
        } 
        while (_number < 5);

        return data;
    }
}

// Conclusion still it's not recommended to use loop in smart contract
// This is due to high gas fee requirement