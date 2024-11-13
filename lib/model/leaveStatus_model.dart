class LeaveStatus_model {
  LeaveStatusDetailResult? leaveStatusDetailResult;

  LeaveStatus_model({this.leaveStatusDetailResult});

  LeaveStatus_model.fromJson(Map<String, dynamic> json) {
    leaveStatusDetailResult = json['LeaveStatusDetailResult'] != null
        ? new LeaveStatusDetailResult.fromJson(json['LeaveStatusDetailResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.leaveStatusDetailResult != null) {
      data['LeaveStatusDetailResult'] = this.leaveStatusDetailResult!.toJson();
    }
    return data;
  }
}

class LeaveStatusDetailResult {
  GetLeaveStatusMessage? getLeaveStatusMessage;
  List<LSDetails>? lSDetails;

  LeaveStatusDetailResult({this.getLeaveStatusMessage, this.lSDetails});

  LeaveStatusDetailResult.fromJson(Map<String, dynamic> json) {
    getLeaveStatusMessage = json['GetLeaveStatusMessage'] != null
        ? new GetLeaveStatusMessage.fromJson(json['GetLeaveStatusMessage'])
        : null;
    if (json['LSDetails'] != null) {
      lSDetails = <LSDetails>[];
      json['LSDetails'].forEach((v) {
        lSDetails!.add(new LSDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getLeaveStatusMessage != null) {
      data['GetLeaveStatusMessage'] = this.getLeaveStatusMessage!.toJson();
    }
    if (this.lSDetails != null) {
      data['LSDetails'] = this.lSDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetLeaveStatusMessage {
  Null? errorMsg;
  bool? success;

  GetLeaveStatusMessage({this.errorMsg, this.success});

  GetLeaveStatusMessage.fromJson(Map<String, dynamic> json) {
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

class LSDetails {
  String? availed;
  String? balance;
  String? entitled;
  String? leaveDecs;
  String? leaveType;
  String? openingBal;

  LSDetails(
      {this.availed,
        this.balance,
        this.entitled,
        this.leaveDecs,
        this.leaveType,
        this.openingBal});

  LSDetails.fromJson(Map<String, dynamic> json) {
    availed = json['Availed'];
    balance = json['Balance'];
    entitled = json['Entitled'];
    leaveDecs = json['Leave_Decs'];
    leaveType = json['Leave_type'];
    openingBal = json['Opening_bal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Availed'] = this.availed;
    data['Balance'] = this.balance;
    data['Entitled'] = this.entitled;
    data['Leave_Decs'] = this.leaveDecs;
    data['Leave_type'] = this.leaveType;
    data['Opening_bal'] = this.openingBal;
    return data;
  }
}
