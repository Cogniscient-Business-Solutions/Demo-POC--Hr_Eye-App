import 'dart:convert';
import 'dart:math';
//import 'dart:html';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_eye/model/time_in_out_model.dart';
import 'package:http/http.dart'  as http;
import 'package:hr_eye/model/attendence_time_model.dart';
import 'package:hr_eye/LoginScreen.dart';
//import 'package:hr_eye/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AttendanceScreen extends StatefulWidget {
  @override
  State<AttendanceScreen> createState() => AttendanceScreenState();
}

class AttendanceScreenState extends State<AttendanceScreen> {

  String coordinates = "No Location Found";
  String address = " ";
  String latitude="";
  String longitude="";
  bool scanning = false;
  String currentTime = " ";
  String date = " ";
  String AssociateCode = " ";
  String AssociateName = "";
  String Email = "";
  String Mobile = " ";
  String Company_no = " ";
  String Location_no=" ";
  String InTime=" ";
  String InFlag=" ";
  String OutFlag=" ";
  String OutTime=" ";
  String timemode="0";
  String ServerIp=" ";
  String ButtonText="Save";

  void initState() {  //Mark :- it is used when we want to call anything while loading screen
    super.initState();
    receiveUserData(); // Mark :- call methods while load screen
    //timeinout(); // method for time in time out api
    checkPermission(); // method for location and grant permission
    loadtime();  //method for time and date api
      //get data from shared preferences
    // Call the function to load time when the screen loads
  }
  Future<void> receiveUserData() async {    //MArk :-  method definition of shareprefrence
    var prefs = await SharedPreferences.getInstance();
    var getAssociateCode=prefs.getString(LoginScreenState.associatecodekey);
    var getAssociateName=prefs.getString(LoginScreenState.associatenamekey);
    var getEmail=prefs.getString(LoginScreenState.emailkey);
    var getMobile=prefs.getString(LoginScreenState.mobilekey);
    var getCompanyNo=prefs.getString(LoginScreenState.companynokey);
    var getLocationNo=prefs.getString(LoginScreenState.locationnokey);
    var getServerIp=prefs.getString(LoginScreenState.serveripkey);
    AssociateCode=getAssociateCode.toString(); // MArks :- store details which is getting by sharedprefrences
    AssociateName=getAssociateName.toString();
    Email=getEmail.toString();
    Mobile=getMobile.toString();
    Company_no=getCompanyNo.toString();
    Location_no=getLocationNo.toString();
    ServerIp=getServerIp.toString();
  }
 // Marks :-  method defination for getting permision of fetching location
  Future<void> checkPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        Fluttertoast.showToast(msg: 'Location permission denied.');
        return;
      }
    }

    getLocation(); // calling method of location and longitude and latitude
  }

  getLocation() async {
    setState(() {
      scanning = true;
    });

    //setState((){scanning=true;});

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      /*coordinates =
      'Latitude:${position.latitude} \nLongitude:${position.longitude}';*/
       latitude = position.latitude.toString();
       longitude = position.longitude.toString();
       getaddress(latitude,longitude);

      /*List<Placemark> result = await placemarkFromCoordinates(  // MArks :- alternative method for getting goelocation address
          position.latitude, position.longitude);
      if (result.isNotEmpty) {
        address = "${result[0].name},${result[0].subLocality},${result[0]
            .locality},${result[0].administrativeArea},${result[0]
            .postalCode},${result[0].country}";
      }
      print(position);*/
    } catch (e) {
      Fluttertoast.showToast(msg: "${e.toString()}");
    }
    setState(() {
      scanning = false;
    });
  }

  @override
  // Makrs :- designing portion
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData( //MArks :- IconthemeData is used to show back arrow icon
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text('Attendence ',
            //Marks :- google font
            style: GoogleFonts.abhayaLibre(
              textStyle: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),)),
      ),
      body:
      SingleChildScrollView( // MArks :- this Widget is used for scrolling like a single container
        child: Column(
          children: [
            Container(
                child: Center(
                  //Makrs :- center widget is used when we want to locate widget in center
                  child: Stack(
                    alignment: Alignment.center,
                     children: <Widget>[
                     Image(
                       image: AssetImage('assets/images/location.png'),
                       height: 200,
                       width: 300,
                       color: Colors.blue.shade900,),
                       Positioned(
                         top: 50,
                         left: 135,
                         height: 30,
                         width: 30,
                         child: CircularProgressIndicator(
                         valueColor: AlwaysStoppedAnimation<Color>(
                           Colors.blue.shade900



                         ),))
                       /*CircularProgressIndicator(
                         valueColor: AlwaysStoppedAnimation<Color>(
                           Colors.blue,


                         ),
                       )*/

                     ],

                  ),
                )),
            //Text('Current Address',),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                child:
                    //scanning is used  when fatching data take time  then for waiting
              scanning ?
                SpinKitThreeBounce(color: Colors.black, size: 20,) :
                Text(address,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                textAlign: TextAlign.center,),
                height: 100,
                padding: EdgeInsets.only(top: 20),
                // Marks :- mediaQuery is used for taking/consuming space accordingly . here width is multiply between 0 to 1
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                //alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  //color: const Color(0xff7c94b6),
                  border: Border.all(
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                //child: RichText(),
              ),
            ),


        // Sizebox is used for spacing
            SizedBox(
              height: 20,
            ),
            Container( //Mark :-  container for in time text
              padding: EdgeInsets.only(left: 24),
              alignment: Alignment.topLeft,
              child: Text("IN TIME",
                  style: GoogleFonts.abhayaLibre(textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),),
            ),
// Marks :- current time
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 50,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * .5,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child:Text(currentTime,style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),textAlign:TextAlign.center,),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * .02,
                  ),
