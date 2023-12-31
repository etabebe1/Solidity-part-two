// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Solidity Error Handling
// Require Error Handler keyword -- used to handle errors in smart contract in solidity

contract Require {
    function checkInput(uint256 _input) public pure returns(string memory) {
        require(_input >= 0, "invalid uint8");
        require(_input <= 255, "invalid uint8");

        return "Input is uint8";
    }  

    function Odd (uint256 _number) public pure returns (bool) {
        require(_number % 2 != 0);
        return true;
    }
}
