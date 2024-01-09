// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Visibility in Solidity:

// Visibility in Solidity determines who can access state variables and 
// functions within a smart contract. There are four visibility modifiers:

//     public:
//         Accessible from any external contract or account.
//         Automatically generates a getter function for public state variables.

//     internal:
//         Accessible only within the current contract and its derivatives.
//         Default visibility for state variables.

//     private:
//         Limited to access within the current contract.
//         Ideal for sensitive variables.

//     external:
//         Applied to functions, making them callable only from external contracts or transactions.

// Why and When to Use Visibility:

//     Encapsulation:
//         Use visibility to encapsulate and protect internal state, 
//         e.g., use private for sensitive data.

//     Security:
//         Restrict access to functions or variables to enhance security, 
//         e.g., use external for external interactions.

//     Interoperability:
//         Choose visibility based on intended interactions with other contracts,
//         e.g., use public for external access.

//     Gas Optimization:
//         Consider gas costs when choosing visibility,
//         e.g., accessing a public state variable incurs automatic getter function costs.

contract Base {
    // Private function can only be called
    // - inside this contract
    // Means that Contract that inherit this contract cannot call this function bellow
    function privateFunc() private pure returns (string memory) {
        return "Private functio called";
    }

    function testprivateFunc() public pure virtual returns (string memory) {
        return privateFunc();
    }


    // Internal functions can be called
    // - inside this contract
    // - inside constracts that inherit this contract

    function internalFunc() internal pure returns (string memory) {
        return "Internal function is called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // Public functions can be called
    // - inside this contract
    // - inside contracts that inherit this contract
    // - also by other contracts and accounts
    
    function publicFunc() public pure returns (string memory) {
        return "Public function called";
    }

    // External function can be called 
    // - by other contract and other accounts
    function externalFunc() external pure returns (string memory) {
        return "External function called";
    }

    // This function will not  compile since we're trying to call
    // an external function here
    //  function testExternalFunc() public pure returns (string memory) {
    //     return testExternalFunc();
    // }

    string private privateVariable = "My private variable";
    string internal internalVariable = "My internal variable";
    string public publicVariable = "My public variable";
    
    // Note that: State variable cannot be external so this code won't compile
    // string external externalVariable = "My external variable";
}

contract Child is Base {
    // Inherited contracts do not have access to private function
    // and state variables.
 
    // function testprivateFunc() public pure returns (string memory) {
    //     return privateFunc();
    // }

    // Internal functio call be called inside chiled contracs.
    function testprivateFunc() public pure override returns (string memory) {
        return internalFunc();
    }

}