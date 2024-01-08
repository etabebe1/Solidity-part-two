// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Enum 

// Here are some important aspects of enums in Solidity:

//     Definition: Enums are defined using the enum keyword followed by the name of the enum and a list of possible values enclosed in curly braces {}.

//     Values: In the example above, State is an enum with three possible values: Pending, Approved, and Rejected. By default, the values are assigned integers starting from 0 (Pending = 0, Approved = 1, Rejected = 2).

//     Use Cases: Enums are helpful for managing state or status changes within a contract. For instance, they can represent the lifecycle of an item, the status of a transaction, or different states of a process.

//     Efficiency: Enums in Solidity are efficient in terms of gas usage because they use a small amount of storage compared to string representations of state.

//     Security: Enums can improve code readability and reduce the chances of errors by limiting the possible values to a predefined set.

//     Type Safety: Enums provide type safety, ensuring that only specified values can be assigned to variables of that enum type.


contract Enum {
    // Define an enum named State with three possible values
     enum Status { Pending, Shipping, Rejected, Accepted, Canceled }

    //  Here, the default value is the first element listed in
    // Definition of the type, in this case is "Pending"

    // State variable using the State enum
    Status public status;

    // Returns uint
    // Similar to Array enum also has index
    // Pending - 0 (default value)
    // Shipping - 1
    // Rhected - 2
    // Accepted - 3
    // Canceled - 4

    function get() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input
    function setStatus(Status _status) public {
        status = _status;
    }

    // Update status by passing specific enum as following
    function cancel() public {
        status = Status.Canceled; 
    }

    // with delete keyword, status will be reset to it's first value --> 0
    function reset() public {
        delete status;
    }

}