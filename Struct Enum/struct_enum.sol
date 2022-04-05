//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructEnum{

    enum Status{
        Taken, // 0
        Preparing, //1
        Boxed, // 2
        Shipped // 3
    }

    struct Order{
        address customer;
        string zipCode;
        uint256[] products;
        Status status;
    }

    Order[] public orders;
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    // memory  (not saving blockchain only in the scope).

    // string, array , struct, bytes when passing it as a parameter to a function we should point out location with memory (memory == pointer)

    // create Order
    function createOrder(string memory _zipcode,uint256[] memory _products) external returns(uint256){

        require(_products.length > 0, "No Products.");
// ----------------------------------------------------
        Order memory order;
        order.customer = msg.sender;
        order.zipCode = _zipcode;
        order.products = _products;
        order.status = Status.Taken;

        orders.push(order);
// ----------------------------------------------------
        // orders.push(
        //         Order({
        //             customer: msg.sender,
        //             zipCode: _zipcode,
        //             products: _products,
        //             status: Status.Taken
        //         })
        // );
// ----------------------------------------------------
        // order.push(Order(msg.sender,_zipcode,_products,Status.Taken));
// ----------------------------------------------------

        return orders.length -1;
    }

    // procces Order
    function proccesOrder(uint256 _orderId) external{

        require(owner == msg.sender, "You  are not authorized!");
        require(_orderId < orders.length, "Not a valid orderId");

        Order storage order = orders[_orderId];
        
        require(order.status != Status.Shipped,"Order is already shipped!");

        if(order.status == Status.Taken){
            order.status = Status.Preparing;
        }
        else if(order.status == Status.Preparing){
            order.status = Status.Boxed;
        }
        else if(order.status == Status.Boxed){
            order.status = Status.Shipped;
        }
    }

    function getOrder(uint256 _orderId) external view returns(Order memory){
        require(_orderId < orders.length, "Not a valid orderId");

        return orders[_orderId];
    }

    function updateZip(uint _orderId, string memory _zipCode) external {
        require(_orderId < orders.length, "Not a valid orderId");

        Order storage order = orders[_orderId];
        require(order.customer == msg.sender, "You are not the owner of the order.");
        order.zipCode = _zipCode;
    }
}
