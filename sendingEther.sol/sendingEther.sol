//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank{

    mapping (address => uint) balances;

    function sendEtherToContract() payable external{
        balances[msg.sender] = msg.value;
    }
    
    function showBalance() external view returns(uint){
        return balances[msg.sender];
    }
    function withdraw(address payable to, uint amount) checkBalanceControl(to,amount) external{
        to.transfer(amount);
        balances[msg.sender] -= amount;
    }

    modifier checkBalanceControl(address to, uint amount){
        require(balances[msg.sender] >= amount, "insufficient balance!");
        _;
    }


}
