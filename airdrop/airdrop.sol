contract Ownable {

  address public owner;

  function Ownable() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == owner);
    _;
  }

}

interface Token {
  function transfer(address _to, uint256 _value) external returns (bool);
  function balanceOf(address _owner) external constant returns (uint256 balance);
}

contract AirDrop is Ownable {

  Token token;

    
  function multisend(address _tokenAddr, address[] _recipient, uint256 _value)  onlyOwner external {
    
    token = Token(_tokenAddr);
    for (uint256 i = 0; i < _recipient.length; i++) {
        
        if(token.balanceOf(_tokenAddr) >= _value) {
           token.transfer(_recipient[i], _value);
           
        } 
          
        } 
  }  

}
