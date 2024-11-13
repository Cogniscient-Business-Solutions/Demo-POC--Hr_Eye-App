import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class DailyActivityDetails extends StatefulWidget {
  const DailyActivityDetails({super.key});

  @override
  State<DailyActivityDetails> createState() => DailyActivityDetailsState();
}
class DailyActivityDetailsState extends State<DailyActivityDetails> {
  String ActivityDate='Select Date';
  //String ToDate='Select Date';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text('Daily Activity',
            style: GoogleFonts.abhayaLibre(
              textStyle:TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),)),
        actions: [IconButton(
          icon: Icon(
            Icons.add,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () {
            //showAlert();
          },
        ),
          IconButton(
            icon: Icon(
              Icons.save_alt,
              size: 30.0,
              color: Colors.white,
            ),
            onPressed: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
                //userData: userData
              );*/
            },
          ),

        ],
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8,top: 8),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*.35,
                  child: Text("Activity Date :",
                      style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                        color: Colors.blue.shade900,) )),
                ),
                SizedBox(width: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.55,
                  child:  Container(
                    height: MediaQuery.of(context).size.height*.05,
                    //width: double.infinity,
                    //color: Colors.lightBlue,
                    child: Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 10)),
                        GestureDetector(
                          onTap: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2101),
                            );
                            if (selectedDate != null) {
                              setState(() {
                                ActivityDate=DateFormat('dd/MM/yyyy').format(selectedDate);
                              });

                             // print('Selected date: $selectedDate');
                            }
                          },
                          child: Container(
                            // padding: EdgeInsets.only(left: 20),
                            height: 50,
                            width: MediaQuery.of(context).size.width*.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: .5)
                            ),
                            child: Center(
                              child: Text(ActivityDate,
                                style:TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400

                                ) ,
                              ),
                            ),
                          ),
                        ),
                        //SizedBox(width: 5,),

                      ],

                    ),
                  ),
                    )

              ],
            ),
          ),
         // SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*.35,
                  child: Text("Total Hours :",
                      style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                        color: Colors.blue.shade900,) )),
                ),
                SizedBox(width: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width*.5,
                  child:  Container(
                    height: MediaQuery.of(context).size.height*.05,
                    child:Container(
                             padding: EdgeInsets.only(left: 20),
                            height: 50,
                            width: MediaQuery.of(context).size.width*.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(width: .5)
                            ),
                            child: Center(
                              child: Text("",
                                style:TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400

                                ) ,
                              ),
                            ),
                          ),
                        ),
                        //SizedBox(width: 5,),




                )

              ],
            ),
          ),
          Divider(color: Colors.blue.shade900,),
          Text("-- Click on plus(+) button --",style: TextStyle(color: Colors.grey),),
          Text("-- To fill your daily Activity Report --",style: TextStyle(color: Colors.grey),)
          


        ],
      ),

    );
  }

 /* void dialogPopUp(String s) {
    showDialog(
        context: context, 
        builder: (context){
          return StatefulBuilder(builder: (context,setStateForDialog){
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
              scrollable: true,
              title: Container(
                height: 20,
                color: Colors.lightBlue,

                  child: Text("activity",textAlign: TextAlign.center,)),
              //contentPadding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
              content: Column(
                children: [

                ],
              ),
            );
            
          });
          
        });
  }*/
}
