import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hr_eye/SplashScreen.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Dashboard.dart';
import 'package:hr_eye/model/login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => LoginScreenState();
}
class LoginScreenState extends State<LoginScreen> {

  //var _myFormkey=GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController serverIpController = TextEditingController();
  static const String useridkey="userid";
  static const String passwordkey="password";
  static const String serveripkey="serverip";
  static const String associatecodekey="associatecode";
  static const String associatenamekey="associatename";
  static const String companynokey="company_no";
  static const String emailkey="email";
  static const String mobilekey="mobile";
  static const String locationnokey="locationno";
  static const String reportingkey="repotingperson";
  static const String Usersidkey="useridkey";
  //bool isPasswordObscure = true;
  bool isobscureText= true;

  var AssociateCode=' ';
  var AssociateName=' ';
  var Email=' ';
  var Mobile=' ';
  var Company_no=' ';
  String userName='';
  String password='';
  String serverip='http://hbmas.cogniscient.in/';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();
    serverip='http://hbmas.cogniscient.in/';
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size; //this size provide us total height and width of our screen
    final TextEditingController controller;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      //body: Body(),
      body:Container(
        width: double.infinity, //full width
        height: double.infinity, // full height
        color: Colors.white,
        child: Stack(
          children:<Widget> [
            //Image.asset('assets/images/hr.png',width: 300,height: 50,),
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('assets/images/topleft.png',width: size.width*0.3,),
            ),
            Positioned(
              bottom:0,
              left: 0,
              child: Image.asset('assets/images/bottomleft.png',width: size.width*0.2),
            ),
            Positioned(
              bottom:0,
              right: 0,
              child: Image.asset('assets/images/bottomright.png',width: size.width*0.4),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:180.0),
                        child: Row(
                          children: [
                            Text('HR EYE ',
                              style: TextStyle(
                                    color: Colors.blue.shade900,
                                    letterSpacing: 0 ,
                                    fontSize: 35,
                                    //decoration: TextDecoration.underline,   //text underscore
                                    fontWeight: FontWeight.bold,) ,),
                             Image.asset('assets/images/eye.png',height: 100,width: 100,
                             color: Colors.blue.shade900,),
                          ],
                        //
                      ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(  //for userid
                                margin: EdgeInsets.only(left: 30,right: 30,top: 30),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              //child of user id textfield
                                child: TextFormField(
                                  /*validator:(String? message){
                                    if(message!.isEmpty){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please enter Userid')));

                                      //return 'please enter Userid';
                                    }
                                   // return null;
                                  },*/
                                  controller: userIdController,
                                  //autovalidateMode: AutovalidateMode.always,
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(left: 8.0), // Adjust the padding as needed
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.blue.shade900, // Change to your desired color
                                      ),
                                    ),
                                    hintText: 'Enter user id',
                                    //labelText: "User id",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30,right: 30,top: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: TextFormField(
                                  obscureText: isobscureText,
                                 /* validator:(String? message){
                                    if(message!.isEmpty){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please enter Password')));

                                     // return 'please enter Password';
                                    }
                                    //return null;
                                  },*/
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(left: 8.0), // Adjust the padding as needed
                                      child: Icon(
                                        Icons.lock,
                                        color: Colors.blue.shade900, // Change to your desired color
                                      ),
                                    ),
                                    hintText: 'Password',
                                    border: InputBorder.none,
                                    suffixIcon: InkWell(
                                         onTap: _togglePasswordView, //method call togglepassword
                                        child: SizedBox(
                                          width: 10,
                                          child: Icon(Icons.visibility,),
                                        ) //visible icon
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 30,right: 30,top: 10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: TextFormField(
                                  /*validator:(String? message){
                                    if(message!.isEmpty){
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('please enter serverIp')));

                                     // return 'please enter serverIp';
                                    }
                                    //return null;
                                  },*/
                                  controller: serverIpController,
                                  decoration: InputDecoration(
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(left: 8.0), // Adjust the padding as needed
                                      child: Icon(
                                        Icons.network_check,
                                        color: Colors.blue.shade900, // Change to your desired color
                                      ),
                                    ),
                                    hintText: 'Company name',
                                    //labelText: "User id",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height* .062,
                                width: MediaQuery.of(context).size.width* .82,
                                child: Container(
                                  child: ButtonTheme(
                                    child: TextButton(
                                      onPressed: () async {
                                        // _formKey.currentState?.validate();
                                        userName = userIdController.text.toString();
                                        password = passwordController.text.toString();
                                        serverip = serverIpController.text.toString();
                                        var prefs = await SharedPreferences.getInstance();
                                        prefs.setString(useridkey, userName);
                                        prefs.setString(passwordkey, password);
                                        prefs.setString(serveripkey, serverip);
                                        prefs.setBool(SplashScreenState.KeyLogin, true);
                                         validate(userName,password,serverip);
                                       /* if (_formKey.currentState?.validate() ?? false) {
                                          CircularProgressIndicator(
                                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white));
                                              login(userName, password);

                                        }else{


                                        }*/
                                      },
                                      child: Text('Login'),
                                      /* button styling */
                                      style:ButtonStyle(

                                        //margin: EdgeInsets.only(left: 30,right: 30,),
                                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue.shade900),
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                        elevation: MaterialStateProperty.all<double>(5),
                                        /*padding: MaterialStateProperty.all<EdgeInsets>(
                                          EdgeInsets.symmetric(horizontal: 135, vertical: 10),
                                        ),*/
                                      ),),
                                  ),
                                ),

                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),],
              ),
            ),
          ],
        ),
      ) ,
    );
  }
