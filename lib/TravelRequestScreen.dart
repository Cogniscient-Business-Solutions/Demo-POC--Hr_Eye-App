import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelRequestScreen extends StatelessWidget {
  const TravelRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text('Travel Request',
            style: GoogleFonts.abhayaLibre(
              textStyle:TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),)),
      ),
    );
  }
}
