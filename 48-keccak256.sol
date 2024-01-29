// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Keccak256 computes the Keccak-256 hash of the input.

// Some use cases are:

//     Creating a deterministic unique ID from a input
//     Commit-Reveal scheme
//     Compact cryptographic signature (by signing the hash instead of a larger input)


// In the code bellow, the HashFunction contract provides 
// a basic example of how to use the keccak256 hash function with 
// abi.encodePacked and also demonstrates the possibility of hash collisions 
// when using this method with dynamic data types. 
// The GuessTheMagicWord contract sets up a simple guessing game where 
// the goal is to guess the word that produces a specific hash.


contract HashFunction {
    function hash(
        string memory _text,
        uint _num,
        address _addr
    ) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_text, _num, _addr));
    }

    // Example of hash collision
    // Hash collision can occur when you pass more than one dynamic data type
    // to abi.encodePacked. In such case, you should use abi.encode instead.
    function collision(
        string memory _text,
        string memory _anotherText
    ) public pure returns (bytes32) {
        // encodePacked(AAA, BBB) -> AAABBB
        // encodePacked(AA, ABBB) -> AAABBB
        return keccak256(abi.encodePacked(_text, _anotherText));
    }
}

contract GuessTheMagicWord {
    bytes32 public answer =
        0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

    // Magic word is "Solidity"
    function guess(string memory _word) public view returns (bool) {
        return keccak256(abi.encodePacked(_word)) == answer;
    }
}
