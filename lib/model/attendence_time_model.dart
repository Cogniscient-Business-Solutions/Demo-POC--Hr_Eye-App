class timemodel {
  GetDateTimeResult? getDateTimeResult;

  timemodel({this.getDateTimeResult});

  timemodel.fromJson(Map<String, dynamic> json) {
    getDateTimeResult = json['GetDateTimeResult'] != null
        ? new GetDateTimeResult.fromJson(json['GetDateTimeResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.getDateTimeResult != null) {
      data['GetDateTimeResult'] = this.getDateTimeResult!.toJson();
    }
    return data;
  }
}

class GetDateTimeResult {
  List<DatetimeDetails>? datetimeDetails;
  ItemMessage? itemMessage;

  GetDateTimeResult({this.datetimeDetails, this.itemMessage});

  GetDateTimeResult.fromJson(Map<String, dynamic> json) {
    if (json['DatetimeDetails'] != null) {
      datetimeDetails = <DatetimeDetails>[];
      json['DatetimeDetails'].forEach((v) {
        datetimeDetails!.add(new DatetimeDetails.fromJson(v));
      });
    }
    itemMessage = json['ItemMessage'] != null
        ? new ItemMessage.fromJson(json['ItemMessage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.datetimeDetails != null) {
      data['DatetimeDetails'] =
          this.datetimeDetails!.map((v) => v.toJson()).toList();
    }
    if (this.itemMessage != null) {
      data['ItemMessage'] = this.itemMessage!.toJson();
    }
    return data;
  }
}

class DatetimeDetails {
  String? applicableDate;
  String? date;
  String? day;
  String? time;
  String? versionId;
  String? versionName;

  DatetimeDetails(
      {this.applicableDate,
        this.date,
        this.day,
        this.time,
        this.versionId,
        this.versionName});

  DatetimeDetails.fromJson(Map<String, dynamic> json) {
    applicableDate = json['ApplicableDate'];
    date = json['Date'];
    day = json['Day'];
    time = json['Time'];
    versionId = json['VersionId'];
    versionName = json['VersionName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ApplicableDate'] = this.applicableDate;
    data['Date'] = this.date;
    data['Day'] = this.day;
    data['Time'] = this.time;
    data['VersionId'] = this.versionId;
    data['VersionName'] = this.versionName;
    return data;
  }
}

class ItemMessage {
  Null? errorMsg;
  bool? success;

  ItemMessage({this.errorMsg, this.success});

  ItemMessage.fromJson(Map<String, dynamic> json) {
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