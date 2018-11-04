pragma solidity 0.4.24;

contract Election {
    //modelling a candidate
    struct Candidate {
    	uint id;
    	string name;
    	uint voteCount; 
    }
    //store candidates
    mapping (uint => Candidate) public candidates;
    //store voters that have voted
    mapping (address => bool) public voters;
    function vote (uint _candidateId) public{
        //required that they have not voted before
        require(!voters[msg.sender]);
        // check if candidate is valid
        require(_candidateId>0 && _candidateId <= candidatesCount);
        //record that a voter has voted
        voters[msg.sender] = true;
        //update votes count
        candidates[_candidateId].voteCount ++;
    }
    
    // store candidates count
    uint public candidatesCount;
    // Constructor
    constructor () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate (string _name) private {
    	candidatesCount++;
    	candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
	}

}