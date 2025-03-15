// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Hello{

    //this显示转换返回当前合约地址
    function getAddress() public view returns (address){
        return address(this);
    }
    //selfdestruct 函数销毁合约
    // function destroyContract(address payable recipient) public{
    //     selfdestruct(recipient);
    // }

}

contract HelloWorldFactory{
    function getContractInfo() 
        public pure returns (string memory, bytes memory, bytes memory) 
        {
                return (type(Hello).name, type(Hello).creationCode, type(Hello).runtimeCode);
        }
    }