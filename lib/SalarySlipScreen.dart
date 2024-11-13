import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'LoginScreen.dart';
import 'model/SalarySlipModel.dart';

class SalarySlipScreen extends StatefulWidget {
  const SalarySlipScreen({super.key});

  @override
  State<SalarySlipScreen> createState() => SalarySlipScreenState();
}

class SalarySlipScreenState extends State<SalarySlipScreen> {
  List<PaySlipAmountDetail> SalaryDetails=[];

  @override
  void initState() {
    // TODO: implement initState
    getshareddata();
  }
  String monthdata='Month';
  String yeardata='Year';
  late int monthValue;
  DateTime selectedYear=DateTime.now();
  String Asso_code = '';
  String Location_no = '';
  String Company_no = ' ';
  String ServerIp = '';
  String Userid='';

  String Name='';
  String Designation='';
  String PF_Ac='';
  String UAN_No='';
  String Department='';
  String Location='';
  String Payable_day='';
  String ESI_Ac='';
  String BankName='';
  String Bank_Ac='';


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text('Salary Slip',
            style: GoogleFonts.abhayaLibre(
              textStyle:TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),)),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*.08,
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
                    width: MediaQuery.of(context).size.width*.24,
                    height: MediaQuery.of(context).size.height*.06,
                    child: ElevatedButton(
                      onPressed: (){
                        salaryslip( monthValue,yeardata);
                      },
                      child: Text("Search",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12
                        ),

                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                      ),),
                  )
                ],
              ),
            ),
            Divider(
              color: Colors.blue.shade900,
            ),
            Expanded(
                child:Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8,),
                      //Marks for personal details
                      child: Card(
                        margin: EdgeInsets.all(6.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                        color: Colors.white,
                        shadowColor: Colors.black,
                        surfaceTintColor: Colors.white,
                        elevation: 10,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 35,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.blue.shade900,
                              child: Text("Personal Details", style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                // fontWeight: FontWeight.bold
                              ),)),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.50,
                                  //color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,top: 01),
                                    child: Text("Emp ID ",
                                        style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold))),
                                  ),
                                ),
                                SizedBox(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width*.42,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:05,top: 01),
                                    child: Text("DT1079",style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                        fontSize: 18,
                                        //color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold))),
                                  ),
                                )
                              ],
                            ),
                            //SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.50,
                                  //color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,top: 01),
                                    child: Text("Name ",
                                        style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold))),
                                  ),
                                ),
                                SizedBox(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width*.42,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:05,top: 01),
                                    child: Text("Aditya",style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                        fontSize: 18,
                                        //color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold))),
                                  ),
                                )
                              ],
                            ),
                            //SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.50,
                                  //color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,top: 01),
                                    child: Text("Designation ",
                                        style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold))),
                                  ),
                                ),
                                SizedBox(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width*.42,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:05,top: 01),
                                    child: Text("Dot Net ",style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                        fontSize: 18,
                                        //color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold))),
                                  ),
                                )
                              ],
                            ),
                            //SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.50,
                                  //color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,top: 01),
                                    child: Text("PF A/C NO ",
                                        style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold))),
                                  ),
                                ),
                                SizedBox(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width*.42,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:05,top: 01),
                                    child: Text("",style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                        fontSize: 18,
                                        //color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold))),
                                  ),
                                )
                              ],
                            ),
                            //SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.50,
                                  //color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,top: 01),
                                    child: Text("UAN No. ",
                                        style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold))),
                                  ),
                                ),
                                SizedBox(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width*.42,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:05,top: 01),
                                    child: Text("",style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                        fontSize: 18,
                                       // color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold))),
                                  ),
                                )
                              ],
                            ),
                            //SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.50,
                                  //color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,top: 01),
                                    child: Text("Department ",
                                        style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold))),
                                  ),
                                ),
                                SizedBox(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width*.42,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:05,top: 01),
                                    child: Text("",style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                        fontSize: 18,
                                        //color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold))),
                                  ),
                                )
                              ],
                            ),
                            //SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.50,
                                  //color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,top: 01),
                                    child: Text("Location ",
                                        style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold))),
                                  ),
                                ),
                                SizedBox(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width*.42,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:05,top: 01),
                                    child: Text("",style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                        fontSize: 18,
                                        //color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold))),
                                  ),
                                )
                              ],
                            ),
                            //SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.50,
                                  //color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,top: 01),
                                    child: Text("Payable Days ",
                                        style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold))),
                                  ),
                                ),
                                SizedBox(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width*.42,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:05,top: 01),
                                    child: Text("",style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                        fontSize: 18,
                                       // color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold))),
                                  ),
                                )
                              ],
                            ),
                            //SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.50,
                                  //color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,top: 01),
                                    child: Text("ESI A/c No ",
                                        style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold))),
                                  ),
                                ),
                                SizedBox(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width*.42,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:05,top: 01),
                                    child: Text("",style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                        fontSize: 18,
                                        //color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold))),
                                  ),
                                )
                              ],
                            ),
                            //SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.50,
                                  //color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,top: 01),
                                    child: Text("Bank Name ",
                                        style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold))),
                                  ),
                                ),
                                SizedBox(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width*.42,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:05,top: 01),
                                    child: Text("",style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                        fontSize: 18,
                                        //color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold))),
                                  ),
                                )
                              ],
                            ),
                            //SizedBox(height: 5),
                            Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.50,
                                  //color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15,top: 01),
                                    child: Text("Bank A/c No ",
                                        style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue.shade900,
                                            fontWeight: FontWeight.bold))),
                                  ),
                                ),
                                SizedBox(
                                  //color: Colors.red,
                                  width: MediaQuery.of(context).size.width*.42,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:05,top: 01),
                                    child: Text("",style:  GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                        fontSize: 18,
                                        //color: Colors.blue.shade900,
                                        fontWeight: FontWeight.bold))),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8,),
                      child: Card(
                        margin: EdgeInsets.all(6.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.white,
                        shadowColor: Colors.black,
                        surfaceTintColor: Colors.white,
                        elevation: 10,
                        child: Column(
                          children: [
                            Container(
                              //alignment: Alignment.center,
                              height: 35,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.blue.shade900,
                              child:
                              Row(
                                children: [
                                  Padding(padding: EdgeInsets.only(left: 10,right: 10)),
                                  Text("Earning", style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,

                                    // fontWeight: FontWeight.bold
                                  ),)),
                                  SizedBox(width: 50,),

                                  Text("Gross Amt", style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold
                                  ),)),
                                  SizedBox(width: 50,),
                                  Text("Amount", style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold
                                  ),)),

                                ],
                              ),
                            ),
                            /*Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 10)),
                                Text("Basic", style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  //color: Colors.white,

                                  // fontWeight: FontWeight.bold
                                ),)),
                                SizedBox(width: 70,),

                                Text("85000", style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  //color: Colors.white,
                                  // fontWeight: FontWeight.bold
                                ),)),
                                SizedBox(width: 70,),
                                Text("", style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  // fontWeight: FontWeight.bold
                                ),)),

                              ],
                            ),*/


                          ],
                        ),

                      ),
                    ),
                    Divider(
                      color: Colors.blue.shade900,
                    )
                  ],
                ) )
          ],
        ),

      ),
    );




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
                      print(monthValue);
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

  Future<void> getshareddata() async {
    var prefs = await SharedPreferences.getInstance();
    var getasso_code = prefs.getString(LoginScreenState.associatecodekey);
    var getLocationNo = prefs.getString(LoginScreenState.locationnokey);
    var getCompanyN0 = prefs.getString(LoginScreenState.companynokey);
    var getServerIp = prefs.getString(LoginScreenState.serveripkey);
    var getuserid=prefs.getString(LoginScreenState.Usersidkey);
    Asso_code = getasso_code.toString() ;
    Location_no=getLocationNo.toString();
    Company_no = getCompanyN0.toString();
    Userid=getuserid.toString();
    ServerIp = getServerIp.toString();
  }

  Future<void> salaryslip(int monthValue, String yeardata) async {

    final String apiUrl = ServerIp + 'GetLeaveCalendar/Service1.svc/PaySlipData';
    final Uri apiUri = Uri.parse('$apiUrl?COMPANY_NO=$Company_no&LOCATION_NO=$Location_no&USER_ID=$Userid&Year=$yeardata&Month=$monthValue&FromAsso_code=$Asso_code&ToAsso_code=$Asso_code');
    final http.Response response = await http.get(apiUri);
    var jsonResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      SalarySlipModel SalarySliprecord= SalarySlipModel.fromJson(jsonResponse);
      List PaySlipAmountDetail=SalarySliprecord.payslipResult?.paySlipAmountDetail ?? [];
      List PaySlipDeductionDetail=SalarySliprecord.payslipResult?.paySlipDeductionDetail ?? [];
      //PaySlipPersonalDetail=SalarySliprecord.payslipResult?.paySlipPersonalDetail ?? [];
      if(SalarySliprecord.payslipResult?.paySlipPersonalDetail!='' && SalarySliprecord.payslipResult!=''){
        String Emp_id=SalarySliprecord.payslipResult?.paySlipPersonalDetail?.empID ?? ''.toString();
        String Name=SalarySliprecord.payslipResult?.paySlipPersonalDetail?.name ?? ''.toString();
        String Designation=SalarySliprecord.payslipResult?.paySlipPersonalDetail?.designation ?? ''.toString();
        String PFno=SalarySliprecord.payslipResult?.paySlipPersonalDetail?.pfNo ?? ''.toString();
        String UANno=SalarySliprecord.payslipResult?.paySlipPersonalDetail?.uANno ?? ''.toString();
        String Department=SalarySliprecord.payslipResult?.paySlipPersonalDetail?.department ?? ''.toString();
        String Location=SalarySliprecord.payslipResult?.paySlipPersonalDetail?.location ?? ''.toString();
        String PayableDay=SalarySliprecord.payslipResult?.paySlipPersonalDetail?.payableDays ?? ''.toString();
        String ESIno=SalarySliprecord.payslipResult?.paySlipPersonalDetail?.eSIno ?? ''.toString();
        String BankName=SalarySliprecord.payslipResult?.paySlipPersonalDetail?.bankName ?? ''.toString();
        String BankAc=SalarySliprecord.payslipResult?.paySlipPersonalDetail?.bankAcNo ?? ''.toString();
      }
      print(PaySlipAmountDetail);

      //return SalarySliprecord.payslipResult.paySlipPersonalDetail.

    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load employee details');
    }




  }

  }



