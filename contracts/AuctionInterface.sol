pragma solidity ^0.4.19;


/** @title AuctionInterface */
contract AuctionInterface {
    address highestBidder;
    uint highestBid;
    function bid() external payable returns (bool);
    function reduceBid() external;
    
    function getHighestBidder() public view returns (address) {
        return highestBidder;
    }
    
    function getHighestBid() public view returns (uint) {
        return highestBid;
    }
}
