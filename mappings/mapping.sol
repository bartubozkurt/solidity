//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mappings{

    mapping (address => bool) public registered;
    mapping (address => uint256) public favN;

    function register(uint256 _favN) public {
        require(!isRegister(), "Already register!");
        registered[msg.sender] = true;
        favN[msg.sender] = _favN;
    }

    function isRegister() public view returns(bool){
        return registered[msg.sender];
    }

    function deleteRegister() public{
        require(isRegister(), "user doesn't register!");
        delete(registered[msg.sender]);
        delete(favN[msg.sender]);
    }
}
