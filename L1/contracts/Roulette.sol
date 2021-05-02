// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;



contract Roulette {
    
    address payable public owner_address;
    address payable public last_player_address;
    address payable public contract_address;
    uint256 public last_win_num;

    uint16[] public red_number = [0,1,0,1,0,1,0,1,0,1,0,0,1,0,1,0,1,0,1,1,0,1,0,1,0,1,0,1,0,0,1,0,1,0,1,0,1];

    modifier owner_only() { 
      require(msg.sender == owner_address, "error-only-owner"); 
      _;
    }

    modifier balance_check(uint16 multiplier)
    {
        require(contract_address.balance > msg.value*multiplier, "not-enough-eth");
        _;
    }

    constructor() {
        contract_address = payable(address(this));
        owner_address = payable(msg.sender);
    }


    function transfer_to(address payable to, uint256 value) private 
    {
        to.transfer(value);
    }

    function AddToContractBalance() payable public owner_only returns(string memory)
    {
        return ("Add successfully");
    }

    function WithdrawFromContractBalance(uint256 value) payable public owner_only returns(string memory)
    {
        if(contract_address.balance >= value)
        {
            owner_address.transfer(value);
            return ("Withdraw successfully"); 
        }
        else
        {
            return ("Not enough eth"); 
        }
    }

    function ChangeOwner() public owner_only{
        owner_address = payable(msg.sender);
    }

    function random() private view returns (uint256) {
        uint256 rnd = uint256(keccak256(abi.encodePacked(block.timestamp)));
        return (rnd % 37); 
    }


    function Red() public payable balance_check(2) returns(string memory){             

        last_player_address = payable(msg.sender);
        last_win_num = random();

         if(red_number[last_win_num] == 1){
            transfer_to(payable(msg.sender), msg.value*2);
            return "You won! Congratulations!";
        }
        return "You lose. Try again.";
    }
    function Black() public payable balance_check(2) returns(string memory){             

        last_player_address = payable(msg.sender);
        last_win_num = random();

        if(red_number[last_win_num] == 0 && last_win_num != 0){
            transfer_to(payable(msg.sender), msg.value*2);
            return "You won! Congratulations!";
        }
        return "You lose. Try again.";
    }

    function BetOnNumber(uint16 number) public payable balance_check(35) returns(string memory){
        last_player_address = payable(msg.sender);
        last_win_num = random();   

        if(last_win_num == number){
            transfer_to(payable(msg.sender), msg.value*35);
            return "You won! Congratulations!";
        }
        return "You lose. Try again.";
    }
    
    function LowerHalf() public payable balance_check(2) returns(string memory){
        last_player_address = payable(msg.sender);
        last_win_num = random();
        if (last_win_num <= 18 &&  last_win_num !=0) {
            transfer_to(payable(msg.sender), msg.value*2);
            return "You won! Congratulations!";
        }
        return "You lose. Try again.";
    }

    function UpperHalf() public payable balance_check(2) returns(string memory){
        last_player_address = payable(msg.sender);
        last_win_num = random();
        if (last_win_num >= 19 ) {
            transfer_to(payable(msg.sender), msg.value*2);
            return "You won! Congratulations!";
        }
        return "You lose. Try again.";
    }

    function Odd() public payable balance_check(2) returns(string memory){

        last_player_address = payable(msg.sender);
        last_win_num = random();
        if (last_win_num % 2 == 0 && last_win_num != 0)
        {
            transfer_to(payable(msg.sender), msg.value*2);
            return "You won! Congratulations!";
        }
        return "You lose. Try again.";
    }

    function NoOdd() public payable balance_check(2) returns(string memory){

        last_player_address = payable(msg.sender);
        last_win_num = random();
        if (last_win_num % 2 == 1)
        {
            transfer_to(payable(msg.sender), msg.value*2);
            return "You won! Congratulations!";
        }
        return "You lose. Try again.";
    }

}
