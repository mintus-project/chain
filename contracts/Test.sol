//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Test {
    string private hashcode;

    struct Record {
        string avatar;
        string username;
        string domain;
        string addr;
    }

    mapping(address => Record) public records;

    constructor(string memory _hashcode) {
        console.log("Deploying a Test with hashcode:", _hashcode);
        hashcode = _hashcode;
    }

    function regist(string memory _avatar, string memory _username, string memory _domain, string memory _addr) public {
        records[msg.sender].avatar = _avatar;
        records[msg.sender].username = _username;
        records[msg.sender].domain = _domain;
        records[msg.sender].addr = _addr;
    }

    function getRecord(address owner) public view returns (string memory _avatar, string memory _username, string memory _domain, string memory _addr) {
        _avatar = records[owner].avatar;
        _username = records[owner].username;
        _domain = records[owner].domain;
        _addr = records[owner].addr;
    }

    function setDomain(string memory _domain) public {
        console.log("Input is '%s'", _domain);
        records[msg.sender].domain = _domain;
    }

    function setAddr(string memory _addr) public {
        console.log("Input is '%s'", _addr);
        records[msg.sender].addr = _addr;
    }
}
