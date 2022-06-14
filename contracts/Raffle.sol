// Raffle
// THis contract will
// 1. Allows multiple user to enter and add money to the lottery
//      This is done by paying some money eg 0.01 eth
// 2. Pick a random number or user among the people which
//      is verifiable. This is done using chainlink oracle
// 3. send all pool amount that person after x duration.
//

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

error Raffle__notEnoughETH();

contract Raffle {
    /* Static variables */
    address private immutable i_owner;
    address payable[] private s_players;
    uint private immutable i_entranceFee;

    event  RaffelEnter(address indexed player);

    constructor(uint entranceFee) {
        i_owner = msg.sender;
        i_entranceFee = entranceFee;
    }

    function enterRaffel() public payable {
        if (msg.value < i_entranceFee) {
            revert Raffle__notEnoughETH();
        }
        s_players.push(payable(msg.sender));
        emit RaffelEnter(msg.sender) ; 
    }

    function getEntranceFee() public view returns (uint) {
        return i_entranceFee;
    }
}
