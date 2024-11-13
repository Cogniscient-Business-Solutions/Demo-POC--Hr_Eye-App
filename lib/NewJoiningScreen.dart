import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_eye/LoginScreen.dart';
import 'package:hr_eye/model/new_joining_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class NewJoiningScreen extends StatefulWidget {
  const NewJoiningScreen({super.key});

  @override
  State<NewJoiningScreen> createState() => NewJoiningScreenState();
}
class NewJoiningScreenState extends State<NewJoiningScreen> {
  late Future<List<NJDetails>> newJoiningDetails;

  //dynamic newjoiningdata;

  //Map<String, dynamic> newjoininglist = {};
  //List<Map<, dynamic>> newJoiningList = [];
  //List<NJDetails> newjoininglist = [];
  String LoginName = '';
  String Location_no = '';
  String Company_no = ' ';
  String ServerIp = '';
  String errorMessage = '';
  //final String Url='HRLoginService/LoginService.svc/GetNewJoiningDetail';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newJoiningDetails=getnewjoiningdetails();

    //getprefrencedata();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text('New Joining',
            style: GoogleFonts.abhayaLibre(
              textStyle: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),)),
      ),
      body: FutureBuilder<List<NJDetails>>(
            future: newJoiningDetails,
            builder: (context,snapshot) {
              if(snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }
              else if(!snapshot.hasData || snapshot.data!.isEmpty){
                return Center(child: Text("NO Employee details found"));
              }
              else{
                return ListView.builder(itemCount: snapshot.data!.length,
                itemBuilder:(context,index){
                  final newjoining=snapshot.data![index];
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
                     shadowColor: Colors.blue,
                     surfaceTintColor: Colors.white,
                      elevation: 10,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 35,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.blue.shade900,
                            child: Text(newjoining.nAME??'', style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              // fontWeight: FontWeight.bold
                            ),)),
                          ),
                            Row(
                              children: [
                                Container(width: MediaQuery.of(context).size.width*.30,
                                  //color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text("Department ",style: TextStyle(fontSize: 16,
                                      color: Colors.black,)),
                                  ),
                                ),
                                Container(
                                  //color: Colors.red,
                                    width: MediaQuery.of(context).size.width*.62,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(newjoining.dEPARTMENT ?? ''),
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
                                  child: Text("Date             ",style: TextStyle(fontSize: 16,
                                    color: Colors.black,)),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*.62,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(newjoining.date ?? ''),
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
                                  child: Text("Eamil            ",style: TextStyle(fontSize: 16,
                                    color: Colors.black,)),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*.62,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(newjoining.eMAIL ?? ''),
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
                                  child: Text("Mobile          ",style: TextStyle(fontSize: 16,
                                    color: Colors.black,)),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width*.62,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(newjoining.mOBILENO ?? ''),
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

//Marks :- another ways
  /*Widget buildTextField(String labelText, String placeholder) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0,left: 15,),
      child: Row(

        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            labelText,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),

          Expanded(

            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 0, right: 0, left: 25, top: 0,),
                hintText: placeholder,
                hintStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
                border: InputBorder.none,  // Removes the default underline border
              ),
              textAlign: TextAlign.left,
              enabled: false,
            ),
          ),
        ],
      ),
    );
  }*/


  Future<List<NJDetails>>getnewjoiningdetails() async {
    var prefs = await SharedPreferences.getInstance();
    var getLoginName = prefs.getString(LoginScreenState.associatecodekey);
    var getLocationNo = prefs.getString(LoginScreenState.locationnokey);
    var getCompanyN0 = prefs.getString(LoginScreenState.companynokey);
    var getServerIp = prefs.getString(LoginScreenState.serveripkey);
    LoginName = getLoginName.toString();
    Location_no = getLocationNo.toString();
    Company_no = getCompanyN0.toString();
    ServerIp = getServerIp.toString();

    final String apiUrl = ServerIp + 'HRLoginService/LoginService.svc/GetNewJoiningDetail';
    final Uri apiUri = Uri.parse('$apiUrl?LoginName=$LoginName&LOCATION_NO=$Location_no&COMPANY_NO=$Company_no');
    final http.Response response = await http.get(apiUri);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final jsonResponse = json.decode(response.body);
      final newJoiningModel = Newjoining_model.fromJson(jsonResponse);
      return newJoiningModel.newJoiningDetailResult?.nJDetails ?? [];
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load employee details');
    }
  }

      }






