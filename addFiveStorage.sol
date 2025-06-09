// SPDX-License-Identifier: MIT

pragma solidity >=0.8.30 <0.9.0;


import {SimpleStorage} from "./simpleStorage.sol";

contract AddFiveStorage is SimpleStorage {

    // +5

    // virtual override
    // use virtual in the base class to make the method overridable

    function store(uint256 _newNumber) public override {

        myFavNum = _newNumber + 5;
    }

}