pragma solidity ^0.4.17;

contract Campaign {
    struct Request{
        string description;
        uint value;
        address recipient;
        bool complete;
        
    }
    address public manager;
    uint public minimumContribution;
    address [] public approvers;
    Request [] public requests;
     modifier restricted(){
        require(msg.sender == manager);
        _;
    }
    function Campaign(uint minimum) public{
        manager = msg.sender;
        minimumContribution = minimum;
    }
    // mapping:collection of key value pairs.Same as js objects.but all key and value of the same type.
    //struct : collection of key value pairs that can have different types.
    // modifier is a function use to restrict the un authenticated user to access or run operations
    // storage and memory (Some times references where our contract store data)(Some times reference how our solidity variables store values)
    // storage and memory are data holding places. Storage are holds data b/w fumction cals same as hard drive.Memory Tmporary places to store data.RAm like
    // every contract variable store in the storage area,argument variable are like a memory
    function contribute() public payable{
        require(msg.value >minimumContribution);
        approvers.push(msg.sender);
    }
    
    function createRequest(string description,uint value,address recipient) public restricted{
        Request memory newRequest = Request({
            description:description,
            value:value,
            recipient:recipient,
            complete:false
            
        });
        requests.push(newRequest);
    }
}