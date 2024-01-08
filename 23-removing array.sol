// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract ArrayRemovingByShifting {
    // The concept will be as following
    // The element to be removed is based on index 
    // [1, 2, 3] ---> remove i(1) ---> [1, 3, 3] ---> [1, 3]
    // [1, 2, 3, 4, 5, 6] ---> remove i(2) ---> [1, 2, 4, 5, 6, 6] ---> [1, 2, 4, 5, 6]
    // [1, 2, 3, 4, 5, 6] ---> remove i(0) ---> [2, 3, 4, 5, 6, 6] ---> [2, 3, 4, 5, 6]
    // [1] ---> remove i(0) ---> [1] ---> []

    uint[] public Array;

    function remove(uint _index) public {
        require(_index < Array.length, "index is out of bound!");

        for(uint i = _index; i < Array.length - 1; i++) {
            Array[i] = Array[i + 1];
        }

         Array.pop();
    } 

    function test() external {
        Array = [1, 2, 3, 4, 5];
        remove(2); // result [1, 2, 4, 5]
                   // length = 4 === number of elts = 4

        assert(Array[0] == 1);
        assert(Array[1] == 2);
        assert(Array[2] == 4);
        assert(Array[3] == 5);
        assert(Array.length == 4);

        Array = [1];
        remove(0);
        // []
        assert(Array.length == 0 );
    }

}