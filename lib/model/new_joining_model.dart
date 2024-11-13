class Newjoining_model {
  NewJoiningDetailResult? newJoiningDetailResult;

  Newjoining_model({this.newJoiningDetailResult});

  Newjoining_model.fromJson(Map<String, dynamic> json) {
    newJoiningDetailResult = json['NewJoiningDetailResult'] != null
        ? new NewJoiningDetailResult.fromJson(json['NewJoiningDetailResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newJoiningDetailResult != null) {
      data['NewJoiningDetailResult'] = this.newJoiningDetailResult!.toJson();
    }
    return data;
  }
}

class NewJoiningDetailResult {
  List<NJDetails>? nJDetails;
  NewJoiningsMsgMessage? newJoiningsMsgMessage;

  NewJoiningDetailResult({this.nJDetails, this.newJoiningsMsgMessage});

  NewJoiningDetailResult.fromJson(Map<String, dynamic> json) {
    if (json['NJDetails'] != null) {
      nJDetails = <NJDetails>[];
      json['NJDetails'].forEach((v) {
        nJDetails!.add(new NJDetails.fromJson(v));
      });
    }
    newJoiningsMsgMessage = json['NewJoiningsMsgMessage'] != null
        ? new NewJoiningsMsgMessage.fromJson(json['NewJoiningsMsgMessage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nJDetails != null) {
      data['NJDetails'] = this.nJDetails!.map((v) => v.toJson()).toList();
    }
    if (this.newJoiningsMsgMessage != null) {
      data['NewJoiningsMsgMessage'] = this.newJoiningsMsgMessage!.toJson();
    }
    return data;
  }
}

class NJDetails {
  String? dEPARTMENT;
  String? date;
  String? eMAIL;
  String? mOBILENO;
  String? nAME;

  NJDetails({this.dEPARTMENT, this.date, this.eMAIL, this.mOBILENO, this.nAME});

  NJDetails.fromJson(Map<String, dynamic> json) {
    dEPARTMENT = json['DEPARTMENT'];
    date = json['Date'];
    eMAIL = json['EMAIL'];
    mOBILENO = json['MOBILE_NO'];
    nAME = json['NAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DEPARTMENT'] = this.dEPARTMENT;
    data['Date'] = this.date;
    data['EMAIL'] = this.eMAIL;
    data['MOBILE_NO'] = this.mOBILENO;
    data['NAME'] = this.nAME;
    return data;
  }
}

class NewJoiningsMsgMessage {
  Null? errorMsg;
  bool? success;

  NewJoiningsMsgMessage({this.errorMsg, this.success});

  NewJoiningsMsgMessage.fromJson(Map<String, dynamic> json) {
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
