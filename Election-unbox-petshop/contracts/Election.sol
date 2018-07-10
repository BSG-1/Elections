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
        //addCandidates get called when migrated and deployed;
        addCandidate("BSG");
        addCandidate("SSG");
    }

    function addCandidate (string _name) private {
        //adds 1 to whatever number previously existed in the candidate's account; want it to represent the ID of the candidate that we're creating in this function
        candidatesCount ++; 
        //here we access the 'candidates' variable that was created in the mapping function previously declared, and pass it the ID (candidatesCount) which was just increment; we then assign the value to the new Candidate, passing it an id of candidatesCount, a name, and an initial value of 0 vote counts
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        //increase votecount of candidate that we want to vote for by reading the candidate out of the mapping function, and then increasing the voteCount variable out of the Canddiate Struct. 
        //candidateId will be the uint key that was used in the candidates mapping that will RETURN a Candidate Struct
        candidates[_candidateId] 
    }

}