// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./ERC721A.sol";
import "./ERC721AQueryable.sol";
import "./ERC721ABurnable.sol";

contract BBKIsERC721A is ERC721A, ERC721AQueryable, ERC721ABurnable {

    constructor() ERC721A("Ben BK NFT", "BBKNFT") {}

    function mint(uint256 quantity) external payable {
        _safeMint(msg.sender, quantity);
    }

}