import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'LoginScreen.dart';
import 'model/leaveStatus_model.dart';

class ApplyLeaveScreen extends StatefulWidget {
  const ApplyLeaveScreen({super.key});

  @override
  State<ApplyLeaveScreen> createState() => _ApplyLeaveScreenState();
}

class _ApplyLeaveScreenState extends State<ApplyLeaveScreen> {
  late Future<List<LSDetails>> leaveStatusDetails;
  String? LeaveType;
  String? Session1;
  String? Session2;
  String FromDate='Select Date';
  String ToDate='Select Date';
  DateTime? fromDateTime;
  String AssociateCode = '';
  String AssociateName = '';
  String Email = '';
  String Mobile = '';
  String Company_no = '';
  String Location_no = '';
  String Reporting_person='';
  String ServerIp='';

  TextEditingController AssociateController = TextEditingController();
  TextEditingController ReportingPersController = TextEditingController();
  TextEditingController BalancedController = TextEditingController();
  List<String> LeaveTypeList = [];
  /*List<String> LeaveTypeList=[
    'CASUAL LEAVE',
    'EARNED LEAVE',
    'SPECIAL LEAVE',
    'COMPANSATORY LEAVE',
    'LEAVE WITHOUT PAY',
    'ABSENT',
    'NOT PUNCHED(ABSENT)',
    'EXTRA WORKING',
    'OUTSTATION DUTY'
  ];*/
  List<String> Session=[
    'Whole Day',
    'First Session',
    'Second Session'
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    receiveUserData();
    leaveStatusDetails=getLeaveDetails();
  }
  Future<void> receiveUserData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      var getAssociateCode=prefs.getString(LoginScreenState.associatecodekey);
      var getAssociateName=prefs.getString(LoginScreenState.associatenamekey);
      var getEmail=prefs.getString(LoginScreenState.emailkey);
      var getMobile=prefs.getString(LoginScreenState.mobilekey);
      var getCompanyNo=prefs.getString(LoginScreenState.companynokey);
      var getLocationNo=prefs.getString(LoginScreenState.locationnokey);
      var getReportingPerson=prefs.getString(LoginScreenState.reportingkey);
      AssociateCode=getAssociateCode.toString();
      AssociateName=getAssociateName ?? '';
      Email=getEmail.toString();
      Mobile=getMobile.toString();
      Company_no=getCompanyNo.toString();
      Location_no=getLocationNo.toString();
      Reporting_person=getReportingPerson ?? '';
      AssociateController.text = AssociateName;
      ReportingPersController.text = Reporting_person;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text('Apply Leave',
            style: GoogleFonts.abhayaLibre(
              textStyle:TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Mark :- Associate name
            Row(
              children: [
        
                SizedBox(
                  width: MediaQuery.of(context).size.width*.4,
                  child: Text("Ass. Name :",
                      style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                        color: Colors.blue.shade900,) )),
                ),
                SizedBox(width: 20),
                SizedBox(
                    width: MediaQuery.of(context).size.width*.5,
                    child: TextField(
                      controller: AssociateController,style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,)),
                    ))],),
            //Mark :- Reporting Person
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*.4,
                  child: Text("Rpt. Person :",
                      style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                        color: Colors.blue.shade900,))),),
                SizedBox(width: 20),
                SizedBox(
                    width: MediaQuery.of(context).size.width*.5,
                    child: TextField(
                      controller: ReportingPersController,style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,)),
                    ))]),
            Divider(
              color: Colors.blue.shade900),
            //Mark :- Leave Type
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*.3,
                  child: Text("Leave Type :",
                      style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                        color: Colors.blue.shade900,)))),
                SizedBox(width: 20),
                SizedBox(
                    width: MediaQuery.of(context).size.width*.58,
                    child: DropdownButtonFormField(
                      value: LeaveType,
                      hint: Text('Select type',style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 16,))),
                      items: LeaveTypeList.map((String item){
                        return DropdownMenuItem(
                            value: item,
                            child: Text(item,style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 16,)) ,));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          LeaveType = value;
                        });
                        if (value != null) {
                          // fetchBalance(value); // Fetch balance when leave type changes
                        }
                      },))]),
            //Mark :- Balanced
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*.3,
                  child: Text("Balanced:",
                      style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                        color: Colors.blue.shade900,) )),
                ),
                SizedBox(width: 20),
                SizedBox(
                    width: MediaQuery.of(context).size.width*.58,
                    child: TextField(
                      controller: BalancedController,
                    )),
        
        
              ],
            ),
            SizedBox(height: 20),
            //Mark :- From date and To date
            Row(
              children: [
                // Marks :- From date Container
                Column(
                  children: [
                    Text("From Date  ",style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                      color: Colors.blue.shade900,) )),
                    Container(
                      height: MediaQuery.of(context).size.height*.10,
                      //width: double.infinity,
                      //color: Colors.lightBlue,
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 15)),
                          GestureDetector(
                            onTap: () async {
                              DateTime now = DateTime.now();
                              DateTime firstDate = DateTime(now.year, 1, 1);
                              DateTime? selectedDate = await showDatePicker(
                                context: context,
                                initialDate: now,
                                firstDate: firstDate,
                                lastDate: DateTime(2101),
                              );
                              if (selectedDate != null) {
                                setState(() {
                                  FromDate = DateFormat('dd/MM/yyyy').format(selectedDate);
                                  fromDateTime = selectedDate;
                                });
                              }
                            },
                            child: Container(
                              // padding: EdgeInsets.only(left: 20),
                              height: 50,
                              width: MediaQuery.of(context).size.width*.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: .5)
                              ),
                              child: Center(
                                child: Text(FromDate,
                                  style:TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
        
        
                                  ) ,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 25,),
        
                        ],
        
                      ),
                    ),
                  ],
                ),
        
                //SizedBox(width: 10,),
        
                // Marks : - To Date Container
                Container(
                  //color: Colors.blue.shade900,
                  width: MediaQuery.of(context).size.width*.45,
                  child: Column(
                    children: [
                      Text("To Date  ",style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                        color: Colors.blue.shade900,))),
                      Container(
                        height: MediaQuery.of(context).size.height*.10,
                        width: double.infinity,
                        //color: Colors.lightBlue,
                        child: Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 10)),
                            GestureDetector(
                              onTap: () async {
                                DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: fromDateTime ?? DateTime.now(),
                                  firstDate: fromDateTime ?? DateTime.now(),
                                  lastDate: DateTime(2101),
                                );
                                if (selectedDate != null) {
                                  setState(() {
                                    ToDate = DateFormat('dd/MM/yyyy').format(selectedDate);
                                  });
                                }
                              },
                              child: Container(
                                // padding: EdgeInsets.only(left: 20),
                                height: 50,
                                width: MediaQuery.of(context).size.width*.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(width: .5)
                                ),
                                child: Center(
                                  child: Text(ToDate,
                                    style:TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400
        
                                    ) ,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5,),
        
                          ],
        
                        ),
                      ),
        
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            // Marks:- Session
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  // Marks:- Session1
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.4,
                        child: Text("Session  ",style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                          color: Colors.blue.shade900,) )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.44,
                        child: DropdownButtonFormField(
                          value: Session1,
                          hint: Text('Select type'),
                          items: Session.map((String item){
                            return DropdownMenuItem(
                                value: item,
                                child: Text(item,style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 16,))));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              Session1=value;
                            });
                          },
        
                        ),)
        
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  // Marks:- Session2
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.4,
                        child: Text("Session  ",style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                          color: Colors.blue.shade900,) )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*.44,
                        child: DropdownButtonFormField(
                          value: Session2,
                          hint: Text('Select type'),
                          items: Session.map((String item){
                            return DropdownMenuItem(
                                value: item,
                                child: Text(item,style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 16,)),));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              Session2=value;
                            });
                          },
        
                        ),)
        
                    ],
                  ),
        
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start ,
              children: [
                Text("Employee Reason *  ",style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                  color: Colors.blue.shade900,) )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10),
              child: TextField(

              ),
            ),
            SizedBox(height: 30,),


            SizedBox(
              width: MediaQuery.of(context).size.width*.95,
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9), // Rectangular shape
                  ),
                ),
                child: Text('Apply Leave',style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                    fontSize: 20,
                    fontWeight:FontWeight.bold,
                    color: Colors.white
                )),),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<List<LSDetails>> getLeaveDetails() async {
    var prefs = await SharedPreferences.getInstance();
    var getLoginName = prefs.getString(LoginScreenState.associatecodekey);
    var getLocationNo = prefs.getString(LoginScreenState.locationnokey);
    var getCompanyN0 = prefs.getString(LoginScreenState.companynokey);
    var getServerIp = prefs.getString(LoginScreenState.serveripkey);
    AssociateCode = getLoginName.toString();
    Location_no = getLocationNo.toString();
    Company_no = getCompanyN0.toString();
    ServerIp = getServerIp.toString();

    final String apiUrl = ServerIp + 'HRLoginService/LoginService.svc/GetLeaveStatusDetail';
    final Uri apiUri = Uri.parse('$apiUrl?AssoCode=$AssociateCode&LOCATION_NO=$Location_no&COMPANY_NO=$Company_no');
    final http.Response response = await http.get(apiUri);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final jsonResponse = json.decode(response.body);
      final leaveStatusModel = LeaveStatus_model.fromJson(jsonResponse);
      List<LSDetails> details = leaveStatusModel.leaveStatusDetailResult?.lSDetails ?? [];
      final balance = jsonResponse['Balance'] as String;


      // Extract leave types and update LeaveTypeList
      setState(() {
        LeaveTypeList = details.map((detail) => detail.leaveDecs ?? '').toSet().toList();// Using Set to avoid duplicates
        BalancedController.text = balance;
      });

      return details;
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load employee details');
    }
  }


