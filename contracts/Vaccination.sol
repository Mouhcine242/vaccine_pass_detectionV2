pragma solidity >=0.4.22 <0.9.0;


contract Vaccination{

    uint public nbOwners ;

    struct Owner{

        uint256 id ;
        string CIN ;
        string FullName ;
        string qrHash ;
        string vaccine_name;
        uint nb_shots ;

    }


    
    Owner[] public owners ; // list des owners contient toutes les owners légitimes du passe vaccinale


    Owner owner1 = Owner(1 , "A1234" ,  "Reda foo" , "Reda foo", "senofarm" , 2 );
    Owner owner2 = Owner(2 , "B1234" ,  "Ayoub noo" , "Ayoub noo" , "senofarm" , 2 );
    Owner owner3 = Owner(3 , "GA345" , "Sara loo"  , "Sara loo", "senofarm" , 2 );
    Owner owner4 = Owner(4 , "C3456" , "Yahya soo"  ,"Yahya soo" , "senofarm" , 2 );
    Owner owner5 = Owner(5 , "D3456" , "Hiba lbassla" ,"Hiba lbassla" , "senofarm" , 2 );
   


    constructor() public {

        nbOwners = 0;
    }

    event OwnerAdded(uint256 _id);
    event OwnerVerified(uint _id);
    event OwnerDeleted(uint _id);


    function addOwner(string memory _cin , string memory _fullName , string memory _qrhash , string memory _nameOfvaccine, uint _nbOfshots) public {

        owners[nbOwners] = Owner(nbOwners , _cin , _fullName , _qrhash , _nameOfvaccine , _nbOfshots);
        emit OwnerAdded(nbOwners);

        nbOwners++; 

    }

    function deleteOwner(uint256 _id) public{
        delete owners[_id];
        emit OwnerDeleted(_id);
        nbOwners--;

    }

    function verifyOwner(string memory qr) public returns(bool ){

        owners.push(owner1);
        owners.push(owner2);
        owners.push(owner3);
        owners.push(owner4);
        owners.push(owner5);

        for(uint i=0 ; i< owners.length ; i+=1){
            if(keccak256(abi.encodePacked(owners[i].qrHash)) == keccak256(abi.encodePacked(qr))){
                return true;
            }
            return false ;
            

        } 
    }

}