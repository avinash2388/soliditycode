pragma solidity ^0.4.24;

interface Token {
  function transfer(address _to, uint256 _value) external returns (bool);
  function balanceOf(address _owner) external constant returns (uint256 balance);
}

contract AirDrop  {

  Token token;
 
  function multisend(address _tokenAddr, address[] _recipient, uint256 _value)  external {
    
   // token = Token(_tokenAddr);
    for (uint256 i = 0; i < _recipient.length; i++) {
        
        if(Token(_tokenAddr).balanceOf(msg.sender) >= _value) {
           Token(_tokenAddr).transfer(_recipient[i], _value);
           
        } 
          
        } 
  }  
  

}
