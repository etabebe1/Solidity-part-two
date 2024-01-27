// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// The following code provides examples of two Solidity libraries: 
// Math for calculating the square root of a number, and
// Array for manipulating arrays (specifically removing an element at a given index).
// The TestMath and TestArray contracts demonstrate the usage of these libraries.


// Define a library named Math
library Math {
    // A function to calculate the square root of a number
    function sqrt(uint y) internal pure returns (uint z) {
        // If y is greater than 3, use the Babylonian method for square roots
        if (y > 3) {
            z = y;
            uint x = y / 2 + 1;
            // Continue iterating until you find the square root
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            // If y is not 0 but less than or equal to 3, return 1 as the square root
            z = 1;
        }
        // If y is 0, z is already 0 by default
    }
}

// Define a contract that uses the Math library
contract TestMath {
    // A public function to test the square root calculation
    function testSquareRoot(uint x) public pure returns (uint) {
        return Math.sqrt(x);
    }
}

// Define a library for array operations
library Array {
    // Function to remove an element from an array
    function remove(uint[] storage arr, uint index) public {
        // Ensure the array is not empty
        require(arr.length > 0, "Can't remove from empty array");
        // Replace the element to be removed with the last element
        arr[index] = arr[arr.length - 1];
        // Remove the last element (now duplicated)
        arr.pop();
    }
}

// Define a contract that uses the Array library
contract TestArray {
    // Enable the use of Array library methods for uint arrays
    using Array for uint[];

    // Public array to store uint values
    uint[] public arr;

    // Function to test removing an element from the array
    function testArrayRemove() public {
        // Populate the array with initial values
        for (uint i = 0; i < 5; i++) {
            arr.push(i);
        }

        // Remove the element at index 1
        arr.remove(1);

        // Assert statements for testing the result
        assert(arr.length == 2); // Check that the array length is now 4
        assert(arr[0] == 0); // Check that the first element is still 0
        assert(arr[1] == 2); // Check that the second element is now 2 (previously the last element)
    }
}
