import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'LoginScreen.dart';
import 'model/notification_model.dart';


class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => notificationState();
}

class notificationState extends State<notification> {

  late Future<List<NotificationDetail>>notificationDetails;

  String LoginName = '';
  String Location_no = '';
  String Company_no = ' ';
  String ServerIp = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationDetails=getnotificationDetails();
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
        title: Text('Notification',
            style: GoogleFonts.abhayaLibre(
              textStyle:TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),)),
      ),
      body: FutureBuilder<List<NotificationDetail>>(
        future: notificationDetails,
        builder: (context,snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          else if(!snapshot.hasData || snapshot.data!.isEmpty){
            return Center(child: Text("Notification not found"));
          }
          else{
            return ListView.builder(itemCount:snapshot.data!.length,
              itemBuilder: (context, index) {
              final notification=snapshot.data![index];
              return Row(
                children: [
                  Container(
                    child: Card(
                      margin: EdgeInsets.only(left: 10,right: 10,bottom: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      color: Colors.white,
                      shadowColor: Colors.black,
                      surfaceTintColor: Colors.white,
                      elevation: 10,
                      child: Row(
                        children: [
                          Container(
                            //color: Colors.red,
                            width: MediaQuery.of(context).size.width*.20,
                            child: Image(image: AssetImage('assets/images/notification.png'),height: 50,width: 50,),
                          ),
                          Container(
                            padding:EdgeInsets.only(right: 10,top: 0) ,
                            width: MediaQuery.of(context).size.width*.74,
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width*.45,
                                          child: Text(notification.title??'',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),
                                      ),
                                      Container(

                                          width: MediaQuery.of(context).size.width*.25,
                                          child: Text(notification.date??'',style: TextStyle(fontWeight: FontWeight.w500),),alignment: Alignment.topRight,),
                                    ],
                                  ),alignment: Alignment.topRight,
                                ),SizedBox(height: 5,),Container(
                                  child: Text(notification.description??'',style: TextStyle(fontSize: 12),),
                                )
                              ],
                            ),

                          )

                        ],
                      ),
                    ),


                  )
                ],

              );


              },

            );
          }
        },

      ),
    );
  }


  Future<List<NotificationDetail>>getnotificationDetails() async {
    var prefs = await SharedPreferences.getInstance();
    var getLoginName = prefs.getString(LoginScreenState.associatecodekey);
    var getLocationNo = prefs.getString(LoginScreenState.locationnokey);
    var getCompanyN0 = prefs.getString(LoginScreenState.companynokey);
    var getServerIp = prefs.getString(LoginScreenState.serveripkey);
    LoginName = getLoginName.toString();
    Location_no = getLocationNo.toString();
    Company_no = getCompanyN0.toString();
    ServerIp = getServerIp.toString();

    final String apiUrl = ServerIp + 'HRLoginService/LoginService.svc/notificationList';
    final Uri apiUri = Uri.parse('$apiUrl?companyNo=$Company_no&locationNo=$Location_no&assoCode=$LoginName');
    final http.Response response = await http.get(apiUri);

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final jsonResponse = json.decode(response.body);
      final notificationModel = notification_model.fromJson(jsonResponse);
      return notificationModel.notificationListResult?.notificationDetail ?? [];
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load notification');
    }
  }


}
