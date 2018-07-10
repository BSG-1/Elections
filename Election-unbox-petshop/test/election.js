/* simulating client side tests with mocha & chai */

//require the smart contract
var Election = artifacts.require("./Election.sol");

//declare the contract --> injects all the accounts that exist in our testing environment
contract("Election", function (accounts) {

    var electionInstance;

    //check to make sure contract was initialized with the correct number of candidates(should be 2)
    it("initializes with two candidates", function () {
        return Election.deployed().then(function (instance) {
            return instance.candidatesCount();
        }).then(function (count) {
            assert.equal(count, 2);
        });
    });

    //do the candidates contain the correctly mapped info?
    it("initializes the candidates with the correct values", function () {
        return Election.deployed().then(function (instance) {
            electionInstance = instance;
            return electionInstance.candidates(1);
        }).then(function (candidate) {
            assert.equal(candidate[0], 1, "contains the correct id");
            assert.equal(candidate[1], "BSG", "contains the correct name");
            assert.equal(candidate[2], 0, "contains the correct vote count");
            return electionInstance.candidates(2);
        }).then(function (candidate) {
            assert.equal(candidate[0], 2, "contains the correct id");
            assert.equal(candidate[1], "SSG", "contains the correct name");
            assert.equal(candidate[2], 0, "contains the correct votes count");
        });
    });
});