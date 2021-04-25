var Calculator = artifacts.require("Calculator");

module.exports = function(done) {
console.log("Start testind Calculator")  
Calculator.deployed().then(function(instance) {
    console.log("Test Calculator.Calculator function");
    instance.Add(2, 2).then(function(result)
    {
        console.log(result.tx)
        done();
    });
})
};