// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


// Modifier -- function modifier

// NOTES: Modifiers are
//--- codes that could run before or after a function call
//--- used for 3 reasons
//--- Such as - Ristrict access, Validate inputs, Guard against re-entrancey hack 

contract FunctionMidifier {
    // state variables

    address public owner;
    uint256 public x = 10;
    bool public locked; 

    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner () {
        require(msg.sender == owner, "Not owner");
        _;
    }

    modifier validateData (address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }
    
    function changeOwner(address _newOwner) public onlyOwner validateData(_newOwner) {
        owner = _newOwner;
    }

    modifier noReentrancy() {
        require(!locked, "No reentranct");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 _num) public noReentrancy {
        x-= 1;

        if(_num > 1) {
            decrement(_num -1);
        }
    }
}
