//SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

contract Whitelist {

    uint public maxAddressesWhitelisted;
    uint public numAddressesWhitelisted; //used to keep track of how many addresses have been whitelisted

    mapping(address => bool) public whitelist;

    constructor(uint _maxAddressesWhitelisted){
        maxAddressesWhitelisted = _maxAddressesWhitelisted;
    }

    /**
        addAddressToWhitelist - This function adds the address of the sender to thewhitelist
     */
    function addAddressToWhitelist() public {
        require(!whitelist[msg.sender], "Address already whitelisted");
        require(numAddressesWhitelisted < maxAddressesWhitelisted, "Cannot add address, max reached");
        whitelist[msg.sender] = true;
        numAddressesWhitelisted++;
    }
}