let R = await Roulette.deployed();

console.log("Положим на баланс 2 eth")
console.log(R.AddToContractBalance({value: web3.utils.toWei('2', 'ether'), from: accounts[0]}))

console.log("0.5 eth на красное с аккауната accounts[1]")
сonsole.log(R.Red({value: web3.utils.toWei('0.5', 'ether'), from: accounts[1]}))

console.log("Вывод денег с аккаунта администратора.")
console.log(R.WithdrawFromContractBalance(web3.utils.toWei('0.5', 'ether')))

console.log("Игра на сумму больше чем баланс контракта")
console.log(R.Red({value: web3.utils.toWei('2', 'ether'), from: accounts[1]}))
    
    // truffle(development)> let test = await Roulette.deployed()
    // undefined
    // truffle(development)> test.addToContract({value: web3.utils.toWei('2', 'ether'), from: accounts[0]})