// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// super Keyword in Solidity:

//     Use:
//         The super keyword is used in Solidity to explicitly reference functions or 
//         state variables from a base contract when a contract is part of an inheritance hierarchy.

//     Why Use it:
//         It allows you to access and invoke functions or
//         variables from the immediate parent contract (base contract) within a derived contract.

//     When to Use it:
//         Use super when you want to access or override a function or 
//         state variable from a base contract in the context of a derived contract.

// Inheritance tree
//          A
//         / \
//        B   C
//         \ /
//          D

contract A {
    // This is called an event. You can emit events from your function
    // and they are loged into the transaction log.
    // In our case, this will be usefull to tracing function calls.
    event Log(string message);

    function funcInContract() public virtual {
        emit Log("A.funcInContract is called");
    } 

    function funcInContract2() public virtual {
        emit Log("A.funcInContract2 is called");
    }
}

contract B is A {
     function funcInContract() public virtual override {
        emit Log("B.funcInContract is called");
        A.funcInContract();
    } 

    function funcInContract2() public virtual override {
        emit Log("B.funcInContract2 is called");
        super.funcInContract2();
    }

}

contract C is A {
    function funcInContract() public virtual override {
        emit Log("C.funcInContract is called");
        A.funcInContract();
    } 

    function funcInContract2() public virtual override {
        emit Log("C.funcInContract2 is called");
        super.funcInContract2();
    }
}


contract D is B, C {
    // Try: 
    // - Call D.funcInContract and check the transactio logs.
    // Althogh D inherits A, B and C, it only called C and then A.
    // - Call D.funcInContract2 and check the reansactio logs.
    // D called C, then B, and finnaly A. 
    // Althogh super was called twice  (by B and C) it only called A once.

    function funcInContract() public override (B, C) {
        super.funcInContract();
    }

    function funcInContract2() public override (B, C) {
        super.funcInContract2();
    }
}