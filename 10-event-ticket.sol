// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// EVENT TICKET

contract EventTicket {
    uint256 numberOfTicket;
    uint256 ticketPrice;
    uint256 totalAmount;
    uint256 startsAt;
    uint256 endsAt;
    uint256 timeRange;
    string message = "Buy your very first Event Ticket";

    constructor(uint256 _ticketPrice) {
        ticketPrice = _ticketPrice;
        startsAt = block.timestamp;
        endsAt = block.timestamp + 7 days;
        timeRange = (endsAt - startsAt) / 60 / 60 / 24;
    }

    function buyTicket(uint256 _value) public returns (uint256 tickeID) {
        numberOfTicket ++;
        totalAmount += _value;
        tickeID = numberOfTicket;
    } 

    function getAmount() public view returns (uint256) {
        return totalAmount;
    }
}