/*Future<List<LSDetails>> getLeaveDetails() async {
    var prefs = await SharedPreferences.getInstance();
    var getLoginName = prefs.getString(LoginScreenState.associatecodekey);
    var getLocationNo = prefs.getString(LoginScreenState.locationnokey);
    var getCompanyN0 = prefs.getString(LoginScreenState.companynokey);
    var getServerIp = prefs.getString(LoginScreenState.serveripkey);
    AssociateCode = getLoginName.toString();
    Location_no = getLocationNo.toString();
    Company_no = getCompanyN0.toString();
    ServerIp = getServerIp.toString();

    final String apiUrl = ServerIp + 'HRLoginService/LoginService.svc/GetLeaveStatusDetail';
    final Uri apiUri = Uri.parse('$apiUrl?AssoCode=$AssociateCode&LOCATION_NO=$Location_no&COMPANY_NO=$Company_no');
    final http.Response response = await http.get(apiUri);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final jsonResponse = json.decode(response.body);
      final leavestatusmodel = LeaveStatus_model.fromJson(jsonResponse);
      return leavestatusmodel.leaveStatusDetailResult?.lSDetails ?? [];

      //return leavestatusmodel.leaveStatusDetailResult?.getLeaveStatusMessage ?? [];
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load employee details');
    }
  }*/
}
