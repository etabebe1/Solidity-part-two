// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract DataLocation {
    uint[] public array;  // Public state variable, stored in storage
    mapping (uint => address) map;  // Mapping, key is uint, value is address, stored in storage
    struct   MyStruct {  // Definition of a struct named MyStruct
        uint number;  // Struct has one field named 'number'
    }

    mapping (uint => MyStruct) myStructs;  // Mapping, key is uint, value is MyStruct, stored in storage

    function f() public {
        _f(array, map, myStructs[1]);  // Call internal function _f with storage variables

        MyStruct storage myStruct = myStructs[1];  // Reference to a storage struct variable

        MyStruct memory myMemoryStruct = MyStruct(0);  // Memory struct variable initialization
    }

    function _f(
        uint[] storage _array,  // Storage array parameter
        mapping(uint => address) storage _map,  // Storage mapping parameter
        MyStruct storage _myStruct   // Storage struct parameter
    ) internal {
        // Do something with storage variables
    }

    // You can return new variables
    function g(uint[] memory _array) public returns (uint[] memory) {
        // Do something with the array in memory and return a new memory array
    }

    function h(uint[] calldata _array) external {
        // Do something with the calldata array (external function)
    }
}
