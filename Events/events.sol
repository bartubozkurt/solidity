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
    uint256 public txCount;

    event OrderCreated(uint256 _orderId, address indexed _consumer);
    event ZipChanged(uint256 _orderId,string _zipCode);

    constructor(){
        owner = msg.sender;
    }

    // memory  (not saving blockchain only in the scope).

    // string, array , struct, bytes when passing it as a parameter to a function we should point out location with memory (memory == pointer)

    // create Order
    function createOrder(string memory _zipcode,uint256[] memory _products) checkProducts(_products) incTx external returns(uint256){

        //require(_products.length > 0, "No Products.");
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

        emit OrderCreated(orders.length -1,msg.sender);

        return orders.length -1;
    }

    // procces Order
    function proccesOrder(uint256 _orderId) checkOrderId(_orderId) onlyOwner external{

        //require(owner == msg.sender, "You  are not authorized!");
        //require(_orderId < orders.length, "Not a valid orderId");

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

    function getOrder(uint256 _orderId) checkOrderId(_orderId) external view returns(Order memory){
        //require(_orderId < orders.length, "Not a valid orderId");

        return orders[_orderId];
    }

    function updateZip(uint _orderId, string memory _zipCode) incTx onlyCustomer(_orderId) external {
        require(_orderId < orders.length, "Not a valid orderId");

        Order storage order = orders[_orderId];
        //require(order.customer == msg.sender, "You are not the owner of the order.");

        order.zipCode = _zipCode;
        emit ZipChanged(_orderId,_zipCode);
    }

    modifier checkProducts(uint256[] memory _products) {
        require(_products.length > 0, "No Products.");
        _;
    }

    modifier checkOrderId(uint256 _orderId){
        require(_orderId < orders.length, "Not a valid orderId");
        _;
    }

    modifier incTx{
        _;
        txCount++;
    }
    
    modifier onlyOwner{
        require(owner == msg.sender, "You  are not authorized!");
        _;
    }

    modifier onlyCustomer(uint256 _orderId){
        require(orders[_orderId].customer == msg.sender, "You are not the owner of the order.");
        _;
    }
}
