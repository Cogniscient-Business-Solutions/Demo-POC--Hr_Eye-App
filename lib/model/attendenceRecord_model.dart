class attendenceRecord {
  AttendanceDetailResult? attendanceDetailResult;

  attendenceRecord({this.attendanceDetailResult});

  attendenceRecord.fromJson(Map<String, dynamic> json) {
    attendanceDetailResult = json['AttendanceDetailResult'] != null
        ? new AttendanceDetailResult.fromJson(json['AttendanceDetailResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attendanceDetailResult != null) {
      data['AttendanceDetailResult'] = this.attendanceDetailResult!.toJson();
    }
    return data;
  }
}

class AttendanceDetailResult {
  List<ADetail>? aDetail;
  Messsage? messsage;

  AttendanceDetailResult({this.aDetail, this.messsage});

  AttendanceDetailResult.fromJson(Map<String, dynamic> json) {
    if (json['ADetail'] != null) {
      aDetail = <ADetail>[];
      json['ADetail'].forEach((v) {
        aDetail!.add(new ADetail.fromJson(v));
      });
    }
    messsage = json['Messsage'] != null
        ? new Messsage.fromJson(json['Messsage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aDetail != null) {
      data['ADetail'] = this.aDetail!.map((v) => v.toJson()).toList();
    }
    if (this.messsage != null) {
      data['Messsage'] = this.messsage!.toJson();
    }
    return data;
  }
}

class ADetail {
  String? iNTIME;
  String? iNTIMELOCATION;
  String? oUTTIME;
  String? oUTTIMELOCATION;

  ADetail(
      {this.iNTIME, this.iNTIMELOCATION, this.oUTTIME, this.oUTTIMELOCATION});

  ADetail.fromJson(Map<String, dynamic> json) {
    iNTIME = json['IN_TIME'];
    iNTIMELOCATION = json['IN_TIME_LOCATION'];
    oUTTIME = json['OUT_TIME'];
    oUTTIMELOCATION = json['OUT_TIME_LOCATION'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IN_TIME'] = this.iNTIME;
    data['IN_TIME_LOCATION'] = this.iNTIMELOCATION;
    data['OUT_TIME'] = this.oUTTIME;
    data['OUT_TIME_LOCATION'] = this.oUTTIMELOCATION;
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
