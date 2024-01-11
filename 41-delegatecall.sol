// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// DelegateCall --- 

// Key points about delegated call:

//     Context Preservation:
//         Delegated call preserves the state and storage context of the calling contract.
//         It operates on the storage and state of the calling contract rather 
//         than the contract being called.

//     Code Reusability:
//         It enables code sharing and reusability, allowing a contract to dynamically load and 
//         execute logic from another contract.
//         This can be useful for modular design and upgradability.

//     Risk of State Changes:
//         While powerful, delegated call comes with risks.
//         Care must be taken to ensure that the called contract 
//         does not unintentionally modify the state of the calling contract.
//         Proper validation and security considerations are crucial.

//     Gas and Execution:
//         Gas consumption and execution cost are attributed to the calling contract. 
//         This is different from a regular external call,
//         where gas is consumed by the called contract.

//     Common Use Cases:
//         Delegated call is often used in proxy contract patterns,
//         where a proxy contract delegates calls to an implementation contract. 
//         This allows for contract upgrades without changing the proxy contract.

//     Security Considerations:
//         Developers need to be cautious when using delegated call to
//         prevent unintended state changes and potential security vulnerabilities. 
//         It's essential to thoroughly test and audit code that involves delegated call.

// Note: Deploy the following contract first

contract B {
    // NOTE: storage layout must be the same as contract A

    uint public num;
    address public sender;
    uint public value;

    function setValue(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}


contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        // A's storage is set, B is not modified.
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}