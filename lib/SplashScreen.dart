//import 'dart:async';
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hr_eye/Dashboard.dart';
//import 'LoginScreen.dart';
//import 'package:hr_eye/DashboardScreen.dart';
import 'package:hr_eye/LoginScreen.dart';
//import 'package:hr_eye/AttendanceScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashboardScreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation animation;

  static const String KeyLogin='login';

  @override
  void initState() {
    super.initState();
    controller=AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation=Tween(begin: 0.0,end: 140.0).animate(controller);
    controller.addListener(() {
      setState(() {

      });

    });
    controller.forward();
    whereToGo();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
      ),*/
      body: Container(
        color: Colors.blue.shade900,
        width: double.infinity,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360),
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/images/cbs logo.png",),

          )
      ),width: animation.value,
      height: animation.value,
        )
            /*Text("HR EYE",
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),),*/


          ],
        ),
      ),
    );
  }

  Future<void> whereToGo() async {
    var Sharedpref= await SharedPreferences.getInstance();
    var isloggedin= Sharedpref.getBool(KeyLogin);

    Timer(Duration(seconds: 4), () {
      if(isloggedin !=null ){
        if(isloggedin){
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Dashboard(),));
        }else{
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LoginScreen(),));
        }
      }
      else{
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => LoginScreen(),));


      }

    });
  }
}
