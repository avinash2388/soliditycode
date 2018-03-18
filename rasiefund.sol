pragma solidity ^0.4.17;

contract RaiseFundsForACause {

  
    uint256  numPayments;
    
    uint256  totalAmountRaised;
    
    mapping(address => uint256) donationData;
    mapping (address => uint256) balanceOf;

    /* Initializes contract with initial supply tokens to the creator of the contract */
   /* function RaiseFundsForACause() public {
        balanceOf[msg.sender] = msg.value;              // Give the creator all initial tokens
    }
    */
    
    struct projectDet  {
        
        string projectTitle;
        string projectDescription;
        uint256 projectGoal;
        string  status;
        
    }
    
    mapping (address => projectDet) public projectDetails;
    address[]  projectAcctsList;

  
    function addProject(string _projectTitle ,string _projectDescription ,uint256 _projectGoal) public {
     
        projectDetails[msg.sender].projectTitle = _projectTitle;
        projectDetails[msg.sender].projectDescription= _projectDescription;
        projectDetails[msg.sender].projectGoal = _projectGoal;
        projectDetails[msg.sender].status = 'open';
        projectAcctsList.push(msg.sender) -1;
    }

    
    
    function projectAccountList() view public returns(address[]) {
       return projectAcctsList;
    //    projectDetails[projectAccts[1]].projectTitle;
    }
    
    

  
    function transfer(address _receiever, uint256 _amount) public payable {
       // require(balanceOf[msg.sender] >= _value);           // Check if the sender has enough
      //  balanceOf[msg.sender] -= _value;                    // Subtract from the sender
      //  balanceOf[_to] += _value;                           // Add the same to the recipient
      if(msg.sender.balance > _amount){
       _receiever.transfer(_amount);
      }
    }


}