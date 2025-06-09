import {SimpleStorage} from "./simpleStorage.sol";

// SPDX-License-Identifier: MIT

pragma solidity >=0.8.30 <0.9.0;



contract StorageFactory {

    SimpleStorage[] public listSimpleStorage;



    function createSimpleStorageContract () public {

        listSimpleStorage.push(new SimpleStorage());  // array of contract -> this will return address)
    }

    function sfStore (uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        //2 things we need, the address (stored in the list), and the ABI - Application Binary Interface
        listSimpleStorage[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){
        return listSimpleStorage[_simpleStorageIndex].getFavNum();
    }
}