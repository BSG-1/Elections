//artifacts represents an election artifact that represents our contract and truffle can interact with it
var Election = artifacts.require("./Election.sol");

module.exports = function (deployer) {
    deployer.deploy(Election);
};
