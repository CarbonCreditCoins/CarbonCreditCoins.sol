// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract CarbonCreditCoin {
    string public name = "Carbon Credit Coin";
    string public symbol = "CCC";
    uint8 public decimals = 18;

    uint256 public totalSupply = 20_000_000_000 * 10 ** 18;

    address public masterWallet;

    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(address _masterWallet) {
        require(_masterWallet != address(0), "Carteira invalida");

        masterWallet = _masterWallet;
        balanceOf[_masterWallet] = totalSupply;

        emit Transfer(address(0), _masterWallet, totalSupply);
    }

    function transfer(address to, uint256 value) public returns (bool) {
        require(balanceOf[msg.sender] >= value, "Saldo insuficiente");

        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;

        emit Transfer(msg.sender, to, value);
        return true;
    }
}
