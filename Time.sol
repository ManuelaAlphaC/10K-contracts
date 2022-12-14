// SPDX-License-Identifier: MIT

pragma solidity 0.8.17;

contract Time {
    uint256 _seconds = 30 seconds; // 30
    uint256 _minutes = 5 minutes; // 5*60
    uint256 _hours = 1 hours; // 1*60*60
    uint256 _days = 2 days; // 2*24*60*60
    uint256 _weeks = 1 weeks; // 1*7*24*60*60
    uint256 _years = 365 days; // 356*24*60*60
                    
    uint256 today = 1669831200; // 2022-11-30 18:00:00
    uint256 tomorow = 1701453600; // 2023-12-01 18:00:00

    /*
     * ora corrente in diversi parti del mondo
    */
    function Kyiv() public view returns(uint256, string memory){
        uint256 itIs = ((block.timestamp + 3 hours) - (block.timestamp + 1 hours))/ 60 / 60;
        return (itIs, "hours");
    }

    function Mosca() public view returns(uint256, string memory){
        uint256 itIs = ((block.timestamp + 4 hours) - (block.timestamp + 1 hours))/ 60 / 60;
        return (itIs, "hours");
    }

    function NewYork() public view returns(string memory,uint256, string memory){
        uint256 itIs = ((block.timestamp + 1 hours) - (block.timestamp - 4 hours))/ 60 / 60;
        return ("-", itIs, "hours");
    }

    function Cina() public view returns(uint256, string memory){
        uint256 itIs = ((block.timestamp + 10 hours) - (block.timestamp + 1 hours))/ 60 / 60;
        return (itIs, "hours");
    }

    function Giappone() public view returns(uint256, string memory){
        uint256 itIs = ((block.timestamp + 9 hours) - (block.timestamp + 1 hours))/ 60 / 60;
        return (itIs, "hours");
    }

    /*
     * differenza tra due date, risultato in giorni
    */
    function diference(uint256 first, uint256 second) public pure returns(uint256, string memory) {
        uint256 diff = (first-second)/60/60/24;
        return (diff, "days");
    }

    /*
     * confronto tra due date
    */
    function confront(uint256 time1, uint256 time2) public pure returns(bool){
        if(time1 > time2) return true;
        return false;
    }

    /*
     * la data è trascorsa?
     * il block.timestamp è un'ora indietro rispetto all'ora italiana
    */
    function timePassed(uint256 finishTime) public view returns(bool){
        return ((block.timestamp + 1 hours) >=(finishTime));
    }

    /*
     * il tempo correntein Italia
    */
    function nowIs() public view returns(uint256){
        return block.timestamp + 1 hours;
    }

}
