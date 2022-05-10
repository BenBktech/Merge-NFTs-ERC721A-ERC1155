// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./ERC721A.sol";
import "./ERC721AQueryable.sol";
import "./BBKIsERC721A.sol";
import "./Serum.sol";

contract BBKIsERC721A2 is ERC721A, ERC721AQueryable {

    BBKIsERC721A nft;
    Serum serum;

    constructor(BBKIsERC721A _nft, Serum _serum) ERC721A("Ben BK NFT 2", "BBKNFT2") {
        nft = _nft;
        serum = _serum;
    }

    function mint(uint nftId, uint serumId) external payable {
        require(nft.ownerOf(nftId) == msg.sender, "Not the owner");
        require(serum.balanceOf(msg.sender, serumId) == 1, "You don't have a Serum");
        _safeMint(msg.sender, 1);
        nft.burn(nftId);
        serum.burn(msg.sender, serumId, 1);
    }

}