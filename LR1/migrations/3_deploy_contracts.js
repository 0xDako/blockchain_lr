var Calculator = artifacts.require("Calculator");
var Arg = "Hello world";
module.exports = deployer => {
    deployer.deploy(Calculator, Arg);
};
    