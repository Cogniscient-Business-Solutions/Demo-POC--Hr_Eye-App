class Holiday_model {
  HolidayDatailResult? holidayDatailResult;

  Holiday_model({this.holidayDatailResult});

  Holiday_model.fromJson(Map<String, dynamic> json) {
    holidayDatailResult = json['HolidayDatailResult'] != null
        ? new HolidayDatailResult.fromJson(json['HolidayDatailResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.holidayDatailResult != null) {
      data['HolidayDatailResult'] = this.holidayDatailResult!.toJson();
    }
    return data;
  }
}

class HolidayDatailResult {
  List<HDDetails>? hDDetails;
  HolidayMessage? holidayMessage;

  HolidayDatailResult({this.hDDetails, this.holidayMessage});

  HolidayDatailResult.fromJson(Map<String, dynamic> json) {
    if (json['HDDetails'] != null) {
      hDDetails = <HDDetails>[];
      json['HDDetails'].forEach((v) {
        hDDetails!.add(new HDDetails.fromJson(v));
      });
    }
    holidayMessage = json['HolidayMessage'] != null
        ? new HolidayMessage.fromJson(json['HolidayMessage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hDDetails != null) {
      data['HDDetails'] = this.hDDetails!.map((v) => v.toJson()).toList();
    }
    if (this.holidayMessage != null) {
      data['HolidayMessage'] = this.holidayMessage!.toJson();
    }
    return data;
  }
}

class HDDetails {
  String? aSSOCODE;
  String? calenderCode;
  String? calenderName;
  String? holidayDate;
  String? holidayDay;
  String? holidayOccasion;
  String? yEAR;

  HDDetails(
      {this.aSSOCODE,
        this.calenderCode,
        this.calenderName,
        this.holidayDate,
        this.holidayDay,
        this.holidayOccasion,
        this.yEAR});

  HDDetails.fromJson(Map<String, dynamic> json) {
    aSSOCODE = json['ASSO_CODE'];
    calenderCode = json['Calender_Code'];
    calenderName = json['Calender_Name'];
    holidayDate = json['Holiday_Date'];
    holidayDay = json['Holiday_Day'];
    holidayOccasion = json['Holiday_Occasion'];
    yEAR = json['YEAR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ASSO_CODE'] = this.aSSOCODE;
    data['Calender_Code'] = this.calenderCode;
    data['Calender_Name'] = this.calenderName;
    data['Holiday_Date'] = this.holidayDate;
    data['Holiday_Day'] = this.holidayDay;
    data['Holiday_Occasion'] = this.holidayOccasion;
    data['YEAR'] = this.yEAR;
    return data;
  }
}

class HolidayMessage {
  Null? errorMsg;
  bool? success;

  HolidayMessage({this.errorMsg, this.success});

  HolidayMessage.fromJson(Map<String, dynamic> json) {
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
