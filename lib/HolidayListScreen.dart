import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'LoginScreen.dart';
import 'model/Holiday_model.dart';

class HolidayListScreen extends StatefulWidget {
  const HolidayListScreen({super.key});

  @override
  State<HolidayListScreen> createState() => HolidayListScreenState();
}

class HolidayListScreenState extends State<HolidayListScreen> {
  late Future<List<HDDetails>> holidayList;
  String currentyear=DateTime.now().year.toString();
  String Asso_code='';
  String Company_no='';
  String Location_no='';
  String ServerIp='';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    holidayList=getholidayDetails();
    //print(currentyear);
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
        title: Text('Holiday List ',
            style: GoogleFonts.abhayaLibre(
              textStyle:TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),)),
      ),
        body:
        FutureBuilder<List<HDDetails>>(
          future: holidayList,
          builder: (context,snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else if(!snapshot.hasData || snapshot.data!.isEmpty){
              return Center(child: Text("Holiday details not found"));
            }
            else{
              return ListView.builder(itemCount: snapshot.data!.length,
                  itemBuilder:(context,index){
                    final holiday=snapshot.data![index];
                    return Container(
                      //height: 320,
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.blue,
                      child: Card(
                        margin: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        color: Colors.white,
                        shadowColor: Colors.black ,
                        surfaceTintColor: Colors.white,
                        elevation: 10,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 35,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.blue.shade900,
                              child: Text(holiday.holidayOccasion??'',
                                  style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                // fontWeight: FontWeight.bold
                              ),)),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*.30,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text("Date            ",
                                        style: TextStyle(fontSize: 18,
                                      color: Colors.black,)),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*.62,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(holiday.holidayDate ?? '',
                                      style: TextStyle(fontSize: 18),),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*.30,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text("Day    ",style: TextStyle(fontSize: 18,
                                      color: Colors.black,)),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*.62,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(holiday.holidayDay ?? '',style: TextStyle(fontSize: 18),),
                                  ),
                                )
                              ],
                            ),



                            SizedBox(height: 5),


                            /*buildTextField('Department :', newjoining.dEPARTMENT ?? ''),
                            buildTextField("Date             :", newjoining.date ?? ''),
                            buildTextField("Email            :", newjoining.eMAIL ?? ''),
                            buildTextField("Mobile         :", newjoining.mOBILENO ?? '')
*/
                          ],
                        ),

                      ),

                    );

                  });

            }

          },)
    );
  }

   Future<List<HDDetails>>getholidayDetails() async {
    var prefs = await SharedPreferences.getInstance();
    var getLoginName = prefs.getString(LoginScreenState.associatecodekey);
    var getLocationNo = prefs.getString(LoginScreenState.locationnokey);
    var getCompanyN0 = prefs.getString(LoginScreenState.companynokey);
    var getServerIp = prefs.getString(LoginScreenState.serveripkey);
    Asso_code = getLoginName.toString();
    Location_no = getLocationNo.toString();
    Company_no = getCompanyN0.toString();
    ServerIp = getServerIp.toString();


    final String apiUrl = ServerIp + 'HRLoginService/LoginService.svc/GetHolidayDatail';
    final Uri apiUri = Uri.parse('$apiUrl?YEAR=$currentyear&CALENDER_CODE=$currentyear&LOCATION_NO=$Location_no&COMPANY_NO=$Company_no&ASSO_CODE=$Asso_code');
    final http.Response response = await http.get(apiUri);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final jsonResponse = json.decode(response.body);
      final holidaymodel = Holiday_model.fromJson(jsonResponse);
      return holidaymodel.holidayDatailResult?.hDDetails ?? [];
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load employee details');
    }
  }
}