// Marks :- Button punch and repunch
                  TextButton(
                    onPressed: () {
                      if(address==" "){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Kindly wait while location is updating')));
                      }else{
                        attendencePunching();
                      }

                    },
                    child: Text(ButtonText, style: TextStyle(
                      fontWeight: FontWeight.bold,

                    ),),
                    style: ButtonStyle(
                      //margin: EdgeInsets.only(left: 30,right: 30,),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue.shade900),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white),
                      elevation: MaterialStateProperty.all<double>(5),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                      ),),),],),)],),),);
  }
//Marks :- Api calling for getTiming
  Future<void> loadtime() async {
    final http.Response response = await http.get(Uri.parse(
        'http://hbmas.cogniscient.in/HBItemService/ItemServices.svc/GetDateTime'));

    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body.toString());
      timemodel getTime = timemodel.fromJson(responseData);
      print(responseData);

//Marks :- checking null condition and storing in string
      if (getTime.getDateTimeResult != null &&
          getTime.getDateTimeResult!.datetimeDetails != null) {
        String ApplicableDate=getTime.getDateTimeResult!.datetimeDetails![0].applicableDate?? "".toString();
        String Date=getTime.getDateTimeResult!.datetimeDetails![0].date?? "".toString();
        String Day=getTime.getDateTimeResult!.datetimeDetails![0].day?? "".toString();
        String Time=getTime.getDateTimeResult!.datetimeDetails![0].time?? "".toString();
        String VersionId=getTime.getDateTimeResult!.datetimeDetails![0].versionId?? "".toString();
        String VersionName=getTime.getDateTimeResult!.datetimeDetails![0].versionName?? "".toString();

// Marks :-   Store data in model
        DatetimeDetails datetimeDetails= DatetimeDetails(
            applicableDate:ApplicableDate,
            date:Date,
            day:Day,
            time:Time,
            versionId:VersionId,
            versionName:VersionName,

        );
        currentTime=Time.toString();
        date=Date.toString();
        timeinout(Company_no,Location_no,AssociateCode,date);

        /*setState(() {
          currentTime = getTime.getDateTimeResult!.datetimeDetails![0].time.toString();
        });*/
      }
    }
  }


