// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserBalanceAndLeaderboard {
    // 用户余额映射
    mapping(address => uint) public balances;
    // 用户交易历史记录
    mapping(address => uint[]) public transactions;
    // 用户积分
    mapping(address => uint) public scores;
    // 参与排行榜的用户列表
    address[] public users;

    // 事件
    event Deposited(address indexed user, uint amount);
    event ScoreUpdated(address indexed user, uint newScore);

    // 存款，并记录交易历史
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        balances[msg.sender] += msg.value;
        transactions[msg.sender].push(msg.value);
        emit Deposited(msg.sender, msg.value);
    }

    // 查询用户余额
    function getBalance(address user) public view returns (uint) {
        return balances[user];
    }

    // 查询用户交易历史
    function getTransactionHistory(address user) public view returns (uint[] memory) {
        return transactions[user];
    }

    // 更新用户积分，并加入排行榜
    function updateScore(address user, uint points) public {
        if (scores[user] == 0) {
            users.push(user);
        }
        scores[user] += points;
        emit ScoreUpdated(user, scores[user]);
    }

    // 获取排行榜（返回排序后的用户地址和积分）
    function getLeaderboard() public view returns (address[] memory, uint[] memory) {
        uint length = users.length;
        uint[] memory sortedScores = new uint[](length);
        address[] memory sortedUsers = new address[](length);

        for (uint i = 0; i < length; i++) {
            sortedScores[i] = scores[users[i]];
            sortedUsers[i] = users[i];
        }

        // 冒泡排序，从高到低排序
        for (uint i = 0; i < length; i++) {
            for (uint j = i + 1; j < length; j++) {
                if (sortedScores[i] < sortedScores[j]) {
                    (sortedScores[i], sortedScores[j]) = (sortedScores[j], sortedScores[i]);
                    (sortedUsers[i], sortedUsers[j]) = (sortedUsers[j], sortedUsers[i]);
                }
            }
        }

        return (sortedUsers, sortedScores);
    }
}
