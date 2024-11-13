import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
//import 'package:get/get_connect/http/src/response/response.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginScreen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => ChangePasswordScreenState();
}

class ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController oldpasswordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController retypepasswordController=TextEditingController();

  bool isobscureText= true;
  String AssociateCode='';
  String Company_no='';
  String Location_no='';
  String ServerIp='';
  String OldPassword='';
  String NewPassword='';
  String RetypePassword='';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    receiveUserData();

  }
  Future<void> receiveUserData() async {    //MArk :-  method definition of shareprefrence
    var prefs = await SharedPreferences.getInstance();
    var getAssociateCode=prefs.getString(LoginScreenState.associatecodekey);
    var getCompanyNo=prefs.getString(LoginScreenState.companynokey);
    var getLocationNo=prefs.getString(LoginScreenState.locationnokey);
    var getServerIp=prefs.getString(LoginScreenState.serveripkey);
    AssociateCode=getAssociateCode.toString(); // MArks :- store details which is getting by sharedprefrences
    Company_no=getCompanyNo.toString();
    Location_no=getLocationNo.toString();
    ServerIp=getServerIp.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue.shade900, //change your color here
        ),
        backgroundColor: Colors.white,
        //centerTitle: true,
        /*title: Text('Change Password ',
            style: GoogleFonts.abhayaLibre(
              textStyle:TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),)),*/
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*.25,
                //color: Colors.grey,
                child: Center(
                  child: Image.asset("assets/images/lock1.png",height: 150,width: 150,),
                ),
              ),
              SizedBox(height: 5,),
              Container(
                //color: Colors.grey,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left:12.0),
                        child: Text("Change Password",
                            style:GoogleFonts.abhayaLibre(textStyle:TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade900
                            ),) ),
                      ),
                      
                    ],
                  ),

              ),
              SizedBox(height: 5,),
              Container(
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(  //for old password
                          margin: EdgeInsets.only(left: 30,right: 30,top: 30),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          //child of user id textfield
                          child: TextFormField(
                            controller: oldpasswordController,
                            obscureText: isobscureText,
                            //controller: userIdController,
                            //autovalidateMode: AutovalidateMode.always,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 8.0), // Adjust the padding as needed
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.blue.shade900, // Change to your desired color
                                ),
                              ),
                              hintText: 'Old Password',
                              //labelText: "User id",
                              border: InputBorder.none,
                              suffixIcon: InkWell(
                                  onTap: _togglePasswordView, //method call togglepassword
                                  child: SizedBox(
                                    width: 10,
                                    child: Icon(Icons.visibility,color: Colors.blue.shade900,),
                                  ) //visible icon
                              ),
                            ),
                          ),
                        ),
                        Container(  //for userid
                          margin: EdgeInsets.only(left: 30,right: 30,top: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          //child of user id textfield
                          child: TextFormField(
                            obscureText: isobscureText,
                            controller: newpasswordController,
                            //controller: userIdController,
                            //autovalidateMode: AutovalidateMode.always,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 8.0), // Adjust the padding as needed
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.blue.shade900, // Change to your desired color
                                ),
                              ),
                              hintText: 'New Password',
                              //labelText: "User id",
                              border: InputBorder.none,
                              suffixIcon: InkWell(
                                  onTap: _togglePasswordView, //method call togglepassword
                                  child: SizedBox(
                                    width: 10,
                                    child: Icon(Icons.visibility,color: Colors.blue.shade900,),
                                  ) //visible icon
                              ),
                            ),
                          ),
                        ),
                        Container(  //for userid
                          margin: EdgeInsets.only(left: 30,right: 30,top: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          //child of user id textfield
                          child: TextFormField(
                            //obscureText: isobscureText,
                            controller: retypepasswordController,
                            //controller: userIdController,
                            //autovalidateMode: AutovalidateMode.always,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 8.0), // Adjust the padding as needed
                                child: Icon(
                                  Icons.lock,
                                  color: Colors.blue.shade900, // Change to your desired color
                                ),
                              ),
                              hintText: 'Retype Password',
                              //labelText: "User id",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width*.85,
                          height: MediaQuery.of(context).size.height*.06,
        
                          child: ElevatedButton(
                            onPressed: () async{
                              OldPassword=oldpasswordController.text.toString();
                              NewPassword=newpasswordController.text.toString();
                              RetypePassword=retypepasswordController.text.toString();
                              isvalidate(OldPassword,NewPassword,RetypePassword);
                            },
                            child: Text("Change Password",
                              style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),),
                            style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade900,
                          ),
                          ),
                        )
                      ],
        
                    )),)
              
            ],
          ),

        ),
      ),

    );
  }

  void _togglePasswordView() {
    setState(() {
      isobscureText=!isobscureText; //password visible and invisible
    });
  }
  void _togglePasswordView1() {
    setState(() {
      isobscureText=!isobscureText; //password visible and invisible
    });}

  void isvalidate(String oldPassword, String newPassword, String retypePassword) {
    /*if(oldPassword=='' || newPassword=='' || retypePassword==''){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Fill all fields')));
    }*/
    if(oldPassword==''){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter old password')));
    }
    else if(newPassword==''){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter new password')));
    }
    else if(retypePassword==''){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter new password again')));
    }
    else if(newPassword!=retypePassword){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password mismatched ! try again')));
    }
    else{
      changePassword();
    }

  }

  Future<void> changePassword() async {
    var Url=ServerIp+'GetLeaveCalendar/Service1.svc/ModifyPassword';
    var param={
      "COMPANY_NO":Company_no,
      "LOCATION_NO":Location_no,
      "ASSO_CODE":AssociateCode,
      "OLD_PASSWORD":OldPassword,
      "NEW_PASSWORD":NewPassword
    };
    var Passwordbody=json.encode(param);
    var passwordUrl=Uri.parse(Url);
    http.Response response=await http.post(
        passwordUrl,
        body: Passwordbody,
        headers: {
          //"Content-Type":"application/json"
          "Content-Type":"application/javascript"
        }
    );
    var passwordData=jsonDecode(response.body);
    print(passwordData);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password successfully changed')));
    gotologin();


    // var punchInBody=json.encode(punchIn);

  }

  void gotologin() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }


}
