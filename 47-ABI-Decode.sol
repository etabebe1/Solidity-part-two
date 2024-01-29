// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// ABI

// abi.encode encodes data into bytes.
// abi.decode decodes bytes back into data.


// Contract for demonstrating ABI encoding and decoding
contract AbiDecode {
    // Define a struct with a string and an array of two uints
    struct MyStruct {
        string name;
        uint[2] nums;
    }

    // Function to encode various types of data into a bytes array
    function encode(
        uint x,
        address addr,
        uint[] calldata arr,
        MyStruct calldata myStruct
    ) external pure returns (bytes memory) {
        // Use abi.encode to convert inputs into a bytes array
        // NOTE: when it comes to abi encoding, we can use several method such as:
        //       encodeWithSignature, encodeWithSelector
        return abi.encode(x, addr, arr, myStruct);
    }

    // Function to decode a bytes array back into specific data types
    function decode(
        bytes calldata data
    )
        external
        pure
        returns (uint x, address addr, uint[] memory arr, MyStruct memory myStruct)
    {
        // Use abi.decode to extract the data from the bytes array
        // Decode the data into the specified types: uint, address, uint array, and MyStruct
        (x, addr, arr, myStruct) = abi.decode(data, (uint, address, uint[], MyStruct));
    }
}
