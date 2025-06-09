// SPDX-License-Identifier: MIT

//EVM compatible blockchains and L2 --> ETH, polygon, arbitrum, optimism 
pragma solidity >=0.8.30 <0.9.0; // specify version each time

contract SimpleStorage { // every single contract has its own address 0xd9145CCE52D386f254917e481eB44e9943F39138
    
    // basic types : bool, uint, int, address, bytes, string
    
    uint256 myFavNum; //default = 0 and internal !=private, there's public --> creates a getter, private, external, internal
    //address myAdress = 0xCF1B79BcF9Abf01c23884325451D1043eBE89856;
    //bytes32 favoriteBytes32 = "cat"; //strings are bytes so easily convertable

    //uint256[] listFavNums;

    struct Person{
        uint256 favNum;
        string name;
    }

    //dynamic array (can grow and shrink)
    Person[] public listOfPeople; //[]

    //dictionnary
    mapping(string => uint256) public dictPerson;

    //static array
    //Person[3] public listOfPeople; //[]


    // Person public Nicholas = Person({favNum: 20, name: "Nicholas"});
    // Person public Theo = Person({favNum: 21, name: "Theo"});


    //isn't reading but is rather changing the state of the block chain
    // virtual makes the function overridable
    function store(uint256 _favNum) public virtual {

        myFavNum = _favNum;
        getFavNum(); //costs more gas
        
    }

    //anytime we do anything that modifies anything on the block chain, like deploying a contract, it is done through a contract and therefore uses gas
    //spend gas a) deploying the contract b) calling the functions


    //view, pure --> read-only, can't change state, reads state so doesn't need to call a transaction
    //pure is to return a literal, not a variable
    function getFavNum() public view returns (uint256){
        //favNum += 1; returns TypeError: Function cannot be declared as view because this expression (potentially) modifies the state.

        return myFavNum;
        
    }

    //calldata, memory, storage
    //calldata + memory --> data will only exist for the function call (params), temp vars, only need to specify for strings, arrays cause special type of variable
    //calldata --> temp and immutable
    //memory --> temp and mutable, allows you to do math on state
    //storage --> perm and mutable
    function addPerson(uint256 _age, string memory _name) public{

        listOfPeople.push(Person(_age, _name));
        dictPerson[_name] = _age;
    }

    //functions that are blue are functions that we can call without needing to call a transactions
    //but if another contract that does cost gas does call it, it'll cost gas
}
 