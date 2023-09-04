// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract escrow {
    address public funder;
    address public beneficiary;

    constructor() {
        funder = msg.sender;
    }

    // Function to add money in contract by the funder
    function fund(address _reciever) public payable {
        beneficiary = _reciever;
    }

    // Transfer all funds stored in this smart contract to beneficiary once job is done
    function release() public payable {
        if (msg.sender == funder) {
            payable(beneficiary).transfer(address(this).balance);
        }
    }

    // Calling function to check the balance in smart contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
