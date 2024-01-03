// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "./@openzeppelin/contracts/utils/Counters.sol";

contract NFT is ERC721URIStorage {
using Counters for Counters.Counter;
Counters.Counter private _tokenIds;
address marketplaceContract;
event NFTMinted(uint256);

constructor(address _marketplaceContract) ERC721("MyToken", "MTKN") {
    marketplaceContract = _marketplaceContract;
}

function mint(string memory _tokenURI) public {
    uint256 newTokenId = _tokenIds.current();
    _tokenIds.increment();
    _safeMint(msg.sender, newTokenId);
    _setTokenURI(newTokenId, _tokenURI);
    setApprovalForAll(marketplaceContract, true);
    emit NFTMinted(newTokenId);
}

function getCurrentToken() public view returns (uint256) {
    return _tokenIds.current();
}
}
