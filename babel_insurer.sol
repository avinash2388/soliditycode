pragma solidity ^0.4.17;
contract mortal{

	address public owner;

	function mortal() public{

		owner = msg.sender;

	}


}


contract User is mortal{

	string public userName;

	mapping(address=>Service) public services;

	struct Service{
		bool active;
		uint256 due;
	}

	function User(string _name) public{

		userName = _name;


	}
	/*This function will be used to register to insurer and status will be updated as active*/
	function registerToinsurer(address _insurerAddress) public {

		services[_insurerAddress] = Service({
			active: true,
			due: 0
			});

	}
	/*This fuction will be used by insurer to set the due amount to any user and it will reflect in his acount*/
	function setDue(uint256 _due) public{
		if(services[msg.sender].active){
	
			services[msg.sender].due = _due;

		}
	}
	/*This function will be used to pay the due premium to insurer*/
	function payToinsurer(address _insurerAddress) public{
		_insurerAddress.transfer((services[_insurerAddress].due));

	}


}

contract Insurer is mortal{

	string public insurerName;
	string public description;

	function Provider(
		string _name,
		string _description)public{

		insurerName = _name;
		description  = _description;

	}

	function setdue(uint256 _due, address _userAddress) public{

		User person = User(_userAddress);
		person.setDue(_due);

	}


}
