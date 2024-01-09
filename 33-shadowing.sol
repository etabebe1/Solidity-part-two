// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Shadowing in Solidity:

//     What is it?
//         Shadowing occurs when a variable or state variable in a derived contract has
//         the same name as a variable in its base contract,
//         effectively "hiding" the base contract's variable.
//         Note: "derived contract" refers to a contract that inherits from another contract.

//     When does it happen?
//         It happens when you declare a variable in a derived contract with the same name
//         as a variable in its base contract.

//     Why use it?
//         It allows you to have a variable with the same name in both the base and
//         derived contracts, providing local context in the derived contract without
//         affecting the base contract.

contract A {
    string public name = "Contract A";

    function getName() public view returns (string memory) {
        return name;
    } 
}

// SOME HIGHLIGHTS HERE:
// Shadowing is disallowed in solidity version <= 0.6
// means that the following doesn't work

// contract B is A {
//     string publi name = "Contract B"
// }

contract C is A {
    // This is the correct way to override inherated state variable
    constructor () {
        name = "Contract C";
    }
    // Now,
    // C.getName return "Contract C"
}


