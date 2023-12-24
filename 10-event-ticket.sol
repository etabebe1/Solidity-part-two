// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// EVENT TICKET

contract EventTicket {
    uint256 public numberOfTicket;
    uint256 public ticketPrice;
    uint256 public totalAmount;
    uint256 public startsAt;
    uint256 public endsAt;
    uint256 public timeRange;
    string public message = "Buy your very first Event Ticket";

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