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
    uint public candidatesCount; //counter-cache --> this is done bc the mapping does not specify the exact count of how many candidates there are. Therefore, in order to make sure that each candidate gets their respective struct, and no default false values are rendered, a coutner cache is needed


    //constructor run upon migration
    function Election () public {
    
    }

    function addCandidate (string _name) private {
        candidatesCount ++; 
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}