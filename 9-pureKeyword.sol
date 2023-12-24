// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Pure {
    uint256 GlobalVariable1 = 4;
    uint256 GlobalVariable2 = 2;

    // NOTE: with ((pure)) keyword we can only access local variables 
    // Means that we cannot access GLOBAL variables
    // To access Global variables we can use ((view)) keyword
    function getDataWithPure() public pure returns (uint256, uint256) {
        // declaring local variables
        uint256 LocalVariable1 = 8;
        uint256 LocalVariable2 = 4;

        uint256 product = LocalVariable1 * LocalVariable2;
        uint256 sum = LocalVariable1 + LocalVariable2;

        // return (LocalVariable1, LocalVariable2);
        return (product, sum);
    } 

    // Also with ((view)) keyword we can access both State and Local varibales
    // However, with ((pure)) only the local ones 
    // Again with ((view)) keyword we cannot modify 
    function getDataWithView() public view returns (uint256, uint256) {
        // ie; we cannot modify variable with view 
        // GlobalVariable1 += 3;

        uint256 product = GlobalVariable1 * GlobalVariable2;
        uint256 sum = GlobalVariable1 + GlobalVariable2;


        // Here accessing GLOBAL variables with ((view))  
        return (product, sum);
    } 


}