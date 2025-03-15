// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ArryOperations{
    uint [] public numbers;
    //像数组添加元素
    function addElement(uint _element) public returns (uint[] memory){
        numbers.push(_element);
        return numbers;
    }
    //删除最后一元素
    function deleteElement() public returns(uint[] memory){
        numbers.pop();
        return numbers;
    }
    //获取数组长度
    function gerArryLength() public view returns (uint) {
        return numbers.length;
    }
} 