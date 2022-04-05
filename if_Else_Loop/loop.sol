//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Loop{

    uint256[15] public numbers0;
    uint256[10] public numbers1;

    function listByFor() public {
        uint256[15] memory nums = numbers0;

        for(uint256 i = 0; i < nums.length; i++){
            // if(i==9) continue;
            // if(i==9) break;
            nums[i] = i;
        }
        numbers0 = nums;
    }

    function getNumbers_0() public  view returns(uint256[15] memory){
        return numbers0;
    }
        function getNumbers_1() public  view returns(uint256[10] memory){
        return numbers1;
    }

    function  listByWhile() public{
        uint256 i = 0;
        while(i <  numbers1.length){
            numbers1[i] = i;
            i++;
        }
    }

}
