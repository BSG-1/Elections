pragma solidity ^0.4.2;

contract Election {
    //Model a candidate
    //store candidates
    //fetch candidates by ID
    //keep track of vote counts for candidates

    //constructor run upon migration
    function Election () public {
        candidate = "BSG1"; //this is a state variable, accessible to all of contract
    }
}