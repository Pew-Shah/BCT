// SPDX-License-Identifier: Unlicensed
// Write a smart contract on a test network, for Bank account of a customer for following operations: 1.Deposit money 2.Withdraw Money 3.Show balance
pragma solidity ^0.8.0;

contract Bank {
    mapping(address => uint256) balances;

    function depositMoney(uint256 amount) public {
        require(amount >=0, "Amount must be greater than 0");
        balances[msg.sender] += amount;
    }

    function withdrawMoney(uint256 amount) public {
        require(amount > 0, "Amount must be greater than 0");
        require(amount <= balances[msg.sender], "Insufficient Balance");
        balances[msg.sender] -= amount;
    }

    function showBalance() public view returns (uint256) {
        return balances[msg.sender];
    }
}