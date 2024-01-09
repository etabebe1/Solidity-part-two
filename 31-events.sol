// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Definition:
// In Solidity, an event is a way to log and notify external entities 
// (like user interfaces or other smart contracts) about specific occurrences within a contract.

// Some common events include:

//     Logging State Changes:
//         Use events to log critical state changes within a contract,
//         making it easier for external observers to track and analyze the contract's behavior.

//     User Interface Updates:
//         Events are often used to update user interfaces, 
//         providing real-time feedback to users about actions or changes that occur on the blockchain.

//     Inter-Contract Communication:
//         Events can be used to trigger actions in other smart contracts by listening 
//         and responding to events emitted by the first contract.

//     Auditability and Debugging:
//         Events are valuable for auditing and debugging purposes. 
//         They provide a historical record of important transactions and state changes.

// How to Use Events:

//     Declaration:
//         Declare events within the contract using the event keyword. 
//         Define the parameters that you want to log.

//     Emission:
//         Emit an event using the emit keyword followed by the event name and the values to log.
//         This typically happens within a function or a specific code path where the event is relevant.

//     Listening:
//         External applications or smart contracts can listen to events and respond accordingly. 
//          This is often done using event listeners or filters.

// Why Use Events:

//     Decentralized Communication:
//         Events enable decentralized communication between smart contracts and
//         external systems without direct dependencies.

//     Asynchronous Operation:
//         Events allow for asynchronous operation. 
//         The emitting contract doesn't need to wait for external systems to respond.

//     Auditability:
//         Events provide a transparent and auditable trail of important contract activities, 
//         aiding in transparency and accountability.

//     Real-time Updates:
//         Events enable real-time updates in user interfaces, 
//         providing users with immediate feedback about the state of the blockchain.

 contract Event {
    // Event declaration
    // Upto 3 parameters can be indexed.
    // Indexed parameter helpes you filter the logs by indexed parameter
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        emit Log(msg.sender, "Hello world!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
 }