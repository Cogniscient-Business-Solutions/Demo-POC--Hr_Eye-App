class Birthday_model {
  UserBirthdayDetailResult? userBirthdayDetailResult;

  Birthday_model({this.userBirthdayDetailResult});

  Birthday_model.fromJson(Map<String, dynamic> json) {
    userBirthdayDetailResult = json['UserBirthdayDetailResult'] != null
        ? new UserBirthdayDetailResult.fromJson(
        json['UserBirthdayDetailResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userBirthdayDetailResult != null) {
      data['UserBirthdayDetailResult'] =
          this.userBirthdayDetailResult!.toJson();
    }
    return data;
  }
}

class UserBirthdayDetailResult {
  List<UBDetails>? uBDetails;
  UserBirthdayDetailMessage? userBirthdayDetailMessage;

  UserBirthdayDetailResult({this.uBDetails, this.userBirthdayDetailMessage});

  UserBirthdayDetailResult.fromJson(Map<String, dynamic> json) {
    if (json['UBDetails'] != null) {
      uBDetails = <UBDetails>[];
      json['UBDetails'].forEach((v) {
        uBDetails!.add(new UBDetails.fromJson(v));
      });
    }
    userBirthdayDetailMessage = json['UserBirthdayDetailMessage'] != null
        ? new UserBirthdayDetailMessage.fromJson(
        json['UserBirthdayDetailMessage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.uBDetails != null) {
      data['UBDetails'] = this.uBDetails!.map((v) => v.toJson()).toList();
    }
    if (this.userBirthdayDetailMessage != null) {
      data['UserBirthdayDetailMessage'] =
          this.userBirthdayDetailMessage!.toJson();
    }
    return data;
  }
}

class UBDetails {
  String? dEPARTMENT;
  String? date;
  String? eMAIL;
  String? mOBILENO;
  String? nAME;
  String? oCCASION;

  UBDetails(
      {this.dEPARTMENT,
        this.date,
        this.eMAIL,
        this.mOBILENO,
        this.nAME,
        this.oCCASION});

  UBDetails.fromJson(Map<String, dynamic> json) {
    dEPARTMENT = json['DEPARTMENT'];
    date = json['Date'];
    eMAIL = json['EMAIL'];
    mOBILENO = json['MOBILE_NO'];
    nAME = json['NAME'];
    oCCASION = json['OCCASION'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DEPARTMENT'] = this.dEPARTMENT;
    data['Date'] = this.date;
    data['EMAIL'] = this.eMAIL;
    data['MOBILE_NO'] = this.mOBILENO;
    data['NAME'] = this.nAME;
    data['OCCASION'] = this.oCCASION;
    return data;
  }
}

class UserBirthdayDetailMessage {
  Null? errorMsg;
  bool? success;

  UserBirthdayDetailMessage({this.errorMsg, this.success});

  UserBirthdayDetailMessage.fromJson(Map<String, dynamic> json) {
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
