// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


// Array Replaced from end

contract ArrayReplacedFromEnd {
    uint[] public Array;

    // Note that: deleteing an element creates a gap in the array
    // But we can use pop method to remove the last or gapping element

    function remove (uint _index) public {
        // move the last element in to the place to delete.
        Array[_index] = Array[Array.length - 1];
        // Now we can remove the lase element using pop() method
        Array.pop();
    }

    // It's possible 
    function setUpTest() public {
        Array = [1, 2, 3, 4];
        remove(1);
        // [1, 4, 3]
        assert(Array.length == 3);
        assert(Array[0] == 1);
        assert(Array[1] == 4);
        assert(Array[2] == 3);

        remove(2);
        // [1, 4]

        assert(Array.length == 2);
        assert(Array[0] == 1);
        assert(Array[1] == 4);

    }

}

