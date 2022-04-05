//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Function{

    uint luckyNumber = 20;

    function show() public view returns(uint){
         return luckyNumber;
    }
    
    function changeLuckyNumber(uint256 _num) public {
         luckyNumber = _num;
     }

    function nothing() public pure returns(uint x, bool y, bool z){
         x = 6;
         y= false;
         z= true;
     }

    uint public xi = 3;

    function setX(uint newX) public{
        xi = newX;
    }

    function exAdd(uint a, uint b) public pure returns(uint){
        return a+b;
    }

    // public, external, ınternal, private


    // public : this function call both external user and contract

    function add_public(uint  c, uint d) public pure returns(uint) {
        return exAdd(c,d);
    }

    function publicKeyword() public pure returns(string memory) {
        return "test public";
    }

    function callPublicKeyword() public pure returns(string memory) {
        return publicKeyword();
    }

    // private : this function only call this contract.

    function privateKeyword() private pure returns(string memory) {
        return "test Private";
    }

    // internal : this function call from contract but doesn't call external user.

    function internalKeyword() internal pure returns(string memory) {
        return "test internal";
    }

    function callinternalKeyword() public pure returns(string memory) {
        return internalKeyword();
    }

    // external : this function call from external user but doesn't call from contract.

    function externalKeyword() external pure returns(string memory) {
        return "test external";
    }

    // !
    function callExternalKeyword() public pure returns(string memory) {
        return externalKeyword();
    }
}
