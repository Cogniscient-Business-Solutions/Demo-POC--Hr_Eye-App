class loginmodel {
  LoginUserResult? loginUserResult;

  loginmodel({this.loginUserResult});

  loginmodel.fromJson(Map<String, dynamic> json) {
    loginUserResult = json['LoginUserResult'] != null
        ? new LoginUserResult.fromJson(json['LoginUserResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loginUserResult != null) {
      data['LoginUserResult'] = this.loginUserResult!.toJson();
    }
    return data;
  }
}

class LoginUserResult {
  LoginMessage? loginMessage;
  UserDetails? userDetails;

  LoginUserResult({this.loginMessage, this.userDetails});

  LoginUserResult.fromJson(Map<String, dynamic> json) {
    loginMessage = json['LoginMessage'] != null
        ? new LoginMessage.fromJson(json['LoginMessage'])
        : null;
    userDetails = json['UserDetails'] != null
        ? new UserDetails.fromJson(json['UserDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.loginMessage != null) {
      data['LoginMessage'] = this.loginMessage!.toJson();
    }
    if (this.userDetails != null) {
      data['UserDetails'] = this.userDetails!.toJson();
    }
    return data;
  }
}

class LoginMessage {
  Null? activityCode;
  Null? errorMsg;
  bool? success;

  LoginMessage({this.activityCode, this.errorMsg, this.success});

  LoginMessage.fromJson(Map<String, dynamic> json) {
    activityCode = json['ActivityCode'];
    errorMsg = json['ErrorMsg'];
    success = json['Success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ActivityCode'] = this.activityCode;
    data['ErrorMsg'] = this.errorMsg;
    data['Success'] = this.success;
    return data;
  }
}

class UserDetails {
  String? cOMPANYNO;
  String? currentStatus;
  String? eXPDAYS;
  String? email;
  String? fLAG;
  String? iMAGE;
  String? lOCATIONNO;
  String? loginName;
  String? loginToken;
  String? mOBILENO;
  String? rEPPERSON;
  String? sYSVALUE;
  String? userId;
  String? userName;

  UserDetails(
      {this.cOMPANYNO,
        this.currentStatus,
        this.eXPDAYS,
        this.email,
        this.fLAG,
        this.iMAGE,
        this.lOCATIONNO,
        this.loginName,
        this.loginToken,
        this.mOBILENO,
        this.rEPPERSON,
        this.sYSVALUE,
        this.userId,
        this.userName});

  UserDetails.fromJson(Map<String, dynamic> json) {
    cOMPANYNO = json['COMPANY_NO'];
    currentStatus = json['CurrentStatus'];
    eXPDAYS = json['EXPDAYS'];
    email = json['Email'];
    fLAG = json['FLAG'];
    iMAGE = json['IMAGE'];
    lOCATIONNO = json['LOCATION_NO'];
    loginName = json['LoginName'];
    loginToken = json['LoginToken'];
    mOBILENO = json['MOBILE_NO'];
    rEPPERSON = json['REP_PERSON'];
    sYSVALUE = json['SYS_VALUE'];
    userId = json['UserId'];
    userName = json['UserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['COMPANY_NO'] = this.cOMPANYNO;
    data['CurrentStatus'] = this.currentStatus;
    data['EXPDAYS'] = this.eXPDAYS;
    data['Email'] = this.email;
    data['FLAG'] = this.fLAG;
    data['IMAGE'] = this.iMAGE;
    data['LOCATION_NO'] = this.lOCATIONNO;
    data['LoginName'] = this.loginName;
    data['LoginToken'] = this.loginToken;
    data['MOBILE_NO'] = this.mOBILENO;
    data['REP_PERSON'] = this.rEPPERSON;
    data['SYS_VALUE'] = this.sYSVALUE;
    data['UserId'] = this.userId;
    data['UserName'] = this.userName;
    return data;
  }
}