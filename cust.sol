// SPDX-License-Identifier: MIT
// Write a program in solidity to create Customer data. Use the following constructs: 1.Structures 2.Arrays 3.Fallback. Deploy this as smart contract on Ethereum and Observe the transaction fee and Gas values.
pragma solidity ^0.8.0;

contract CustomerData {
    // Structure to store customer details
    struct Customer {
        uint id;
        string name;
        string email;
        uint balance;
    }

    // Array to store multiple customer records
    Customer[] public customers;

    address public owner;

    // Constructor to set the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can add customers.");
        _;
    }

    // Fallback function to accept ether sent directly to the contract
    fallback() external payable {}

    // Receive function to accept ether
    receive() external payable {}

    // Function to add a new customer
    function addCustomer(uint _id, string memory _name, string memory _email, uint _balance) public onlyOwner {
        customers.push(Customer(_id, _name, _email, _balance));
    }

    // Function to get details of a customer by index
    function getCustomer(uint index) public view returns (uint, string memory, string memory, uint) {
        require(index < customers.length, "Invalid index.");
        Customer memory cust = customers[index];
        return (cust.id, cust.name, cust.email, cust.balance);
    }

    // Function to get the total number of customers
    function getTotalCustomers() public view returns (uint total) {
        return customers.length;
    }
}
