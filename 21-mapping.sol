// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Mapping - is used to create key-value pairs, allowing efficient storage and retrieval of data.

contract Mapping {
    // Mapping from address to uint
    mapping(address => uint) public myMap;

    // Function that sets uint parameter as value and address parameter as key in to myMap as backet 
    function set(address _addr, uint _number) public {
        // Update the value at this address
        myMap[_addr] = _number; 
    }

    // Function that gets uint value based on the key address provided in the set function above
    function get(address _addr) public view returns (uint) {
        // Mapping always returns a value.
        // If the value was never set, it will return the default value.
        return myMap[_addr]; 
    }

    // Function that deletes/removes uint value based on the key address provided in the set function again
    // But address value has to be similar since it's key parameter
    function remove(address _addr) public {
        // Reset the value to the default value
        delete myMap[_addr];
    }
}

contract NestedMapping {
    // Nested mapping (mapping from address to another mapping)
    mapping(address => mapping(uint => bool)) public myNestedMap;

    // Function that sets bool parameter as value by taking uint parameter and address parameter as key in to myNestedMap as backet
    function set (address _addr, uint _number, bool _bool) public {
        myNestedMap[_addr][_number] = _bool;
    }

    function get (address _addr, uint _number) public view returns (bool) {
        // NOTE: here we can get value form a nested mapping
        // This would be even if it is not initialized
        return myNestedMap[_addr][_number];
    }

    function remove (address _addr, uint _number) public {
        delete myNestedMap[_addr][_number];
    }
}

