class SalarySlipModel {
  PayslipResult? payslipResult;

  SalarySlipModel({this.payslipResult});

  SalarySlipModel.fromJson(Map<String, dynamic> json) {
    payslipResult = json['payslipResult'] != null
        ? new PayslipResult.fromJson(json['payslipResult'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.payslipResult != null) {
      data['payslipResult'] = this.payslipResult!.toJson();
    }
    return data;
  }
}

class PayslipResult {
  Msg? msg;
  List<PaySlipAmountDetail>? paySlipAmountDetail;
  List<PaySlipDeductionDetail>? paySlipDeductionDetail;
  PaySlipPersonalDetail? paySlipPersonalDetail;

  PayslipResult(
      {this.msg,
        this.paySlipAmountDetail,
        this.paySlipDeductionDetail,
        this.paySlipPersonalDetail});

  PayslipResult.fromJson(Map<String, dynamic> json) {
    msg = json['Msg'] != null ? new Msg.fromJson(json['Msg']) : null;
    if (json['PaySlipAmountDetail'] != null) {
      paySlipAmountDetail = <PaySlipAmountDetail>[];
      json['PaySlipAmountDetail'].forEach((v) {
        paySlipAmountDetail!.add(new PaySlipAmountDetail.fromJson(v));
      });
    }
    if (json['PaySlipDeductionDetail'] != null) {
      paySlipDeductionDetail = <PaySlipDeductionDetail>[];
      json['PaySlipDeductionDetail'].forEach((v) {
        paySlipDeductionDetail!.add(new PaySlipDeductionDetail.fromJson(v));
      });
    }
    paySlipPersonalDetail = json['PaySlipPersonalDetail'] != null
        ? new PaySlipPersonalDetail.fromJson(json['PaySlipPersonalDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.msg != null) {
      data['Msg'] = this.msg!.toJson();
    }
    if (this.paySlipAmountDetail != null) {
      data['PaySlipAmountDetail'] =
          this.paySlipAmountDetail!.map((v) => v.toJson()).toList();
    }
    if (this.paySlipDeductionDetail != null) {
      data['PaySlipDeductionDetail'] =
          this.paySlipDeductionDetail!.map((v) => v.toJson()).toList();
    }
    if (this.paySlipPersonalDetail != null) {
      data['PaySlipPersonalDetail'] = this.paySlipPersonalDetail!.toJson();
    }
    return data;
  }
}

class Msg {
  Null? errorMsg;
  bool? success;

  Msg({this.errorMsg, this.success});

  Msg.fromJson(Map<String, dynamic> json) {
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

class PaySlipAmountDetail {
  String? amount;
  String? earning;
  String? grossAmt;

  PaySlipAmountDetail({this.amount, this.earning, this.grossAmt});

  PaySlipAmountDetail.fromJson(Map<String, dynamic> json) {
    amount = json['Amount'];
    earning = json['Earning'];
    grossAmt = json['GrossAmt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Amount'] = this.amount;
    data['Earning'] = this.earning;
    data['GrossAmt'] = this.grossAmt;
    return data;
  }
}

class PaySlipDeductionDetail {
  String? deduction;
  String? deductionAmt;

  PaySlipDeductionDetail({this.deduction, this.deductionAmt});

  PaySlipDeductionDetail.fromJson(Map<String, dynamic> json) {
    deduction = json['Deduction'];
    deductionAmt = json['DeductionAmt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Deduction'] = this.deduction;
    data['DeductionAmt'] = this.deductionAmt;
    return data;
  }
}

class PaySlipPersonalDetail {
  String? bankAcNo;
  String? bankName;
  String? department;
  String? designation;
  String? eSIno;
  String? empID;
  String? location;
  String? name;
  Null? netPayable;
  String? payableDays;
  String? pfNo;
  String? uANno;

  PaySlipPersonalDetail(
      {this.bankAcNo,
        this.bankName,
        this.department,
        this.designation,
        this.eSIno,
        this.empID,
        this.location,
        this.name,
        this.netPayable,
        this.payableDays,
        this.pfNo,
        this.uANno});

  PaySlipPersonalDetail.fromJson(Map<String, dynamic> json) {
    bankAcNo = json['BankAcNo'];
    bankName = json['BankName'];
    department = json['Department'];
    designation = json['Designation'];
    eSIno = json['ESIno'];
    empID = json['EmpID'];
    location = json['Location'];
    name = json['Name'];
    netPayable = json['NetPayable'];
    payableDays = json['PayableDays'];
    pfNo = json['PfNo'];
    uANno = json['UANno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BankAcNo'] = this.bankAcNo;
    data['BankName'] = this.bankName;
    data['Department'] = this.department;
    data['Designation'] = this.designation;
    data['ESIno'] = this.eSIno;
    data['EmpID'] = this.empID;
    data['Location'] = this.location;
    data['Name'] = this.name;
    data['NetPayable'] = this.netPayable;
    data['PayableDays'] = this.payableDays;
    data['PfNo'] = this.pfNo;
    data['UANno'] = this.uANno;
    return data;
  }
}