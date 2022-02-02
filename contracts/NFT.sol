//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/utils/Counters.sol";

contract NFT is ERC721URIStorage{
    // Auto incrementation of tokenid
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;

    // Address of the NFT marketplace contract
    address contractAddress;

    constructor(address marketPlaceAddress) ERC721("Biryani Tokens","BIR){
        contractAddress = marketPlaceAddress;
    }

    /// @dev Create a new NFT token
    /// @param tokenURI: the token uri
    function createToken(string memory) public returns(uint256)  {
        // set a mew token id for the token to be minted
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        setApprovalForAll(contractAddress, true);
        return newItemId;
        
    }

}



