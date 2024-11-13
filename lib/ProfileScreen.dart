//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_eye/ChangePasswordScreen.dart';
//import 'package:hr_eye/Dashboard.dart';
import 'package:hr_eye/LoginScreen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:hr_eye/model/login_model.dart';
//import 'model/login_model.dart';

class ProfileScreen extends StatefulWidget {

  /*final loginmodel userData;

  ProfileScreen({required this.userData});*/

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  //late File imagefile;

  String AssociateCode = '';
  String AssociateName = '';
  String Email = '';
  String Mobile = '';
  String Company_no = '';
  String Location_no = '';
  String Reporting_person='';
  bool isObscurePassword=true;
  //final picker=ImagePicker();

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    receiveUserData();
  }
  void imagePickerOption(){

  }

  Future<void> receiveUserData() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      var getAssociateCode=prefs.getString(LoginScreenState.associatecodekey);
      var getAssociateName=prefs.getString(LoginScreenState.associatenamekey);
      var getEmail=prefs.getString(LoginScreenState.emailkey);
      var getMobile=prefs.getString(LoginScreenState.mobilekey);
      var getCompanyNo=prefs.getString(LoginScreenState.companynokey);
      var getLocationNo=prefs.getString(LoginScreenState.locationnokey);
      var getReportingPerson=prefs.getString(LoginScreenState.reportingkey);
      AssociateCode=getAssociateCode.toString();
      AssociateName=getAssociateName.toString();
      Email=getEmail.toString();
      Mobile=getMobile.toString();
      Company_no=getCompanyNo.toString();
      Location_no=getLocationNo.toString();
      Reporting_person=getReportingPerson.toString();

    });
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
        title: Text('My Profile',
            style: GoogleFonts.abhayaLibre(
              textStyle:TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),)),
        actions:[ IconButton(
          icon: Icon(
            Icons.settings,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
              //userData: userData
            );
           },
        ),]
      ),
      body:Container(
        padding: EdgeInsets.only(left: 15,top: 20,right: 15),
        child: GestureDetector(
          onTap: (){
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      // width: 130,
                      // height: 130,
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/images/profile.png'),
                      ),
                      /*decoration: BoxDecoration(
                        border: Border.all(width: 4,
                          color: Colors.white,
                        ),
                        boxShadow:[ BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1)
                        )],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage('assets/images/profile.png')
                        )
                      ),*/
                    ),
                    Positioned(
                      bottom: 0,
                        right: 0,
                        child: Container(
                      height: 40,
                        width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white
                            ),
                            color: Colors.blue.shade900
                          ),
                          child: IconButton(
                            padding: EdgeInsets.only(top: 0),
                            icon: Icon(Icons.camera_alt,
                            color: Colors.white,),
                            onPressed:()  {



                            },
                          ),
                    ))
                  ],
                ),
              ),
              SizedBox(height: 30,),
              buildTextField("Associate Code", AssociateCode, false),
              buildTextField("Associate Name", AssociateName, false),
              buildTextField("Email", Email, false),
              buildTextField("Mobile Number", Mobile, false),
              buildTextField("Reporting Person", Reporting_person, false),
              buildTextField("Company Location", Location_no, false),



            ],
          ),
        ),
      )

      ,
    );
  }
  /*Widget buttomsheet(){

  }*/

  Widget buildTextField(String labelText,String placeholder,bool isPasswordTextField){
    return Padding(padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword:false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField ?
              IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye)):null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          labelStyle: TextStyle(
            fontSize: 20
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black)
        ),
        textAlign: TextAlign.right,
        enabled: false,
      ),
    );
  }


}
