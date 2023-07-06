// SPDX-License-Identifier: MIT
pragma solidity >=0.8.18 <0.9.0; //solidity version

contract CLientsStorage {
    
    struct Client {
        // bytes32 avatar;
        string userName;
        uint256 ageClient;
        uint256 phoneClient;
        uint256 scoreClient;
        // address clientWallet;
        // bool premium;
    }

    uint256 _i;

    address[] whiteList;
    mapping(uint256 => Client) public listOfClients;

    function addNewClient(string memory _userName, uint256 _ageClient, uint256 _phoneClient) public {
        listOfClients[_i].userName = setUserName(_i, _userName);
        listOfClients[_i].ageClient = setAgeClient(_i, _ageClient);
        listOfClients[_i].phoneClient = setPhoneClient(_i, _phoneClient);
        _i ++;
    }

    function setUserName(uint256 _index, string memory _name) private returns(string memory) {
        updateScoreClient(_index);
        string memory userName = _name;
        return userName;
    }

    function setAgeClient(uint256 _index, uint256 _age) private returns(uint256) {
        updateScoreClient(_index);
        uint256 ageClient = _age;
        return ageClient;
    }

    function setPhoneClient(uint256 _index, uint256 _phone) private returns(uint256) {
        updateScoreClient(_index);
        uint256 phoneClient = _phone;
        return phoneClient;
    }

    function updateScoreClient(uint256 _index) private {
        listOfClients[_index].scoreClient = retrieveScore(_index) + 10;
    }

    function retrieveScore(uint256 _index) internal view returns(uint256) {
        return listOfClients[_index].scoreClient;
    }

    function deleteScore(uint256 _index) public {
        listOfClients[_index].scoreClient = 0;
    }

}