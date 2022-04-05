//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NestedMapping{

    mapping(address => mapping(address => uint256)) public debts;

    function incrementDebt(address _borrower, uint256 _amount) public {
        debts[msg.sender][_borrower] += _amount; 
    }

    function decrementDebt(address _borrower, uint256 _amount) public {
        require(debts[msg.sender][_borrower] >= _amount, "Not enough debt.");
        debts[msg.sender][_borrower] -= _amount;
    }

    function getDebt(address _borrower) public view returns(uint256){
        return debts[msg.sender][_borrower];
    }
}
