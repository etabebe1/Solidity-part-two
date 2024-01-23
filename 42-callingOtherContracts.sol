// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Calling Other Contract || different contract
// There are two ways to do that
// 1. to call straight forward by the name
// 2. to call by the low level calls


contract Callee {
    uint public x; // State variable to store a number
    uint public value; // State variable to store Ether value received

    // Function to set 'x' and return the new value
    function setX(uint _x) public returns(uint) {
        x = _x; // Set the state variable 'x' to the value of '_x'
        return x; // Return the new value of 'x'
    }   

    // Payable function to set 'x' and record Ether sent
    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x; // Set the state variable 'x' to the value of '_x'
        value = msg.value; // Store the Ether value sent with the transaction

        return (x, value); // Return the new value of 'x' and the Ether value
    }
}


contract Caller {
    // Function to set 'x' in the Callee contract using a Callee instance
    function setX(Callee _callee, uint _x) public {
        uint xValue = _callee.setX(_x); // Call 'setX' on the Callee instance and store the returned value
    }

    // Function to set 'x' in the Callee contract using a contract address
    function setXFromAddress(address _addr, uint _x) public {
        Callee callee = Callee(_addr); // Instantiate Callee at address '_addr'
        callee.setX(_x); // Call 'setX' on the instantiated Callee
    }

    // Payable function to set 'x' and send Ether to the Callee contract
    function setXandSendEther(Callee _callee, uint _x) public payable {
        (uint x, uint value) = _callee.setXandSendEther{value: msg.value}(_x); // Call 'setXandSendEther' on Callee, sending Ether, and get returned values
    }
}
