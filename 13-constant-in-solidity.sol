// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Constants

contract Constant {
    // 128613 -- transaction cost with out using constant keyword
    // 148525
    // view will be used
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // 66854 -- transiction cost with constant keyword being used
    // 116389 
    // pure will be used 
    // address public constant MY_ADDRESS = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function getConstant() public view returns (address){
        return myAddress;
    }  

}

// Conclusion for a keyword constant
// It will save gas fee when transaction is deployed
// It will be used for those variable that are not going to change in our code. 