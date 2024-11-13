import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'LoginScreen.dart';
import 'model/leaveStatus_model.dart';

class LeaveStatusScreen extends StatefulWidget {
  const LeaveStatusScreen({super.key});

  @override
  State<LeaveStatusScreen> createState() => LeaveStatusScreenState();
}

class LeaveStatusScreenState extends State<LeaveStatusScreen> {
  late Future<List<LSDetails>> leaveStatusDetails;

  String Asso_code = '';
  String Location_no = '';
  String Company_no = ' ';
  String ServerIp = '';


  @override
  void initState() {
    // TODO: implement initState
    leaveStatusDetails=getLeaveDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true  ,
        title: Text('Leave Status',
            style: GoogleFonts.abhayaLibre(
              textStyle:TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),)),
      ),
      body: Center(
        child: FutureBuilder<List<LSDetails>>(
          future: leaveStatusDetails,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No data available');
            } else {
              return SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                series:[
                  StackedColumnSeries<LSDetails, String>(
                      dataSource: snapshot.data!,
                      xValueMapper: (LSDetails data, _) => data.leaveType!,
                      yValueMapper: (LSDetails data, _) => double.tryParse(data.balance!) ?? 0,
                      //yValueMapper: (LSDetails data, _) => double.tryParse(data.balance!) ?? 0,
                      name: 'balance',
                      width: 0.8,
                      spacing: 0.2
                  ),

                  /*StackedColumnSeries<LSDetails, String>(
                    dataSource: snapshot.data!,
                    xValueMapper: (LSDetails data, _) => data.leaveType!,
                    yValueMapper: (LSDetails data, _) => double.tryParse(data.availed!) ?? 0,
                    //yValueMapper: (LSDetails data, _) => double.tryParse(data.balance!) ?? 0,
                    name: 'Availed',
                    width: 0.6, spacing: 0.4,
                  ),*/

                  /*StackedColumnSeries<LSDetails, String>(
                      dataSource: snapshot.data!,
                      xValueMapper: (LSDetails data, _) => data.leaveType!,
                      yValueMapper: (LSDetails data, _) => double.tryParse(data.availed!) ?? 0,
                      //yValueMapper: (LSDetails data, _) => double.tryParse(data.balance!) ?? 0,
                      name: 'availed',
                      color: Colors.redAccent,
                      width: 0.8,
                      spacing: 0.2
                  ),*/

                ],


              );
            }
          },
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
    Asso_code = getLoginName.toString();
    Location_no = getLocationNo.toString();
    Company_no = getCompanyN0.toString();
    ServerIp = getServerIp.toString();

    final String apiUrl = ServerIp + 'HRLoginService/LoginService.svc/GetLeaveStatusDetail';
    final Uri apiUri = Uri.parse('$apiUrl?AssoCode=$Asso_code&LOCATION_NO=$Location_no&COMPANY_NO=$Company_no');
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
  }

  }





