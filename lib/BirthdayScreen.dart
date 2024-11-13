import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'LoginScreen.dart';
import 'model/Birthday_model.dart';
import 'package:intl/intl.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => BirthdayScreenState();
}

class BirthdayScreenState extends State<BirthdayScreen> {
  late Future<List<UBDetails>> birthdayDetails;

  String LoginName = '';
  String Location_no = '';
  String Company_no = ' ';
  String ServerIp = '';
  String errorMessage = '';
  @override
  void initState() {
    // TODO: implement initState
    birthdayDetails = getBirthdayDetails();
    super.initState();
  }

  // Makrs :- Desiging work
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text('Birthday',
            style: GoogleFonts.abhayaLibre(
              textStyle:TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),)),
      ),body:
        FutureBuilder<List<UBDetails>>(
          future: birthdayDetails,
          builder: (context,snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            else if(!snapshot.hasData || snapshot.data!.isEmpty){
              return Center(child: Text("Birthday details not found"));
            }
            else{
              return ListView.builder(itemCount: snapshot.data!.length,
                  itemBuilder:(context,index){
                    final birthday=snapshot.data![index];
                    return Container(
                      //height: 320,
                      width: MediaQuery.of(context).size.width,
                      //color: Colors.blue,
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
                              alignment: Alignment.center,
                              height: 35,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.blue.shade900,
                              child: Text(birthday.nAME??'', style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
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
                                    child: Text("Date            ",style: TextStyle(fontSize: 16,
                                      color: Colors.black,)),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*.62,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(birthday.date ?? ''),
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
                                    child: Text("Occasion    ",style: TextStyle(fontSize: 16,
                                      color: Colors.black,)),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*.62,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(birthday.oCCASION ?? ''),
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
                                    child: Text("Email           ",style: TextStyle(fontSize: 16,
                                      color: Colors.black,)),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*.62,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(birthday.eMAIL ?? ''),
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
                                    child: Text("Mobile No.  ",style: TextStyle(fontSize: 16,
                                      color: Colors.black,)),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*.62,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(birthday.mOBILENO ?? ''),
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

  Future<List<UBDetails>>getBirthdayDetails() async {
    var prefs = await SharedPreferences.getInstance();
    var getLoginName = prefs.getString(LoginScreenState.associatecodekey);
    var getLocationNo = prefs.getString(LoginScreenState.locationnokey);
    var getCompanyN0 = prefs.getString(LoginScreenState.companynokey);
    var getServerIp = prefs.getString(LoginScreenState.serveripkey);
    LoginName = getLoginName.toString();
    Location_no = getLocationNo.toString();
    Company_no = getCompanyN0.toString();
    ServerIp = getServerIp.toString();

    final String apiUrl = ServerIp + 'HRLoginService/LoginService.svc/GetUserBirthdayDetail';
    final Uri apiUri = Uri.parse('$apiUrl?LoginName=$LoginName&LOCATION_NO=$Location_no&COMPANY_NO=$Company_no');
    final http.Response response = await http.get(apiUri);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final jsonResponse = json.decode(response.body);
      final birthdaymodel = Birthday_model.fromJson(jsonResponse);
      //return birthdaymodel.userBirthdayDetailResult?.uBDetails ?? [];
      List<UBDetails> birthdayList = birthdaymodel.userBirthdayDetailResult?.uBDetails ?? [];
      birthdayList.sort((a, b) {
        DateTime now = DateTime.now();
        var adate = a.date ?? '';
        var bdate = b.date ?? '';
        return adate.compareTo(bdate);
        //return adate.isAfter(now) && bdate.isAfter(now) ? adate.compareTo(bdate) : 0;


      });
     // birthdayList.forEach((b) => print(b.date));
      return birthdayList;
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load employee details');
    }
  }


  /*Future<List<UBDetails>> getBirthdayDetails() async {
    var prefs = await SharedPreferences.getInstance();
    var getLoginName = prefs.getString(LoginScreenState.associatecodekey);
    var getLocationNo = prefs.getString(LoginScreenState.locationnokey);
    var getCompanyN0 = prefs.getString(LoginScreenState.companynokey);
    var getServerIp = prefs.getString(LoginScreenState.serveripkey);
    LoginName = getLoginName.toString();
    Location_no = getLocationNo.toString();
    Company_no = getCompanyN0.toString();
    ServerIp = getServerIp.toString();

    final String apiUrl = ServerIp + 'HRLoginService/LoginService.svc/GetUserBirthdayDetail';
    final Uri apiUri = Uri.parse('$apiUrl?LoginName=$LoginName&LOCATION_NO=$Location_no&COMPANY_NO=$Company_no');
    final http.Response response = await http.get(apiUri);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final jsonResponse = json.decode(response.body);
      final birthdaymodel = Birthday_model.fromJson(jsonResponse);
      List<UBDetails> birthdayList = birthdaymodel.userBirthdayDetailResult?.uBDetails ?? [];

      //Sortdate();

      DateTime now = DateTime.now();

      birthdayList.sort((a, b) {
        DateTime? dateA = a.date != null ? DateFormat('dd-MMM').parse(a.date!) : null;
        DateTime? dateB = b.date != null ? DateFormat('dd-MMM').parse(b.date!) : null;

        if (dateA == null || dateB == null) {
          return 0;
        }

        if (dateA.isBefore(now) && dateB.isBefore(now)) {
          return dateA.compareTo(dateB);
        } else if (dateA.isBefore(now)) {
          return 1;
        } else if (dateB.isBefore(now)) {
          return -1;
        } else {
          return dateA.compareTo(dateB);
        }
      });

      return birthdayList;
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load employee details');
    }
  }*/

}

/*class Sortdate {
  static void sortBirthdayDetails(List<UBDetails> details) {
    final dateFormat = DateFormat('dd-MMM');
    final today = DateTime.now();

    details.sort((o1, o2) {
      final date1 = dateFormat.parse(o1.date ?? '', true).toLocal();
      final date2 = dateFormat.parse(o2.date ?? '', true).toLocal();

      final isToday1 = isSameDay(date1, today);
      final isToday2 = isSameDay(date2, today);

      if (isToday1 && !isToday2) {
        return -1; // o1 is today, so it should come first
      } else if (!isToday1 && isToday2) {
        return 1; // o2 is today, so it should come first
      } else {
        final nextBirthday1 = getNextBirthdayDate(date1, today);
        final nextBirthday2 = getNextBirthdayDate(date2, today);

        if (nextBirthday1.isAtSameMomentAs(nextBirthday2)) {
          return date1.compareTo(date2); // Sort by date if same
        } else {
          return nextBirthday1.compareTo(nextBirthday2); // Otherwise sort by next birthday
        }
      }
    });
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.day == date2.day && date1.month == date2.month;
  }

  static DateTime getNextBirthdayDate(DateTime birthdayDate, DateTime today) {
    final nextBirthdayThisYear = DateTime(today.year, birthdayDate.month, birthdayDate.day);

    if (nextBirthdayThisYear.isBefore(today)) {
      return DateTime(today.year + 1, birthdayDate.month, birthdayDate.day);
    } else {
      return nextBirthdayThisYear;
    }
}}*/
