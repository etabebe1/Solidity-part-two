// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// for while loop

contract forWhileLoop {
    // state variable
    uint256[] data;

    function forLoopFunction()public returns(uint256[] memory) {
        for(uint256 _number = 3; _number < 5; _number++) {
            data.push(_number);
        }

        return data;
    }

}