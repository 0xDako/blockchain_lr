var Roulette = artifacts.require("TokenERC20");

module.exports = function(done) {

console.log("Start testind TokenERC20")  

TokenERC20.deployed().then(function(instance) {
    instance._transfer('0x91abA0aD6F65CD3611b09e5C8f42c67Ee5b87d75', '0xd1253f9602eDd5c0a5E07f1e2D83a1EC48aDab7e', 1).then((result)=>
    {
        done();
    })
})
};