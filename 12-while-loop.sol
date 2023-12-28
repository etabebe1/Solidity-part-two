// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// While-Loop in solidit

contract myWhileLoop {
    uint256[] data;
    // uint i = 0;

    function WhileLoop(uint256 _num) public returns (uint256[] memory) {
        while (_num < 10) {
            _num++;
            data.push(_num);
        }

        return data;

    }
}

// NOTE: adding a loop in to a contract might exhaust a gas amount
// Therefore, it's recommended to avoid a loop in the contract