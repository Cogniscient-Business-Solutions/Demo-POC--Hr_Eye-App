import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_eye/model/attendenceRecord_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginScreen.dart';
import 'package:http/http.dart' as http;

class AttendanceRecordsScreen extends StatefulWidget {
  const AttendanceRecordsScreen({super.key});

  @override
  State<AttendanceRecordsScreen> createState() => AttendanceRecordsScreenState();
}

class AttendanceRecordsScreenState extends State<AttendanceRecordsScreen> {
  late Future<List<ADetail>> attendenceRecordList;

  String DropdownValue='Select Month';
  String LoginName = '';
  String Location_no = '';
  String Company_no = ' ';
  String ServerIp = '';
  @override
  void initState() {
    // TODO: implement initState
    attendenceRecordList = Future.value([]);
    getshareddata();
    super.initState();
  }

  String monthdata='Month';
  String yeardata='Year';
  late int monthValue;
  DateTime selectedYear=DateTime.now();

  List monthList = [
  "January" ,
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
  ];

  int getMonthValue(String monthName) {
    return monthList.indexOf(monthName) + 1; // indexOf returns -1 if not found, so +1 to match month numbers
  }

  //List<String> yearList = [];
  selectYear(context) async{
   // print("year");
    showDialog(
        context: context, builder: (BuildContext context){
          return AlertDialog(
            title: const Text("Select Year"),
            content: SizedBox(
              width: 300,
              height: 300,
              child: YearPicker(
                firstDate:DateTime(DateTime.now().year-10,1) ,
                lastDate: DateTime.now(),
               // lastDate: DateTime(2040),
                selectedDate: selectedYear,
                onChanged: (DateTime dateTime){
                  //print(dateTime.year);
                  setState(() {
                    selectedYear=dateTime;
                    yeardata="${dateTime.year}";
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          );

    });
    
  }


  Future<void> selectMonth(BuildContext context) async {
  //selectMonth(context){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Month List'),
          content: SizedBox(
            width: 300,
            height: 300,
            child: GridView.count(
              crossAxisCount: 2,  // 3 months per row
              shrinkWrap: true,
              children: monthList.map((month) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      monthdata = month;
                      monthValue = getMonthValue(monthdata);
                    });
                    Navigator.of(context).pop();
                  },
                  child: Card(
                    margin: EdgeInsets.all(4.0),
                    child: Center(child: Text(month,
                      style: TextStyle(fontWeight: FontWeight.bold,
                          ),)),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
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
        title: Text('Attendence Record',
            style: GoogleFonts.abhayaLibre(
              textStyle:TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
       // color: Colors.grey,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*.1,
              color: Colors.white,
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10)),

                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width*.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1)
                    ),

                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Text(monthdata,style: TextStyle(
                                            fontSize:16,
                            //fontWeight: FontWeight.bold
                              ),),
                            GestureDetector(
                              onTap: (){
                                selectMonth(context);
                              },
                              child:Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: const Icon(Icons.calendar_month),
                              ) ,
                            )
                  ]),


                  ),

                  SizedBox(width: 5,),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width*.32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 0)),
                        Text(yeardata,style: TextStyle(
                          fontSize:16,
                        ),),
                        GestureDetector(
                          onTap: (){
                                  selectYear(context);
                            },
                            child:Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: const Icon(Icons.calendar_month),
                            ) ,
                            )],
                            ),
                            ),
                  SizedBox(width: 5,),
                  SizedBox(
                            width: MediaQuery.of(context).size.width*.23,
                            height: MediaQuery.of(context).size.height*.06,
                    child: ElevatedButton(
                            onPressed: (){
                              if(yeardata !="Select Year"){
                                print("Selected Year $yeardata");
                               // print(monthValue);
                                print(yeardata);

                                setState(() {
                                  attendenceRecordList = getAttendenceRecord();
                                });
                               // attendenceRecordList=getAttendenceRecord();

                              }
                              else{
                                print("did not Select a year");

                              }
                              },
                      child: Text("Save",
                            style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                            ),

                          ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                      ),),
                  )

                  //Text('Select Month & Year :')
                ],

              ),
            ),
            Expanded(
              child: FutureBuilder<List<ADetail>>(
                future: attendenceRecordList,
                builder: (context,snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }
                  else if(!snapshot.hasData || snapshot.data!.isEmpty){
                    return Center(child: Text("NO Employee details found"));
                  }
                  else{
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context,index){
                          final attendenceRecords=snapshot.data![index];
                          return Container(
                              //height: 320,
                              width: MediaQuery.of(context).size.width,
                          //color: Colors.blue,

                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Card(
                                margin: EdgeInsets.only(left: 10,right: 10,top: 0,bottom: 05),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                color: Colors.white,
                                shadowColor: Colors.blue,
                                surfaceTintColor: Colors.white,
                                elevation: 10,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context).size.width*.50,
                                          //color: Colors.grey,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15,top: 05),
                                            child: Text("Punch Time Record ",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.blue.shade900,
                                                fontWeight: FontWeight.bold)),
                                          ),
                                        ),

                                        Container(
                                          //color: Colors.red,
                                          width: MediaQuery.of(context).size.width*.42,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:05,top: 5),
                                            child: Text(attendenceRecords.iNTIME ?? '',style: TextStyle(
                                              fontSize: 16,fontWeight: FontWeight.w500
                                            ),),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 5,),

                                        Container(
                                          //color: Colors.red,
                                          //width: MediaQuery.of(context).size.width*.42,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 15,bottom: 10),
                                            child: Text(attendenceRecords.iNTIMELOCATION ?? '',style: TextStyle(fontSize: 16),),
                                          ),
                                        )




                                  ],
                                ),

                              ),
                            ),


                          );

                        }
                    );
                  }
                },

              ),



            ),
          ],
        ),
      ),

    );
  }

  Future<void> getshareddata() async {
    var prefs = await SharedPreferences.getInstance();
    var getLoginName = prefs.getString(LoginScreenState.associatecodekey);
    var getLocationNo = prefs.getString(LoginScreenState.locationnokey);
    var getCompanyN0 = prefs.getString(LoginScreenState.companynokey);
    var getServerIp = prefs.getString(LoginScreenState.serveripkey);
    LoginName = getLoginName.toString();
    Location_no = getLocationNo.toString();
    Company_no = getCompanyN0.toString();
    ServerIp = getServerIp.toString();


  }

  Future<List<ADetail>>getAttendenceRecord() async {
    final String apiUrl = ServerIp + 'AttendanceService/AttendanceService.svc/AttendanceDetail';
    final Uri apiUri = Uri.parse('$apiUrl?ASS_CODE=$LoginName&COMPANY_NO=$Company_no&LOCATION_NO=$Location_no&Month=$monthValue&Year=$yeardata');
    final http.Response response = await http.get(apiUri);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final jsonResponse = json.decode(response.body);
      final attendenceRecordModel= attendenceRecord.fromJson(jsonResponse);
      return attendenceRecordModel.attendanceDetailResult?.aDetail ?? [];

    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load employee details');
    }




  }
}
