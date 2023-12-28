// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// IF-Else - statment 

contract if_Else {
    // state variables
    uint256 public myNum = 5;
    string public myString;

    function ifElse(uint256 _num) public returns (string memory) {
        if(_num == 5) {
            myString = "Number is 5";
        } else {
            myString = "Number is not 5";
        }

        return myString;
    }

    function ternaryOperators(uint256 _num) public returns (string memory) {
        _num == 5 ? myString = "I'm number 5" : myString = "I'm not number 5";

        return myString;  
    }

}