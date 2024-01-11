// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Call keyword -- when it comes  to transfering fund from one account to another account
//                 the call keyword is recommended.

// Contract that receives Ether and emits events when certain functions are called
contract Receive {
    // Event emitted when funds are received
    event Received(address caller, uint amount, string message);

    // Fallback function that is triggered when Ether is sent to the contract without calling a specific function
    fallback() external payable { 
        emit Received(msg.sender, msg.value, "Fallback was called!");
    }

    // The receive function is similar to fallback and is automatically called when Ether is sent to the contract
    // receive() external payable {
    //     emit Received(msg.sender, msg.value, "Receive was called!");
    // }

    // A function that accepts Ether, emits an event, and returns a value
    function foo(string memory _message, uint _x) public payable returns (uint) {
        emit Received(msg.sender, msg.value, _message);
        return  _x + 1;
    }
}

// Contract that tests calling functions in another contract
contract Caller {
    // Event emitted to capture the response of a function call
    event Response(bool success, bytes data);

    // Function to test calling the 'foo' function in the Receive contract
    function testCallFoo(address payable _addr) public payable {
        // Call the 'foo' function in the Receive contract with custom gas amount and sent Ether
        (bool success, bytes memory data) = _addr.call{value: msg.value, gas: 5000}("");

        // The code below is commented out as it is not used and would cause a compilation warning
        // abi.encodeWithSignature("foo(string,uint256)", "call foo", 123);
       
        // Emit the response of the function call
        emit Response(success, data);
    }

    // Function to test calling a non-existent function in the Receive contract
    function testCallDoesNotExist(address _addr) public {
        // Call a function that does not exist in the Receive contract
        (bool success, bytes memory data) = _addr.call(
            abi.encodeWithSignature("doesNotExist()")
        );

        // Emit the response of the function call
        emit Response(success, data);
    }
}
