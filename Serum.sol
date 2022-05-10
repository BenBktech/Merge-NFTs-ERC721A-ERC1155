// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Burnable.sol";

contract Serum is ERC1155, Ownable, ERC1155Burnable {
    uint serumId = 1;

    uint private constant MAX_SERUM_PER_ADDRESS = 1;
    mapping(address => uint) serumPerAddress;
    
    mapping(address => uint) public serumIdsToUser;
    
    constructor() ERC1155("") {}

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, bytes memory data) public
    {
        require(serumPerAddress[msg.sender] == 0, "You already have a Serum");
        _mint(account, serumId, 1, data);
        serumPerAddress[msg.sender]++;
        serumIdsToUser[msg.sender] = serumId;
        serumId++;
    }
}