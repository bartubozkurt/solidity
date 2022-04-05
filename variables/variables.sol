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
        address address;
    }

    // mapping(uint => Human) list2;

    // Human person1;

    // person1.ID = 123456;
    // person1.name = "Marco";
    // person1.age = 23;
    // person1.address = 0x..........;

    enum trafficlight{
        RED,
        YELLOW,
        GREEN
    }

}
