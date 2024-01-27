// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// try / catch:
// can only catch errors from external function calls and contract creation.

// External contract used for try / catch examples
contract Foo {
    address public owner;

    constructor(address _owner) {
        // Ensure the provided _owner address is not the zero address
        require(_owner != address(0), "invalid address");
        // Assert that _owner is not a specific address (for demonstration)
        assert(_owner != 0x0000000000000000000000000000000000000001);
        // Set the owner of the contract to _owner
        owner = _owner;
    }

    function myFunc(uint x) public pure returns (string memory) {
        // Require that x is not zero, otherwise revert with an error message
        require(x != 0, "require failed");
        // Return a success message if no error occurs
        return "my func was called";
    }
}

contract Bar {
    // Event to log a message
    event Log(string message);
    // Event to log raw bytes data
    event LogBytes(bytes data);

    // Reference to a Foo contract instance
    Foo public foo;

    constructor() {
        // Create a new Foo contract with the sender as the owner
        foo = new Foo(msg.sender);
    }

    // Example of try / catch with external call
    // tryCatchExternalCall(1) => Log("my func was called")
    // tryCatchExternalCall(0) => Log("require failed")
    function tryCatchExternalCall(uint _i) public {
        try foo.myFunc(_i) returns (string memory result) {
            // If the call succeeds, log the result
            emit Log(result);
        } catch {
            // If the call fails, log the failure message
            emit Log("external call failed");
        }
    }

    // Example of try / catch with contract creation
    // tryCatchNewContract(0x0000000000000000000000000000000000000000) => Log("invalid address") 
    // require validation excuted form Foo contract

    // tryCatchNewContract(0x0000000000000000000000000000000000000001) => Log("")
    // assert validation excuted but returns "" value from Foo contract

    // tryCatchNewContract(0x0000000000000000000000000000000000000002) => Log("Foo created")
    // all validation passed, therefore,  "Foo created" in Bar contract
    function tryCatchNewContract(address _owner) public {
        try new Foo(_owner) returns (Foo foo) {
            // If the Foo contract is created successfully, log the success message
            emit Log("Foo created");
        } catch Error(string memory reason) {
            // Catch and log errors from revert() and require()
            emit Log(reason);
        } catch (bytes memory reason) {
            // Catch and log errors from assert()
            emit LogBytes(reason);
        }
    }
}
