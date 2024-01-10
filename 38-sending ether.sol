// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


contract ReceiveEther {
    // Hierarchy
    // Question: Which function is called, fallback() or receive()
    // Note: we have two functions to receive funds in solidity smart contract
    //                    
    //              Send Ether
    //                  |
    //           msg.data is empty? 
    //               /     \
    //             yes     no
    //             /         \
    //        receive()    fallback()
    //          
    
    // receive() function to receive Ether. msg.data is empty in this case
    receive() external payable { }

    // fallback() function to receive Ether. But here msg.data is not empty in this case
    fallback() external payable { }

    // function to get the balance of ReceiveEther contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
} 


contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        // This function is no longer recommended for sendig ether
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable  {
        // Send returns a boolean value indicating success or failure
        // This function is not recommended for sending Ether
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicatind success or failure
        // This is the current recommended method to use.

        // (bool sent, bytes memory data) = _to.call{value: msg.value}("");

        (bool sent,) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}