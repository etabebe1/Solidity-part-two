// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// This contract demonstrates three different methods of encoding data for 
// Ethereum smart contract calls: encodeWithSignature, encodeWithSelector, and encodeCall.
// Each method has its own characteristics in terms of type safety and error checking.


// Interface for the ERC20 token standard's transfer function.
interface IERC20 {
    function transfer(address, uint) external;
}

// A basic token contract with a transfer function.
contract Token {
    function transfer(address, uint) external {}
}

// Contract demonstrating different ways to encode ABI data.
contract AbiEncode {
    // Function to send a call to a contract using encoded data.
    function test(address _contract, bytes calldata data) external {
        // Perform a low-level call with the provided data.
        (bool ok, ) = _contract.call(data);
        // Require that the call was successful.
        require(ok, "call failed");
    }

    // Encodes a call to the 'transfer' function using its signature.
    function encodeWithSignature(
        address to,
        uint amount
    ) external pure returns (bytes memory) {
        // Encode the function call using its signature.
        // Note: Typo in the signature is not checked at compile time.
        return abi.encodeWithSignature("transfer(address,uint256)", to, amount);
    }

    // Encodes a call to the 'transfer' function using its selector.
    function encodeWithSelector(
        address to,
        uint amount
    ) external pure returns (bytes memory) {
        // Encode the function call using the function selector.
        // Note: Type is not checked - selector is assumed to be correct.
        //                           - selector is the interface it's self. 
        return abi.encodeWithSelector(IERC20.transfer.selector, to, amount);
    }

    // Encodes a call to the 'transfer' function in a type-safe manner.
    function encodeCall(address to, uint amount) external pure returns (bytes memory) {
        // Encode the function call in a type-safe manner.
        // Note: Typo and type errors will cause compile-time errors.
        // Bellow the returning bytes data is the abi encoded data in which if it is decoded,
        // it'll return exactly the decode input 
        return abi.encodeCall(IERC20.transfer, (to, amount));
    }
}
