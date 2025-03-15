// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataHandling{
    uint[] public data;
    //memory数组赋值到storage data中
    function updateData(uint[] memory m_data) public {
        data = m_data;
    }
    //返回storage中的data数组
    function getData() public view returns (uint[] memory){
        return data;  //storage 数据在链上不允许直接返回，需要copy 到memory 中才能return 
    }   
    //修改storage 中的data数组中指定索引位置的值
    function modifyStorageData(uint index,uint newValue) public { 
        data[index] = newValue;   //update storage data at index with new value
        //storage中数据不会直接返回，需要copy 到memory 中才能return
    }
     //修改Memory 中的数组并返回数组
    function modifyMemoryData(uint index, uint[] memory m2_data) public pure returns(uint[] memory) {  
        if(m2_data.length >= index){
                m2_data[index] = 999;
        }
          //update storage data at index with new value
        return m2_data;
    }  //调用时传入index)

    
}