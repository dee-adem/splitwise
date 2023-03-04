/pragma solidity ^0.5.0;
contract Splitwise{

//mapping to capture balances 
    mapping(address => mapping (address => int32)) public debts;
    address[] public Users;
    
    //function to insert address and amount
    //function  lookup to return the amount debtors owes the creditor
    function lookup(address debtor, address creditor) public view returns (int32 ret){
    ret = debts[debtor][creditor];
    }

//function add_IOU informs the contract msg.sender now owes amount more money to the creditor
function add_IOU(address creditor, int32 amount) public{
    addDebt(msg.sender, creditor, amount);
}

//function increase only adds positive amount
function addDebt(address debtor, address creditor, int32 amount) public{
    debts[debtor][creditor] += amount;
addtoUsers(creditor);
addtoUsers(debtor);
}
function addtoUsers(address add) private{
    for (uint i = 0; i < Users.length; i++){
        if (Users [i] == add)
        return;
    }
    

     Users.push(add);
      
}
}
// Please paste your contract's solidity code here
// Note that writing a contract here WILL NOT deploy it and allow you to access it from your client
// You should write and develop your contract in Remix and then, before submitting, copy and paste it here
