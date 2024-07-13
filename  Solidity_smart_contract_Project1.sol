 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    mapping(address => uint) private balances;

    // Deposit function
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
        balances[msg.sender] += msg.value;
    }

    // Withdraw function
    function withdraw(uint _amount) public {
        require(_amount > 0, "Withdrawal amount must be greater than zero");
        require(_amount <= balances[msg.sender], "Insufficient balance");

        // Subtract the amount before transferring to prevent reentrancy attacks
        balances[msg.sender] -= _amount;

        // Transfer the amount
        payable(msg.sender).transfer(_amount);
    }

    // Get balance function
    function getBalance() public view returns (uint) {
        return balances[msg.sender];
    }

    // Function to test assert()
    function testAssert() public view {
        uint balance = balances[msg.sender];
        assert(balance >= 0); // This should always be true
    }

    // Function to test revert()
    function testRevert() public pure {
        revert("This is a test revert");
    }
}
