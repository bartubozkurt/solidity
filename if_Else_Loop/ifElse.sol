//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IfElse{

    //memory function provides data stay in function not absolutely saving blockchain

    bytes32 private hashedPassword;
    uint256 private loginCount;

    constructor(string memory _pass){
        hashedPassword = keccak256(abi.encode(_pass));
    }

    function show() public view returns (bytes32){
        return hashedPassword;
    }

    // function login(string memory _pass) public view returns (bool){
    //     return hashedPassword == keccak256(abi.encode(_pass));
    // }

    function login(string memory _pass) public returns(bool){
        if (hashedPassword == keccak256(abi.encode(_pass))){
            loginCount++;
            return true;
        }
        else{
            return false;
        }
    }

    //     function loginOther(string memory _pass) public view returns (bool){
    //     return (hashedPassword == keccak256(abi.encode(_pass))) ? true: false;
    // }

    function loginStatus() public view returns(uint256){
        if(loginCount == 0){
            return 0;
        }
        else if(loginCount >0 && loginCount != 1){
            return 1;
        }
        else if(loginCount == 1){
            return 2;
        }
        else{
            return 3;
        }
    }
}
