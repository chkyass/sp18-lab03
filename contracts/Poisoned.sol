pragma solidity ^0.4.19;

import "./AuctionInterface.sol";

/** @title Poisoned */
contract Poisoned {

    address target;

	/* Constructor */
    function Poisoned() payable {}

	/* Bid function */
    function bid(uint amount) external {
        if ((amount <= address(this).balance) && (target != address(0))) {
            AuctionInterface _target = AuctionInterface(target);
            _target.bid.value(amount)();
        }
    }

    function reduceBid() external {
        if (target != address(0)) {
            AuctionInterface _target = AuctionInterface(target);
            _target.reduceBid();
        }
    }

    function setTarget(address auction) external {
        if (auction != address(this)) {
            target = auction;
        }
    }

    function getTarget() view returns (address) {
        return target;
    }

    function getBalance() view returns (uint) {
        return address(this).balance;
    }

    function() {}
}
