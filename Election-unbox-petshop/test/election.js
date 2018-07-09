/* simulating client side tests with mocha & chai */

//require the smart contract
var Election = artifacts.require("./Election.sol");

//declare the contract --> injects all the accounts that exist in our testing environment
contract("Election", function (accounts) {

    //check to make sure contract was initialized with the correct number of candidates(should be 2)
    it("initializes with two candidates", function () {
        return Election.deployed().then(function (instance) {
            return instance.candidatesCount();
        }).then(function (count) {
            assert.equal(count, 2);
        });
    });
});