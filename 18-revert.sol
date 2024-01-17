// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Solidity Error Handling
// Revert Error Handler keyword -- used to handle errors in smart contract in solidity
// Least used error handler in smart contract
// Revert keyword takes only the message unlike require which takes
// both condition and message and Assert which takes only conditoin

contract RevertStatement {
    function checkOverFlow (uint256 _num1, uint256 _num2) public pure returns (string memory, uint256) {
        uint256 sum = _num1 + _num2;

        if(sum < 0 || sum > 255) {
            revert("OverFlow exists");
        } else {
            return ("No Overflow" ,sum);
        }
    } 
}