// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract sampleWallet{
    mapping(address => uint256) public balances;

    //存款
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    //取款
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "No enough balance!");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    //查询余额
    function checkBalance() public view returns(uint256) {
        return balances[msg.sender];
    }

}