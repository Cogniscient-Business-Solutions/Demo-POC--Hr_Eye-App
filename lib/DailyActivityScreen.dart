import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_eye/DailyActivityDetails.dart';
import 'package:intl/intl.dart';

class DailyActivityScreen extends StatefulWidget {
  const DailyActivityScreen({super.key});

  @override
  State<DailyActivityScreen> createState() => DailyActivityScreenState();
}

class DailyActivityScreenState extends State<DailyActivityScreen> {
  String Date='Search activity';
  @override
  Widget build(BuildContext context) {
    //var floatingActionButtonLocation;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text('Activities',
            style: GoogleFonts.abhayaLibre(
              textStyle:TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),)),
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*.10,
            width: double.infinity,
            //color: Colors.lightBlue,
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                GestureDetector(
                onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
                );
                if (selectedDate != null) {
                  setState(() {
                    Date=DateFormat('dd/MM/yyyy').format(selectedDate);
                  });

                print('Selected date: $selectedDate');
                }
                },
                  child: Container(
                   // padding: EdgeInsets.only(left: 20),
                    height: 50,
                    width: MediaQuery.of(context).size.width*.60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2)
                    ),
                    child: Center(
                      child: Text(Date,
                        style:TextStyle(
                          fontSize: 16,
                          color: Colors.grey,

                        ) ,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.3,
                  height: MediaQuery.of(context).size.height*.06,
                  child: ElevatedButton(onPressed: () {  },
                    child: Text("Clear",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade900,
                        elevation: 2,

                      ),

                  ),
                )
              ],

            ),
          ),

          Divider(),
          Expanded(child: Text(""))


        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) =>DailyActivityDetails()));
          // Add your onPressed code here!
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add,
        color: Colors.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(19)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );

  }
}
