class notification_model {
  NotificationListResult? notificationListResult;

  notification_model({this.notificationListResult});

  notification_model.fromJson(Map<String, dynamic> json) {
    notificationListResult = json['NotificationListResult'] != null
        ? new NotificationListResult.fromJson(json['NotificationListResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notificationListResult != null) {
      data['NotificationListResult'] = this.notificationListResult!.toJson();
    }
    return data;
  }
}

class NotificationListResult {
  LogMessage? logMessage;
  List<NotificationDetail>? notificationDetail;

  NotificationListResult({this.logMessage, this.notificationDetail});

  NotificationListResult.fromJson(Map<String, dynamic> json) {
    logMessage = json['LogMessage'] != null
        ? new LogMessage.fromJson(json['LogMessage'])
        : null;
    if (json['notificationDetail'] != null) {
      notificationDetail = <NotificationDetail>[];
      json['notificationDetail'].forEach((v) {
        notificationDetail!.add(new NotificationDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.logMessage != null) {
      data['LogMessage'] = this.logMessage!.toJson();
    }
    if (this.notificationDetail != null) {
      data['notificationDetail'] =
          this.notificationDetail!.map((v) => v.toJson()).toList();
    }
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

class NotificationDetail {
  String? date;
  String? description;
  String? notificationId;
  String? status;
  String? title;

  NotificationDetail(
      {this.date,
        this.description,
        this.notificationId,
        this.status,
        this.title});

  NotificationDetail.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    description = json['description'];
    notificationId = json['notificationId'];
    status = json['status'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['description'] = this.description;
    data['notificationId'] = this.notificationId;
    data['status'] = this.status;
    data['title'] = this.title;
    return data;
  }
}
