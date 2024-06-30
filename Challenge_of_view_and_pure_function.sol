// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleContract {
    uint256 private value;

    // Constructor to set the initial value
    constructor(uint256 _value) {
        value = _value;
    }

    // View function to get the current value
    function getValue() public view returns (uint256) {
        return value;
    }

    // Pure function to add two numbers
    function add(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }

    // Function to set a new value
    function setValue(uint256 _value) public {
        value = _value;
    }
}
