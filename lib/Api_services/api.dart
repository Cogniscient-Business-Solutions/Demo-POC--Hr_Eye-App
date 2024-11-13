
import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../LoginScreen.dart';

class ApiServices{

  String LoginName = '';
  String Location_no = '';
  String Company_no = ' ';
  String ServerIp = '';
  String errorMessage = '';
  //getprefrencedata();

 Future<void> getprefrencedata() async {
   var prefs = await SharedPreferences.getInstance();
   var getLoginName = prefs.getString(LoginScreenState.associatecodekey);
   var getLocationNo = prefs.getString(LoginScreenState.locationnokey);
   var getCompanyN0 = prefs.getString(LoginScreenState.companynokey);
   var getServerIp = prefs.getString(LoginScreenState.serveripkey);
   LoginName = getLoginName.toString();
   Location_no = getLocationNo.toString();
   Company_no = getCompanyN0.toString();
   ServerIp = getServerIp.toString();

   newjoiningdetails(LoginName,Location_no,Company_no );
  // print(newjoiningdata.toString());
 }




  Future<dynamic> newjoiningdetails(String loginName, String location_no, String company_no) async {
    final String apiUrl = ServerIp + 'HRLoginService/LoginService.svc/GetNewJoiningDetail';
    final Uri apiUri = Uri.parse('$apiUrl?LoginName=$LoginName&LOCATION_NO=$Location_no&COMPANY_NO=$Company_no');
    final http.Response response = await http.get(apiUri);
    if(response.statusCode == 200){
      final model=jsonDecode(response.body);
      return model;


    // *//*//*/Newjoining_model data=Newjoining_model.fromJson(json.decode(response.body));
    // //var newjoiningdata=jsonDecode(response.body.toString());
    // //print(data);*//*

  }




  }

  // Future<void> getprefrencedata() async {
  //   var prefs = await SharedPreferences.getInstance();
  //   var getLoginName = prefs.getString(LoginScreenState.associatecodekey);
  //   var getLocationNo = prefs.getString(LoginScreenState.locationnokey);
  //   var getCompanyN0 = prefs.getString(LoginScreenState.companynokey);
  //   var getServerIp = prefs.getString(LoginScreenState.serveripkey);
  //   LoginName = getLoginName.toString();
  //   Location_no = getLocationNo.toString();
  //   Company_no = getCompanyN0.toString();
  //   ServerIp = getServerIp.toString();
  //
  //   newjoiningdetails(LoginName,Location_no,Company_no );
  //   // print(newjoiningdata.toString());
  // }


}




