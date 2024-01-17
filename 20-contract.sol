// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Base or parent contract X
contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

// Base or parent contract Y
contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// NB.
// There are 2 ways to initalize parent contract with parameter.

// 1. Pass the parameter here in the inheritanct list.
contract B is X("Input value to contract X"), Y("Input value to contract Y") {

}

// 2. Pass the parameter into the constructor.
contract C is X,Y {
    // Here parameter is passed to the constructor
    // Similar to the function modifier
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {

    }
}

// NOTE: Order in constructor container contract matters, means that 
// Parent constructors are always called in the order of inheritance
// It's regardless of the order of parent contracts listed in the constructor of the child contrat.

// Such order of constructor called: 
// 1. X
// 2. Y
// 3. D
contract D is X,Y {
    constructor() X("X contract is called") Y("Y contract is called") {}
}

// Order of constructor called:
// 1. X
// 2. Y
// 3. E
contract E is X,Y {
    constructor() Y("Y base contract is called") X("X base contract is called") {} 
} 