// Marks :- calling api of getting attendence and checking response
  Future<void> timeinout(String company_no, String location_no, String associateCode, String date) async {
    final String apiUrl = ServerIp+'AttendanceService/AttendanceService.svc/GetAttendance';
    final Uri apiUri = Uri.parse('$apiUrl?COMPANY_NO=$company_no&LOCATION_NO=$location_no&ASS_CODE=$associateCode&DATE=$date');

    final http.Response response = await http.get(apiUri);
    var responseData=jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      timeInOutmpdel timeinout=timeInOutmpdel.fromJson(responseData);
      print(responseData);
      if(timeinout.attendanceDataResult!=null && timeinout.attendanceDataResult!.result!=null){
        InTime=timeinout.attendanceDataResult!.result!.iNTIME??"".toString();
        InFlag=timeinout.attendanceDataResult!.result!.iNFLAG??"".toString();
        OutFlag=timeinout.attendanceDataResult!.result!.oUTFLAG??"".toString();
        OutTime=timeinout.attendanceDataResult!.result!.oUTTIME??"".toString();

        Result result=Result(
            iNFLAG:InFlag,
            iNTIME:InTime,
            oUTFLAG:OutFlag,
            oUTTIME:OutTime,
        );

        //Marks :- checking flag condition for button text changing
        if(InFlag=="0"){
          setState(() {
            ButtonText="SAVE";
          });
        }else{
          setState(() {
            ButtonText="REPUNCH";
          });
        }
      }


    }

  }

  //Marks :- implementing post api for attendence punching and define parameter of post api
  Future<void> attendencePunching() async {
    if(InFlag=="0"){
    var Url=ServerIp+'AttendanceService/AttendanceService.svc/ModifyAttendance';
    var punchIn={
      "COMPANY_NO": Company_no,
      "LOCATION_NO": Location_no,
      "ASSO_CODE": AssociateCode,
      "MODE": timemode,
      "DATE": date,
      "IN_TIME": currentTime,
      "INFLAG": "1",
      "OUTFLAG": "0",
      "IN_TIME_LOCATION": address,
      "OUT_TIME_LOCATION": address,
      "IN_LAT": latitude,
      "IN_LONG": longitude,
      "OUT_LAT": "0.00",
      "OUT_LONG": "0.00",
      "OUT_TIME": "01/01/1912 00:00"
    };
    var punchInBody=json.encode(punchIn);
    print("Failed to log message:"+punchInBody);
    var punchInUrl=Uri.parse(Url);
    http.Response response=await http.post(
      punchInUrl,
      body: punchInBody,
      headers: {
            //"Content-Type":"application/json"
        "Content-Type":"application/javascript"
      }

    );
    var punchinData=jsonDecode(response.body);
    print(punchinData);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Attendence PunchIN Successfully')));
    }else if(InFlag=="1"){
      var Url=ServerIp+'AttendanceService/AttendanceService.svc/ModifyAttendance';
      var punchOut={
        "COMPANY_NO": Company_no,
        "LOCATION_NO": Location_no,
        "ASSO_CODE": AssociateCode,
        "MODE": timemode,
        "DATE": date,
        "IN_TIME": currentTime,
        "INFLAG": "1",
        "OUTFLAG": "1",
        "IN_TIME_LOCATION": address,
        "OUT_TIME_LOCATION": address,
        "IN_LAT": latitude,
        "IN_LONG": longitude,
        "OUT_LAT":"0.00",
        "OUT_LONG": "0.00",
        "OUT_TIME": currentTime
      };
      var punchOutBody=json.encode(punchOut);
      print("Failed to log message:"+punchOutBody);
      var punchOutUrl=Uri.parse(Url);
      http.Response response=await http.post(
          punchOutUrl,
          body: punchOutBody,
          headers: {
            //"Content-Type":"application/json"

            "Content-Type":"application/javascript"
          }
      );
      var punchOutData=jsonDecode(response.body);
      print(punchOutData);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Attendence PunchOut Successfully')));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Not Punched')));

    }
  }


  //Mark :- implement  location api
  Future<void> getaddress(String latitude, String longitude) async {
    var url = 'https://maps.googleapis.com/maps/api/geocode/json';
    var params = {
      "latlng": "${latitude},${longitude}",
      "key": "AIzaSyAaIWiDEGVfyNRjw_ay9izXJmcraKw2JEg",  // Replace with your actual API key
    };
    var uri = Uri.parse(url).replace(queryParameters: params);

    http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      var addressData = jsonDecode(response.body);
     // print(addressData);
      if (addressData['results'] != null && addressData['results'].isNotEmpty) {
        var formattedAddress = addressData['results'][0]['formatted_address'] ?? "";
        formattedAddress = formattedAddress.replaceAll('-', ' ');
        setState(() {
          address = formattedAddress;
        });

        print(formattedAddress);

      } else {
        print('No address found');
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }





  }

