// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

    // virtual:
    //     Use: In the base contract to declare functions that are meant to be overridden in derived contracts.
    //     Indicates: That the function is designed to be overridden.

    // is:
    //     Use: In the derived contract to establish an inheritance relationship with a base contract.
    //     Indicates: Inheritance, meaning the derived contract inherits state variables 
    //                and functions from the base contract.

    // override:
    //     Use: In the derived contract to explicitly indicate the intention to 
    //          override a virtual function from the base contract.
    //     Indicates: That the function in the derived contract is intended to override a virtual function in the base contract.

//* Graph of inheritance 

//           A
//          / \
//         B   C
//        / \ /
//       F   D,E


contract A {
    function funcInContract() public pure virtual returns(string memory) {
        return "A";
    } 
}

// contract inherites other contract using "is" keyword
contract B is A {
    // Override A.funcInContract()
    function funcInContract() public pure virtual override returns(string memory) {
        return "B";
    } 
}

contract C is A {
    // Override A.funcInContract()
    function funcInContract() public pure virtual override returns(string memory) {
        return "C";
    } 
}

// NOTES:
// Contracts can inherite from multiple parents
// When function is called that is defined multiple times in 
// differnt contract, parent contracts are searched from 
// right to left and, in depth-first manner

contract D is B, C {
    // D.funcInContract() returns "C"
    // since C is the right most parent contract with function funcInContract()
    function funcInContract() public pure override(B,C) returns (string memory) {
        return super.funcInContract();
    } 
}

contract E is C, B {
    // E.funcInContract() returns "B"
    // since B is the right most parent contract with function funcInContract()
    function funcInContract() public pure override(B,C) returns (string memory) {
        return super.funcInContract();
    } 
}


// NOTE: Inheritance must be orederd from "most base-like" to "most derived"
//     : Swapping the order of A and B will throw compilation error
 
contract F is A, B {
    function funcInContract() public pure override(A,B) returns (string memory) {
        return super.funcInContract();
    }
}