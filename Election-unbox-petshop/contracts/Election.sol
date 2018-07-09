pragma solidity ^0.4.2;

contract Election {
    //Model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    //store candidates
    //fetch candidates by ID from storage 
     //*mappings are associative arrays that help assign key value pairs */
    mapping (uint => Candidate) public candidates;
    //keep track of vote counts for candidates
    //store candidates count
    uint public candidatesCount; //counter-cache

    //constructor run upon migration
    function Election () public {
        candidate = "BSG1"; //this is a state variable, accessible to all of contract
    
    }
}