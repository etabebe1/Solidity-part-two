// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Array
// In Solidity, arrays can be categorized into two main types based on their size:

    // Dynamic Arrays:
    //     Dynamic arrays don't have a fixed size and can change in length during runtime.
    //     They are declared without specifying a size and can be resized using the push and pop functions.
    //     Example: uint[] public dynamicArray;

    // Fixed-Size Arrays:
    //     Fixed-size arrays have a predetermined size that cannot be changed after declaration.
    //     The size is specified within square brackets during declaration.
    //     Example: uint[5] public fixedArray;

contract Array {
    // Ways to initalize an array
    uint[] public Array1;
    uint[] public Array2 = [1, 2, 3];

    // Fixed-size arrays, all elements intitalize to 0
    uint[10] public myFixeSizeRarray;

    function get(uint index) public view returns (uint) {
        return Array1[index];
    }

    // Soliditiy can return the entir array
    // But the function should be avoided for
    // Arrays that can grow indefinitely in lenght

    function getArray() public view returns (uint[] memory) {
        return Array1;
    }

    function push(uint _number) public {
        // Append to array
        // This will increase the array length by 1
        Array1.push(_number);
    } 

    function pop() public {
        // Removes the last element in the array
        Array1.pop();
    }

    function ArrayLenth() public view returns(uint)  {
        return Array1.length;
    }

    function remove(uint _index) public {
        delete Array1[_index];
        // deleting an element in the array will not dicrease in the lenght of an Array
        // Also the removed element is substitued by 0
    }
    
    // function example() external {
    //     // create or define an array in memory, only fixed size can be created.
    //     uint[] memory Array3 = new uint[](5);
    // }

}