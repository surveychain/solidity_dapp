pragma solidity ^0.4.21;

contract SimpleSurvey {
    mapping(address => uint8[]) surveyMap;
    address[] surveyMemberList;
    address surveyOwner;

    function SimpleSurvey() public payable {
        surveyOwner = msg.sender;
    }
    
    function setSurveyResult(uint8 q_count, uint8 q1, uint8 q2, uint8 q3, uint8 q4, uint8 q5) public returns (bool) {
        uint i = 0;
        for (i = 0; i < surveyMemberList.length; i++) {
            if (surveyMemberList[i] == msg.sender) {
                return false;
            }
        }
        surveyMemberList.push(msg.sender);

        for (i = 0; i < q_count; i++) {
            uint8 q = 0;
            if (i == 0) {
                q = q1;
            } else if (i == 1) {
                q = q2;
            } else if (i == 2) {
                q = q3;
            } else if (i == 3) {
                q = q4;
            } else if (i == 4) {
                q = q5;
            }
            surveyMap[msg.sender].push(q);
        }

        return true;
    }

    function getSurveyCount() public constant returns (uint) {
        return surveyMemberList.length;
    }

    function getSurveyMemberList() public constant returns (address[]) {
        return surveyMemberList;
    }

    function getSurveyResult(address addr) public constant returns (uint8[]) {
        return surveyMap[addr];
    }
}