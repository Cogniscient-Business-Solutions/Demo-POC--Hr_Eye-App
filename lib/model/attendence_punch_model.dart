class AttendencePunch {
  AttendanceDataResult? attendanceDataResult;

  AttendencePunch({this.attendanceDataResult});

  AttendencePunch.fromJson(Map<String, dynamic> json) {
    attendanceDataResult = json['AttendanceDataResult'] != null
        ? new AttendanceDataResult.fromJson(json['AttendanceDataResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attendanceDataResult != null) {
      data['AttendanceDataResult'] = this.attendanceDataResult!.toJson();
    }
    return data;
  }
}

class AttendanceDataResult {
  Messsage? messsage;
  Result? result;

  AttendanceDataResult({this.messsage, this.result});

  AttendanceDataResult.fromJson(Map<String, dynamic> json) {
    messsage = json['Messsage'] != null
        ? new Messsage.fromJson(json['Messsage'])
        : null;
    result =
    json['Result'] != null ? new Result.fromJson(json['Result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.messsage != null) {
      data['Messsage'] = this.messsage!.toJson();
    }
    if (this.result != null) {
      data['Result'] = this.result!.toJson();
    }
    return data;
  }
}

class Messsage {
  Null? errorMsg;
  bool? success;
  Null? visitCode;

  Messsage({this.errorMsg, this.success, this.visitCode});

  Messsage.fromJson(Map<String, dynamic> json) {
    errorMsg = json['ErrorMsg'];
    success = json['Success'];
    visitCode = json['VisitCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ErrorMsg'] = this.errorMsg;
    data['Success'] = this.success;
    data['VisitCode'] = this.visitCode;
    return data;
  }
}

class Result {
  String? iNFLAG;
  String? iNTIME;
  String? oUTFLAG;
  String? oUTTIME;

  Result({this.iNFLAG, this.iNTIME, this.oUTFLAG, this.oUTTIME});

  Result.fromJson(Map<String, dynamic> json) {
    iNFLAG = json['INFLAG'];
    iNTIME = json['IN_TIME'];
    oUTFLAG = json['OUTFLAG'];
    oUTTIME = json['OUT_TIME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['INFLAG'] = this.iNFLAG;
    data['IN_TIME'] = this.iNTIME;
    data['OUTFLAG'] = this.oUTFLAG;
    data['OUT_TIME'] = this.oUTTIME;
    return data;
  }
}