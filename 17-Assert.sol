// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


// Solidity Error Handling
// Assert Error Handler keyword -- used to handle errors in smart contract in solidity

contract Assert {
    bool public result;

    function checkValue (uint256 _num1, uint256 _num2) public returns (bool) {
        uint256 sum = _num1 + _num2;
        assert(sum <= 200);
        result = true;
        return result;
    }

    function getResult () public view returns (string memory) {
        if(result == true) {
            return "No overflow exist";
        } else {
            return "Overflow exists";
        }
    }

}

// The difference bettween ((assert and require)) keyword is
// assert keyword takes only condition uinlike require keyword
// means that the require keyword does take condition and message to be displayed  