void _togglePasswordView() {
    //password visible  $ invisible conditon
  /*if(isobscureText==true){
    isobscureText=false;
  }else{
    isobscureText=true;
  }*/ // Alternate solution
  setState(() {
    isobscureText=!isobscureText; //password visible and invisible
  });
}


 // void login(String userName, String password) {}
  Future<void>  login(String userName, String password) async {

    final String companyName = serverIpController.text;
    final String apiUrl = companyName+'HRLoginService/LoginService.svc/UserLogin';
    final Uri apiUri = Uri.parse('$apiUrl?UserName=$userName&Password=$password');
    try {
      final http.Response response = await http.get(apiUri);
      var responseData=jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
       loginmodel loginData=loginmodel.fromJson(responseData);
        print(responseData);
        if(loginData.loginUserResult!=" " && loginData.loginUserResult!.userDetails!=" "){
          String AssociateCode=loginData.loginUserResult!.userDetails?.loginName??"".toString();
          String AssociateName=loginData.loginUserResult!.userDetails?.userName??"".toString();
          String Email=loginData.loginUserResult!.userDetails?.email??"".toString();
          String Mobile=loginData.loginUserResult!.userDetails?.mOBILENO??"".toString();
          String Company_no=loginData.loginUserResult!.userDetails?.cOMPANYNO??"".toString();
          String currentstatus=loginData.loginUserResult!.userDetails?.currentStatus??"".toString();
          String expdays=loginData.loginUserResult!.userDetails?.eXPDAYS??"".toString();
          String flag=loginData.loginUserResult!.userDetails?.fLAG??"".toString();
          String image=loginData.loginUserResult!.userDetails?.iMAGE??"".toString();
          String location_no=loginData.loginUserResult!.userDetails?.lOCATIONNO??"".toString();
          String logintoken=loginData.loginUserResult!.userDetails?.loginToken??"".toString();
          String rep_person=loginData.loginUserResult!.userDetails?.rEPPERSON??"".toString();
          String sys_value=loginData.loginUserResult!.userDetails?.sYSVALUE??"".toString();
          String userid=loginData.loginUserResult!.userDetails?.userId??"".toString();

          UserDetails userDetails = UserDetails(
              userId: userid,
              userName: AssociateName,
              email: Email,
              mOBILENO: Mobile,
              cOMPANYNO: Company_no,
              loginName: AssociateCode,
              currentStatus:currentstatus,
              eXPDAYS:expdays,
              fLAG:flag,
              iMAGE:image,
              lOCATIONNO:location_no,
              loginToken:logintoken,
              rEPPERSON:rep_person,
              sYSVALUE:sys_value,
          );

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString(associatecodekey, AssociateCode);
          prefs.setString(associatenamekey, AssociateName);
          prefs.setString(emailkey, Email);
          prefs.setString(mobilekey, Mobile);
          prefs.setString(companynokey, Company_no);
          prefs.setString(locationnokey, location_no);
          prefs.setString(reportingkey, rep_person);
          prefs.setString(Usersidkey, userid);

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Dashboard( )));
          //userData: loginData
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successful')));
          }
        else {
          // Handle unsuccessful login
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid username or password')));
        }
        }

              else {
        // Handle errors like server not responding
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to connect to server')));
      }
    }
    catch (e) {
      // Handle other errors
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Server not found')));
    }
  //}






  /*void _updateButtonState() {
    setState(() {
       isButtonDisabled = userIdController.text.isEmpty ||
          passwordController.text.isEmpty ||
          serverIpController.text.isEmpty;
    });
  }*/
}
  Future<void> getvalue() async {
    var prefs=await SharedPreferences.getInstance();

    //var getuserid=prefs.getString(useridkey);
    //var getpassword=prefs.getString(passwordkey);
    var getserverip=prefs.getString(serveripkey);
    setState(() {
      //userIdController.text = userName ?? '';
      //passwordController.text = password ?? '';
      serverIpController.text = serverip ?? '';
    });
    //userName=getuserid.toString();
    //password=getpassword.toString();
    serverip=getserverip.toString();

  }

  void validate(String userName, String password, String serverip) {
    if(userName==''){

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter Userid')));
    }
    else if(password==''){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter password')));
    }
    else if(serverip==''){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter serverIp')));
    }
    else{
      login(userName,password);
    }


  }
}



