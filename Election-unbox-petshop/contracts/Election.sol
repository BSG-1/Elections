pragma solidity ^0.4.11;

contract Election {
    //Store the candidate
    //Read the candidate name
    string public candidate;
    //constructor run upon migration
    function Election () public {
        candidate = "BSG"; //this is a state variable, accessible to all of contract
    }
}