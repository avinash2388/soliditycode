pragma solidity ^0.4.24;

interface Token {
  function transfer(address _to, uint256 _value) external returns (bool);
  function transferFrom(address from, address to, uint256 value) external returns (bool);
 
}

contract AirDrop  {

    
    
  function multisend(Token token, address[] _recipient, uint256 _value) external  {
          
    for(uint256 i = 0; i < _recipient.length; i++ )
          token.transferFrom(msg.sender, _recipient[i], _value);
           
        
  }  
  

}
