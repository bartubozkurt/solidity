//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Constructor{

    string public tokenName;
    uint public totalSupply;

    constructor(string memory name, uint supply){
        tokenName = name;
        totalSupply = supply;
    }

    function set(uint number) public {
        totalSupply = number;
    }
}
