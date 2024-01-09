// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Function {
    // Function returning multiple values using tuple
    // A tuple is an ordered and immutable sequence of elements in programming.
    function returnMany() public pure returns (uint, bool, uint) {
        return (1, true, 2);
    }

    // Named function returns with named variables
    function named() public pure returns (uint x, bool b, uint y) {
        return (1, true, 2);
    }

    // Assigned function returns with assigned variables
    function assigned() public pure returns(uint x, bool b, uint y) {
        x = 1;
        b = true;
        y = 2;
    }

    // Destructuring assignments in function returns
    function destructuringAssignments() public pure returns (uint, bool, uint, uint, uint) {
        (uint i, bool b, uint j) = returnMany();

        (uint x, uint y) = (2, 4);

        return (i, b, j, x, y);
    }

    // Note: Arrays can be used as function input or output
    function arrayInput(uint[] memory _arr) public {
        // Function logic using array input
    }

    uint[] public arr;

    // Function with array output
    function arrayOutput() public view returns (uint[] memory) {
        return arr;
    }
}

// Call function with key-value inputs
contract XYZContract {
    // Function with multiple parameter inputs but returns only one value
    function someFuncWithManyInput(
        uint x, uint y, uint z, address a, bool b, string memory c
    ) public pure returns (uint) {
        // Logic based on the input parameters
        // Returns a single uint value
    }

    // Function calling another function with multiple parameter inputs
    function callFunc() external pure returns (uint) {
        return someFuncWithManyInput(1, 2, 3, address(0), true, "c");
    }

    // Function calling another function with named parameter inputs
    function callFuncWithKeyValue() external pure returns (uint) {
        return someFuncWithManyInput({a: address(0), b: true, c: "c", x: 1, y: 2, z: 3});
    }
}
