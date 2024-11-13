//import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:marquee_text/marquee_text.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Text('HR EYE ',
            style:GoogleFonts.abyssinicaSil(textStyle: TextStyle(
              fontSize:25,
              color: Colors.white,
            ),) )
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        //color: Colors.indigo,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  /// horizontal marquee
                  SizedBox(
                    //width: double.infinity,
                    width: MediaQuery.of(context).size.width * .7, // Adjust the factor according to your preference
                    child: MarqueeText(
                      text: TextSpan(
                        text: 'Welcome Aditya Kumar into HR Eye Activity Portal',
                      ),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,
                      ),
                      speed: 10,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black, // You can set the color of the divider
              thickness: 1, // Adjust the thickness of the divider as needed
              ),
            Container(
              child: Table(
                  defaultColumnWidth:FixedColumnWidth(320),
                border: TableBorder.all(
                  color: Colors.black,
                    style: BorderStyle.solid,
                    width: 2
                ),
                children: [
                  TableRow(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.white,
                          elevation: 10,
                          child: Column(
                            children: [
                              ClipRect(
                                child: Image(image: AssetImage('assets/images/profile.png'),
                                  width: 50, // Width of the image
                                  height: 100, // Height of the image
                                  fit: BoxFit.cover,
                                  // BoxFit
                                ),
                              ),

                            ],
                          ),

                        ),
                      ),
                      /*Container(
                        height: 200,
                        width: 500,
                        padding: EdgeInsets.all(10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.white,
                          elevation: 10,
                          child: Column(
                            children: [
                              ClipOval(
                                child: Image(image: AssetImage('assets/images/profile.png'),
                                  width: 100, // Width of the image
                                  height: 100, // Height of the image
                                  fit: BoxFit.cover,
                                  // BoxFit
                                ),
                              ),

                            ],
                          ),

                        ),
                      ),*/
                    ]
                  ),
                  /*TableRow(
                      children: [
                        Container(
                          height: 200,
                          width: 200,
                          padding: EdgeInsets.all(10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            color: Colors.white,
                            elevation: 10,
                            child: Column(
                              children: [
                                ClipOval(
                                  child: Image(image: AssetImage('assets/images/profile.png'),
                                    width: 100, // Width of the image
                                    height: 100, // Height of the image
                                    fit: BoxFit.cover,
                                    // BoxFit
                                  ),
                                ),

                              ],
                            ),

                          ),
                        )
                      ]
                  ),*/
                ],
              ),
              
            ),




            //Image.asset('assets/images/dash.png')

          ],
        ),

      ),

    );
  }
}
