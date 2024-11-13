class news_model {
  UserDashBoardNewsDetailResult? userDashBoardNewsDetailResult;

  news_model({this.userDashBoardNewsDetailResult});

  news_model.fromJson(Map<String, dynamic> json) {
    userDashBoardNewsDetailResult =
    json['UserDashBoardNewsDetailResult'] != null
        ? new UserDashBoardNewsDetailResult.fromJson(
        json['UserDashBoardNewsDetailResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userDashBoardNewsDetailResult != null) {
      data['UserDashBoardNewsDetailResult'] =
          this.userDashBoardNewsDetailResult!.toJson();
    }
    return data;
  }
}

class UserDashBoardNewsDetailResult {
  GetUserDashBoardNewsMsgMessage? getUserDashBoardNewsMsgMessage;
  LogMessage? logMessage;

  UserDashBoardNewsDetailResult(
      {this.getUserDashBoardNewsMsgMessage, this.logMessage});

  UserDashBoardNewsDetailResult.fromJson(Map<String, dynamic> json) {
    getUserDashBoardNewsMsgMessage =
    json['GetUserDashBoardNewsMsgMessage'] != null
        ? new GetUserDashBoardNewsMsgMessage.fromJson(
        json['GetUserDashBoardNewsMsgMessage'])
        : null;
    logMessage = json['LogMessage'] != null
        ? new LogMessage.fromJson(json['LogMessage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getUserDashBoardNewsMsgMessage != null) {
      data['GetUserDashBoardNewsMsgMessage'] =
          this.getUserDashBoardNewsMsgMessage!.toJson();
    }
    if (this.logMessage != null) {
      data['LogMessage'] = this.logMessage!.toJson();
    }
    return data;
  }
}

class GetUserDashBoardNewsMsgMessage {
  String? bDAY;
  String? dISPLAYFLAG;
  String? eXPDAYS;
  String? nEWJOINING;
  String? nEWSCONTENT;
  String? sYSVALUE;
  String? calendarCode;
  String? calendarDescription;
  String? employeeStatus;

  GetUserDashBoardNewsMsgMessage(
      {this.bDAY,
        this.dISPLAYFLAG,
        this.eXPDAYS,
        this.nEWJOINING,
        this.nEWSCONTENT,
        this.sYSVALUE,
        this.calendarCode,
        this.calendarDescription,
        this.employeeStatus});

  GetUserDashBoardNewsMsgMessage.fromJson(Map<String, dynamic> json) {
    bDAY = json['BDAY'];
    dISPLAYFLAG = json['DISPLAY_FLAG'];
    eXPDAYS = json['EXPDAYS'];
    nEWJOINING = json['NEWJOINING'];
    nEWSCONTENT = json['NEWS_CONTENT'];
    sYSVALUE = json['SYS_VALUE'];
    calendarCode = json['calendarCode'];
    calendarDescription = json['calendarDescription'];
    employeeStatus = json['employeeStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BDAY'] = this.bDAY;
    data['DISPLAY_FLAG'] = this.dISPLAYFLAG;
    data['EXPDAYS'] = this.eXPDAYS;
    data['NEWJOINING'] = this.nEWJOINING;
    data['NEWS_CONTENT'] = this.nEWSCONTENT;
    data['SYS_VALUE'] = this.sYSVALUE;
    data['calendarCode'] = this.calendarCode;
    data['calendarDescription'] = this.calendarDescription;
    data['employeeStatus'] = this.employeeStatus;
    return data;
  }
}

class LogMessage {
  Null? errorMsg;
  bool? success;

  LogMessage({this.errorMsg, this.success});

  LogMessage.fromJson(Map<String, dynamic> json) {
    errorMsg = json['ErrorMsg'];
    success = json['Success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ErrorMsg'] = this.errorMsg;
    data['Success'] = this.success;
    return data;
  }
}
