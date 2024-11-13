class leaveCalenderModel {
  LeaveCalDetailResult? leaveCalDetailResult;

  leaveCalenderModel({this.leaveCalDetailResult});

  leaveCalenderModel.fromJson(Map<String, dynamic> json) {
    leaveCalDetailResult = json['LeaveCalDetailResult'] != null
        ? new LeaveCalDetailResult.fromJson(json['LeaveCalDetailResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.leaveCalDetailResult != null) {
      data['LeaveCalDetailResult'] = this.leaveCalDetailResult!.toJson();
    }
    return data;
  }
}

class LeaveCalDetailResult {
  GetLeaveCalMessage? getLeaveCalMessage;
  List<LCDetails>? lCDetails;

  LeaveCalDetailResult({this.getLeaveCalMessage, this.lCDetails});

  LeaveCalDetailResult.fromJson(Map<String, dynamic> json) {
    getLeaveCalMessage = json['GetLeaveCalMessage'] != null
        ? new GetLeaveCalMessage.fromJson(json['GetLeaveCalMessage'])
        : null;
    if (json['LCDetails'] != null) {
      lCDetails = <LCDetails>[];
      json['LCDetails'].forEach((v) {
        lCDetails!.add(new LCDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getLeaveCalMessage != null) {
      data['GetLeaveCalMessage'] = this.getLeaveCalMessage!.toJson();
    }
    if (this.lCDetails != null) {
      data['LCDetails'] = this.lCDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetLeaveCalMessage {
  Null? errorMsg;
  bool? success;

  GetLeaveCalMessage({this.errorMsg, this.success});

  GetLeaveCalMessage.fromJson(Map<String, dynamic> json) {
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

class LCDetails {
  String? cALENDERCODE;
  String? hOLICAL;
  String? hOLCOLORCODE;
  String? hOLDATE;
  String? iNOUTDATE;
  String? lEAVECOLORCODE;
  String? lEAVEDATE;
  String? lEAVETYPE;
  String? oCCASION;
  String? timeIn;
  String? timeOut;
  Null? timeINOUTCODE;

  LCDetails(
      {this.cALENDERCODE,
        this.hOLICAL,
        this.hOLCOLORCODE,
        this.hOLDATE,
        this.iNOUTDATE,
        this.lEAVECOLORCODE,
        this.lEAVEDATE,
        this.lEAVETYPE,
        this.oCCASION,
        this.timeIn,
        this.timeOut,
        this.timeINOUTCODE});

  LCDetails.fromJson(Map<String, dynamic> json) {
    cALENDERCODE = json['CALENDER_CODE'];
    hOLICAL = json['HOLI_CAL'];
    hOLCOLORCODE = json['HOL_COLOR_CODE'];
    hOLDATE = json['HOL_DATE'];
    iNOUTDATE = json['INOUTDATE'];
    lEAVECOLORCODE = json['LEAVE_COLOR_CODE'];
    lEAVEDATE = json['LEAVE_DATE'];
    lEAVETYPE = json['LEAVE_TYPE'];
    oCCASION = json['OCCASION'];
    timeIn = json['TimeIn'];
    timeOut = json['TimeOut'];
    timeINOUTCODE = json['Time_IN_OUT_CODE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CALENDER_CODE'] = this.cALENDERCODE;
    data['HOLI_CAL'] = this.hOLICAL;
    data['HOL_COLOR_CODE'] = this.hOLCOLORCODE;
    data['HOL_DATE'] = this.hOLDATE;
    data['INOUTDATE'] = this.iNOUTDATE;
    data['LEAVE_COLOR_CODE'] = this.lEAVECOLORCODE;
    data['LEAVE_DATE'] = this.lEAVEDATE;
    data['LEAVE_TYPE'] = this.lEAVETYPE;
    data['OCCASION'] = this.oCCASION;
    data['TimeIn'] = this.timeIn;
    data['TimeOut'] = this.timeOut;
    data['Time_IN_OUT_CODE'] = this.timeINOUTCODE;
    return data;
  }
}