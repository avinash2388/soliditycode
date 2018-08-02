pragma solidity 0.4.24;

contract Coin {

    
    address public minter; // a getter function shall be automatically provided to us to query its value
    
    mapping (address => uint) public balances; 
    
    event Sent(address indexed from, address indexed to, uint amount); // you can't have a parameter of array of string
    event CoinMinted (address indexed to, uint indexed amount ) ; //can't put indexed in from of string 
    
    
    
    constructor() public {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        if (msg.sender != minter) return; // this function can only be accessed by minter
        balances[receiver] += amount;
        emit CoinMinted(receiver, amount);
    }

    function send(address receiver, uint amount) public {
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        
        emit Sent(msg.sender, receiver, amount); // logging mechanism - 
    }
    
}