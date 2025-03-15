pragma solidity ^0.8.0;
// SPDX-License-Identifier: MIT
contract MultiStageTimeLock { 
    uint public stage1UnlockTime; 
    uint public stage2UnlockTime; 
    address public owner;

constructor(uint _stage1Lock, uint _stage2Lock) {
    owner = msg.sender;
    stage1UnlockTime = block.timestamp + _stage1Lock * 1 days;  // 第一阶段锁定天数
    stage2UnlockTime = block.timestamp + _stage2Lock * 1 days;  // 第二阶段锁定天数
}
function withdrawStage1() public {
    require(block.timestamp >= stage1UnlockTime, "Stage 1 funds are locked.");
    require(msg.sender == owner, "Only owner can withdraw.");
    // 提取第一阶段资金操作
}
function withdrawStage2() public {
    require(block.timestamp >= stage2UnlockTime, "Stage 2 funds are locked.");
    require(msg.sender == owner, "Only owner can withdraw.");
    // 提取第二阶段资金操作
    }
}