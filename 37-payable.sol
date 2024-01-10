// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Payable {
    // Payable address can recieve Ether
    address payable public owner;

    // Payable constructor can receive Ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    // Function to deposit Ether into this contract
    // Call this functio along with some Ether
    // The balance of this contract will be updated automatically.
    function deposit() public payable {

    }

    // Call this functio along with some Ether
    // The function will throw an error since this function is not payable
    function notPayable() public {

    }

    // Function to withdraw all Ether from this contract
    function withdarw() public {
        // get the amount of Ether stored in this contract
        uint amount = address(this).balance;

        // send all Ether to owner
        // Owner can receive Ether since the addres of the owner is payable
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    // Function to transfer Ether from this contract to address from input
    function transfer(address payable _to, uint _amount) public {
        // Note that "to" is decalred as payable
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether"); 
    }

} 