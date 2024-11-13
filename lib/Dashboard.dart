import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_eye/ProfileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AttendanceRecordsScreen.dart';
import 'AttendanceScreen.dart';
import 'BirthdayScreen.dart';
import 'DailyActivityScreen.dart';
import 'HolidayListScreen.dart';
import 'LeaveCalendarScreen.dart';
import 'LeaveScreen.dart';
import 'LeaveStatusScreen.dart';
import 'LoginScreen.dart';
import 'NewJoiningScreen.dart';
import 'ProfileScreen.dart';
import 'SalarySlipScreen.dart';
import 'SplashScreen.dart';
import 'TravelRequestScreen.dart';
import 'package:hr_eye/NotificationScreen.dart';
import 'model/login_model.dart';

class Dashboard extends StatefulWidget { //MARK:- when i want to change any thing at runtime then we use statefulwidget


  @override
  State<Dashboard> createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  String AssociateCode = '';
  String AssociateName = '';
  String Email = '';
  String Mobile = '';
  String Company_no = '';
  String Location_no = '';
  String server_ip=' ';
  void initState()  { // MArk :- when anything execute at screen load then we use initsate.
    // TODO: implement initState
    super.initState();
    receiveUserData(); // Mark:- REceive data using function /method

  }
// Mark:- function details for retrive data from sharedprefreces
  Future<void> receiveUserData() async {  // Mark:- async and await  is used when we take time i.e waiting for retrive detials
    var prefs = await SharedPreferences.getInstance(); // Mark :- store  data in variable of  sharedprefrence
    var getAssociateCode=prefs.getString(LoginScreenState.associatecodekey); // Marks:- store data in a varibles
    var getAssociateName=prefs.getString(LoginScreenState.associatenamekey);
    var getEmail=prefs.getString(LoginScreenState.emailkey);
    var getMobile=prefs.getString(LoginScreenState.mobilekey);
    var getCompanyNo=prefs.getString(LoginScreenState.companynokey);
    var getLocationNo=prefs.getString(LoginScreenState.locationnokey);
    var getServerIP=prefs.getString(LoginScreenState.serveripkey);

    // Marks :-  Store data in a string

    setState(() {
      AssociateCode=getAssociateCode??' ';
      AssociateName=getAssociateName??' ';
      Email=getEmail??' ';
      Mobile=getMobile??' ';
      Company_no=getCompanyNo??' ';
      Location_no=getLocationNo??' ';
      server_ip=getServerIP??' ';
    });


  }
  /*final loginmodel userData;

  Dashboard({required this.userData});*/
  var height,width;
// Marks :- Store images in a list
  List imgData=[
    "assets/images/profile.png", //profile
    "assets/images/dailyActivity.png", //daily Activity
    "assets/images/leave.png",  //leave
    "assets/images/calender.png", //leave calender
    "assets/images/status.png",  //leave status
    "assets/images/holiday_list.png",  //holiday list
    "assets/images/birthday1.png",  //birthday
    "assets/images/new_joining.png",  //new joining
    "assets/images/attendence1.png", //attendence
    "assets/images/attendence_record.png",  //attendence record
    "assets/images/salary.png", //salary slip
    "assets/images/travel.png", //travel request

  ];
 // MArks :- Strore title of screen in a list
  List titles=[
    "My Profile",
    "Daliy Activity",
    "Leave",
    "Leave Calender",
    "Leave Status",
    "Holiday List",
    "Birthday",
    "New Joining",
    "Attendence",
    "Attend. Record",
    "Salary Slip",
    "Travel Request"
  ];
//Marks :- store  screens in a list
  /*List<Widget> screens = [
    ProfileScreen( userData: userData),
    DailyActivityScreen(),
    LeaveScreen(),
    LeaveCalendarScreen(),
    LeaveStatusScreen(),
    HolidayListScreen(),
    BirthdayScreen(),
    NewJoiningScreen(),
    AttendanceScreen(),
    AttendanceRecordsScreen(),
    SalarySlipScreen(),
    TravelRequestScreen(),
  ];*/
  @override
  // Marks :-  Desiging portion
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height; // Marks :- height accoring to screen size. i.e it takes full height
    width=MediaQuery.of(context).size.width; // MArks :- width according to scrren
    return Scaffold(
      body: Container( // Marks:- cover full body in container
        color: Colors.white,
        //color: Colors.blue.shade900,
        height: height,
        width: width,

        child: Column(
          children: [
            Container(
              height: height*0.10, //Marks:- it takes 1/4th of height
              width: width, //Marks :- it takes full width
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned( // Marks:- set icon position
                    top: 30 ,
                      right: 35,
                      child: IconButton(
                          icon: Icon(
                            Icons.notifications,
                              size: 20.0,
                              color: Colors.white,
                    ),
                    onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context)=>notification()));

                      },
                  )),
                  Positioned(
                    top: 30,
                      right: 5,
                      child: IconButton(
                        icon: Icon(
                      Icons.logout_outlined,
                      size: 20.0,
                      color: Colors.white,

                    ), onPressed: () async {
                        var prefs = await SharedPreferences.getInstance();
                        prefs.setBool(SplashScreenState.KeyLogin, false);
                        await prefs.clear();

                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                        // logout(context);
                        // Marks:- toasting message
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Logout')));

                      },
                  )),
                  Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top:38,left: 10,right: 15),
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              /*child: InkWell(
                                onTap: () {},
                                child: Ink(

                                ),
                              ),*/
                              decoration: BoxDecoration(
                                  border: Border.all(width: 4,
                                    color: Colors.white,
                                  ),
                                  boxShadow:[ BoxShadow(
                                      spreadRadius: 2,
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(0.1)
                                  )],
                                  shape: BoxShape.circle,
                                  /*image: DecorationImage(
                                      fit: BoxFit.cover, image: AssetImage('assets/images/profile.png')
                                  )*/
                              ),
                              child: IconButton(
                                padding: EdgeInsets.only(top: 0),
                                icon: Icon(Icons.person,
                                  color: Colors.white,
                                size: 16,),
                                onPressed:()  {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                                    //userData: userData
                                  );

                                },
                              ),
                            ),
                            SizedBox(width: 20,),

                            Text("Hi ${AssociateName}",style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),

                            ),),
                            SizedBox(width: 10,),
                            //Image(image: AssetImage('assets/images/eye.png'),height: 70,width: 70,color: Colors.white,),

                           ],
                        ),
                      )
                    ],
                  )
                ],
              ),


              // heading part


            ),
            Container(
                child:  SingleChildScrollView(
                  child: Container( //dashboard part
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    height: height*0.85,
                    width: width,
                    // padding: EdgeInsets.only(bottom:30),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 10,
                    ),
                        shrinkWrap: true,
                        //physics: NeverScrollableScrollPhysics(),
                        itemCount: imgData.length,
                        itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){
                              // Navigate to the screen based on the title
                              navigateToScreen(context, index);
                             /* Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => screens[index]),
                              );*/
                              },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(imgData[index],width: 100,height: 100,),
                                  Text(titles[index],
                                    style:GoogleFonts.adamina(textStyle:TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ))
                                    /*TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    )*/
                                    ,)],),),);}),),))],),),
    );
  }

  void navigateToScreen(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
          //userData: userData
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DailyActivityScreen(),),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LeaveScreen(),),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LeaveCalendarScreen(),),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LeaveStatusScreen(),),
        );
        break;
      case 5:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HolidayListScreen(),),
        );
        break;
      case 6:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BirthdayScreen(),),
        );
        break;
      case 7:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewJoiningScreen(),),
        );
        break;
      case 8:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AttendanceScreen(),),
        );
        break;
      case 9:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AttendanceRecordsScreen(),),
        );
        break;
      case 10:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SalarySlipScreen(),),
        );
        break;
      case 11:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TravelRequestScreen(),),
        );
        break;
      // case 12:
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => ProfileScreen(userData: userData)),
      //   );
      //   break;
      // case 13:
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => DailyActivityScreen(),),
      //   );
      //   break;
      // case 14:
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => DailyActivityScreen(),),
      //   );
      //   break;
    // Add cases for other screens...
      default:
        break;
    }
  }

  /*void logout(BuildContext context) {
    clearSharedPreference();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }*/

  Future<void> clearSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    receiveUserData();
    /*await preferences.remove(AssociateCode);
    await preferences.remove(AssociateName);
    await preferences.remove(server_ip);*/
    /*preferences.setBool(
        SplashScreenState.KeyLogin, false);*/

  }
}
