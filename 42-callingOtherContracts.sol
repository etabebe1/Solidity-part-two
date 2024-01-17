// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Calling Other Contract || different contract
// There are two ways to do that
// 1. to call straight forward by the name
// 2. to call by the low level calls

contract Callee {
    uint public x;
    uint public value;
    
    function setX(uint _x) public returns(uint) {
        x = _x;
        return x;
    }   

    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;

        return (x, value);
    }
}


contract Caller {
     function setX(Callee _callee, uint _x) public {
        uint x = _callee.setX(_x);
     }

//      function setXFromAddress(address _addr, uint _x) public {
//         c
//      }
}