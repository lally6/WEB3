// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//函数类型 也可以作为参数传递和返回值，但使用受到限制，需要通过函数选择器进行调用
//函数选择器
//返回字节4的大小，对于类型转换来说是32位，因此可以传递给一个指针


contract FunctionSelectorExample {
    bytes4 public gselector;
    function getselector() public  returns (bytes4){
        gselector = this.square.selector;
        return gselector;
    }

    // 函数：计算输入值的平方
    function square(uint x) public pure returns (uint) {
        return x * x;
    }
    // 函数：计算输入值的两倍
    function double(uint x) public pure returns (uint) {
        return 2 * x;
    }
    // 函数：根据传入的选择器动态调用 square 或 double 函数
    function executeFunction(bytes4 selector, uint x) public returns (uint) {
        (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(selector, x));
        require(success, "Function call failed");
        return abi.decode(data , (uint));
    }
    bytes4 public storedSelector;
    // 函数：存储选择器到状态变量 storedSelector 中
    function storeSelector(bytes4 selector) public {
        storedSelector = selector;
    }
    // 函数：调用存储在 storedSelector 中的函数，并返回结果
    function executeStoredFunction(uint x) public returns (uint) {
        require(storedSelector != bytes4(0), "Selector not set");
        (bool success, bytes memory data) = address(this).call(abi.encodeWithSelector(storedSelector, x));
        require(success, "Function call failed");
        return abi.decode(data, (uint));
    }
}