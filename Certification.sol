pragma solidity ^0.5.2;


contract myCertification{
    
    struct product{
        bool stored;
        address sender;
        string ownerFullName;
        string ownerGender;
        string ownerState;
        string ownerCountry;
        string productType;
        string productFormat;
        uint numOfTracks;
    }

    mapping(string => product) internal products;

    event productEvent(string hash);
    
    ///@dev Adds a new record to the blockchain containing all product attributes. 
    ///@param hash An unique hash based on all product attributes. Should be encrypted externally.
    ///@param ownerFullName The full name of the product owner.
    ///@param ownerGender The Gender of owner.
    ///@param ownerState The state of owner.
    ///@param ownerCountry The country of owner lives in.
    ///@param productType Type of the product owner wants to register.
    ///@param productFormat Format of the product owner wants to reister.
//    ///@param numOfTracks number of tracks in the owners product.
    
    function addProduct(string storage hash, 
                     string storage ownerFullName, 
                     string storage ownerGender, 
                     string storage ownerState, 
                     string storage ownerCountry, 
                     string storage productType, 
                     string storage productFormat,
                     uint   numOfTracks) 
    internal{
        
        require(bytes(hash).length > 0);
        require(bytes(ownerFullName).length > 0);
        require(numOfTracks > 0);
        
        products[hash].stored = true;
        products[hash].sender = msg.sender;
        products[hash].ownerFullName = ownerFullName;
        products[hash].ownerGender = ownerGender;
        products[hash].ownerState = ownerState;
        products[hash].ownerCountry = ownerCountry;
        products[hash].productType = productType;
        products[hash].productFormat = productFormat;    
        products[hash].numOfTracks = numOfTracks;    
    }
    
    ///@dev Checks if the product has already been added to the blockchain. 
    ///@param hash An unique hash based on all product attributes. Should be encrypted externally.
    ///@param ownerFullName The full name of the product owner.
    ///@param ownerGender Gender of product owner
    ///@param ownerState State where product owner lives.
    ///@param ownerCountry Country where product owner lives.
    ///@param productType Type of the prduct owner want to register.
    ///@param productFormat Format of the product owner want to register.
    ///@param numOfTracks number of tracks in the product.
    
    function newProduct(string calldata hash, 
                     string calldata  ownerFullName,
                     string calldata ownerGender, 
                     string calldata ownerState,
                     string calldata ownerCountry, 
                     string calldata productType, 
                     string calldata productFormat,
                     uint  numOfTracks)
    external 
    returns(string memory result){
    
        if(products[hash].stored){

            result = "Hash is already registered.";

        } else {

            addProduct(hash, ownerFullName, ownerGender, ownerState, ownerCountry, productType, productFormat, numOfTracks);
                        
            emit productEvent(hash);
            
            result = "Product registered successfully";

        }
        
        return result;
    }
    
    ///@dev Displays product data based on their unique hash.
    ///@param hash An unique hash based on all product attributes. Should be encrypted externally.
       
    function getProduct(string calldata hash)
    external 
    view 
    returns(string memory result,
            string memory ownerFullName, 
            string memory ownerGender, 
            string memory ownerState, 
            string memory ownerCountry, 
            string memory productType, 
            string memory productFormat,
            uint numOfTracks){

        if(products[hash].stored){
            result = "Product record found.";
        }else{
            result = "Product not found.";
}

        
        return(result,
               products[hash].ownerFullName,
               products[hash].ownerGender, 
               products[hash].ownerState,
               products[hash].ownerCountry, 
               products[hash].productType, 
               products[hash].productFormat,
               products[hash].numOfTracks);

    }
    
   
    
}

   

