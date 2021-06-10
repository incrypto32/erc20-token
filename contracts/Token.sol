// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Token {
    uint256 totalSupply = 1000000 * 10**18;
    string public name = "Onji token";
    string public symbol = "ONJI";
    uint256 public decimals = 18;
    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        balances[msg.sender] = totalSupply;
    }

    function balanceOf(address owner) public view returns (uint256) {
        return balances[owner];
    }

    function approve(address spender, uint256 tokens) public returns (bool) {
        allowance[msg.sender][spender] += tokens;
        return false;
    }

    function transferFrom(
        address from,
        address to,
        uint256 value
    ) public returns (bool) {
        require(balanceOf(from) >= value, "low balance");
        require(allowance[from][msg.sender] >= value, "low allowance");
        balances[to] += value;
        allowance[from][msg.sender] -= value;
        balances[from] -= value;
        emit Transfer(from, to, value);
        return true;
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf(msg.sender) >= value, "low balance");
        balances[to] += value;
        balances[msg.sender] -= value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
}
