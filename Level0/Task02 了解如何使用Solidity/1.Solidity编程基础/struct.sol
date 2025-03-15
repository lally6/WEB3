
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract StructExample {
    struct Product {
        uint id;
        string name;
        uint price;
        uint stock;
    }
    mapping(uint => Product) public products;
    uint public productCount;
    function addProduct(string memory _name, uint _price, uint _stock) public {
        productCount++;
        products[productCount] = Product(productCount, _name, _price, _stock);
    }
    function updateProductStock(uint _productId, uint _newStock) public {
        Product storage product = products[_productId];
        product.stock = _newStock;
    }
    function getProduct(uint _productId) public view returns (string memory, uint, uint) {
        Product storage product = products[_productId];
        return (product.name, product.price, product.stock);
    }
}