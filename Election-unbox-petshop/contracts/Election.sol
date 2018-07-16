//solidity v0.4.2
pragma solidity ^0.4.2;

contract Election {
    //Model a candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    //store accounst that have voted
    mapping(address => bool) public voters;
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
        /*
        1. Record that a voter has voted (1 time, 1 vote) 
            a) how do we even know which account is voting when you call the vote function? Solidity gives us the account via who is doing the calling (msg.sender --> account from which voter is voting).
        */
        require(!voters[msg.sender]);

        /*
        2. increase votecount of candidate that we want to vote for (a valid candidate) by reading the candidate out of the mapping function, and then increasing the voteCount variable out of the Canddiate Struct. 
            a) candidateId will be the uint key that was used in the candidates mapping that will RETURN a Candidate Struct
        */
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        //record that voter has voted
        voters[msg.sender] = true; //ref the voters mapping and reading the account that has sent the vote, and then setting the value to true to show that it has in fact voted 

        //update candidate vote Count
        candidates[_candidateId].voteCount++;
    }

}