//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Variables{
    // Fixed Size Types
    bool isTrue = false;

    int number = 12; // int256
    int8 number_2 =12;
    uint number_3 = 12; // - number exist

    address myAdress = 0x5c6B0f7Bf3E7ce046039Bd8FABdfD3f9F5021678;

    bytes32 name = "bartubozkurt";
    
    // Dynamic-Size Types
    string name_2 =  "bartu";
    bytes name_3 = "bozkurt";

    uint[] array = [1,2,3,4,5];

    mapping(uint => address) list;

    // User Defined Value Types

    struct Human{
        uint ID;
        string name;
        uint age;
        address Address;
    }

    // mapping(uint => Human) list2;

    // Human person1;

    // person1.ID = 123456;
    // person1.name = "Marco";
    // person1.age = 23;
    // person1.Address = 0x..........;

    enum trafficlight{
        RED,
        YELLOW,
        GREEN
    }

    // operators

    // ! (logical negation)
    // && (logical conjunction, “and”)
    // || (logical disjunction, “or”)
    // == (equality)
    // != (inequality)


    // ether birimleri

    // 1 wei = 1
    // 1 gwei = 10^9
    // 1 ether = 10^18

    // zaman birimleri 

    // 1 == 1 seconds
    // 1 minutes == 60 seconds
    // 1 hours == 60 minutes
    // 1 days == 24 hours
    // 1 weeks == 7 days




    // Pure : that will read the storage(hence viewing)
    // View : There will be no read or write to storage and only local variable will be used


    // STATE Variables

    string public bestClub = "itu blockchain";
    uint256 public founded = 2018;
    bool private rich = false;

    function add(int256 _number) public pure retur25ns (int6) {
        // Local Variables
        int256 minus = -1;
        int256 lucky = 33;

        return _number + minus + lucky;
    }


    // GLOBAL Variables

    function show_2() public view returns(uint){
        return block.number;
    }

    function show_3() public view returns(address){
        return msg.sender;
    }   

    //Global Variables

    // block.difficulty (uint)	Current block difficulty
    // block.gaslimit (uint)	Current block gaslimit
    // block.number (uint)	Current block number
    // block.timestamp (uint)	Current block timestamp as seconds since unix epoch
    // msg.data (bytes calldata)	Complete calldata
    // msg.sender (address payable)



}
