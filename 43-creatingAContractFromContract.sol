// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// In this file we will learn how we can create a contract that can create anothe contaract
// To create a new contract that will create a contract there will be a keyword used 
// Keyword - such as:


contract Car {
    address public owner; // State variable to store the owner's address
    string public model; // State variable to store the car model
    address public carAddress; // State variable to store this contract's address

    // Constructor to initialize the Car contract
    constructor(address _owner, string memory _model) payable {
        owner = _owner; // Set the owner's address
        model = _model; // Set the car's model
        carAddress = address(this); // Set carAddress to the contract's own address
        // NOTE: address(this) --- helps use to know the contract's address
    }
}


contract CarFactory {
    Car[] public cars; // Dynamic array to store deployed Car contracts

    // Function to create a new Car contract
    function create (address _owner, string memory _model) public {
        Car car = new Car(_owner, _model); // Create a new Car contract
        cars.push(car); // Add the new Car contract to the cars array
    }

    // Function to create a new Car contract and send Ether
    function createAndSendEther (address _owner, string memory _model) public payable {
        Car car = (new Car){value: msg.value}(_owner, _model); // Create a new Car contract with Ether
        cars.push(car); // Add the new Car contract to the cars array
    }

    // Function to create a new Car contract with a custom salt (for deterministic addresses)
    function create2 (
        address _owner,
        string memory _model,
        bytes32 _salt
    ) public {
        Car car = (new Car){salt: _salt}(_owner, _model); // Create a new Car contract with a custom salt
        cars.push(car); // Add the new Car contract to the cars array
    }
    
    // Function to create a new Car contract with a custom salt and send Ether
    function create2AndSendEther(
        address _owner,
        string memory _model,
        bytes32 _salt
    ) public payable {
        Car car = (new Car){value: msg.value, salt: _salt}(_owner, _model); // Create a new Car contract with Ether and a custom salt
        cars.push(car); // Add the new Car contract to the cars array
    }

    // Function to retrieve details of a Car contract by its index in the array
    function getCar(uint _index) 
        public 
        view 
        returns (
            address owner,
            string memory model,
            address carAddress,
            uint balance
        ) {
            Car car = cars[_index]; // Retrieve the Car contract at the specified index

            // Return the Car contract's details
            return (car.owner(), car.model(), car.carAddress(), address(car).balance);
        }
}
