//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hr_eye/background.dart';
//import 'background.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size; //this size provide us total height and width of our screen
    return const Background(
      child: Stack(
        children: [


         Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text("Welcome to HR Eye",style: TextStyle(fontSize: 45),),
        ],
            ),
        ], ),);
  }
}








// child: Column(
//   children: <>[
//     Padding(
//       padding: const EdgeInsets.only(top: 1), //take space forom top
//       child: Row(
//         //mainAxisAlignment: MainAxisAlignment.center, // horizontally center
//         // crossAxisAlignment: CrossAxisAlignment.center, // vertically center
//         children: [
//           //HR eye heading
//           Text("HR EYE",
//             style: TextStyle(
//               color: Colors.blue[900],
//               fontSize: 45,
//               fontWeight: FontWeight.bold,
//               fontStyle:FontStyle.italic//font style
//             ),),
//           //HR EyE Image
//           /*Image(image: AssetImage('assets/images/eye.png'),
//             width: 100,
//             height: 100,
//             color: Colors.black,
//           ),*/
//         ],
//       ),
//     ),
//
//
//     Container(
//       //color: Colors.grey,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Colors.grey,
//       ),
//       child: ClipOval(
//         child: Image(image: AssetImage("assets/images/eye.png"),
//           width: 30,
//           height: 30,
//           color: Colors.black,
//         ),
//       ),
//     ),
//
//
//
//     Container(
//       margin: const EdgeInsets.only(left: 10,right: 10,top: 40),      /*taking space from outside*/
//       padding: EdgeInsets.only(left: 20,right: 20,top: 50),       /*taking space inside*/
//
//       /* styling of container */
//       decoration:BoxDecoration(
//         color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(10.0), //spacing from all side
//         child: Column(
//           children: [
//             TextFormField(
//               validator:(String? message){
//                 if(message!.isEmpty){
//                   return 'please enter name';
//                 }
//                 return null;
//               },
//               keyboardType: TextInputType.text,
//               style: TextStyle(fontWeight: FontWeight.w500),//input type
//               /*maxLength: 50,*/
//
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.person),  //user icon in textfield
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),),
//                   labelText: 'Enter Name',
//                   hintText: 'Enter Your Name'
//               ),
//             ),
//             SizedBox(height: 10), /*spacing between two fields*/
//             TextField(
//               style: TextStyle(fontWeight: FontWeight.w500),
//               obscureText: isobscureText,
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.lock),  //password icon in textfield
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),),
//                   suffixIcon: InkWell(
//                     onTap: _togglePasswordView, //method call togglepassword
//                       child: Icon(Icons.visibility,) //visible icon
//                   ),
//                   labelText: 'Password',
//                   hintText: 'Enter Password',
//               ),
//             ),
//             /*spacing between two fields*/
//             SizedBox(height: 10),
//             TextField(
//               style: TextStyle(fontWeight: FontWeight.w500),
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.network_check), //network icon in textfield
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),),
//                   labelText: 'Server Ip',
//                   hintText: 'Your Server Ip'
//               ),
//
//             ),
//
//             /*spacing between two fields*/
//             SizedBox(height: 10),
//           ButtonTheme(
//             child: TextButton(
//               onPressed: () {
//                 //_myFormkey.currentState?.validate();
//                 Navigator.push(context,  MaterialPageRoute(builder: (context) => DashboardScreen()), );
//               },
//               child: Text('Login'),
//               /* button styling */
//               style:ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo),
//                 foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                 elevation: MaterialStateProperty.all<double>(5),
//                 padding: MaterialStateProperty.all<EdgeInsets>(
//                   EdgeInsets.symmetric(horizontal: 120, vertical: 10),
//             ),
//           ),),
//             ),
//           ],
//         ),
//       ),
//     ),
//   ],
// ),


