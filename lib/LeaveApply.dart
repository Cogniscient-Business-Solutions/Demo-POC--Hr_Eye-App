import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class LeaveApplyScreen extends StatefulWidget {
  const LeaveApplyScreen({super.key});

  @override
  State<LeaveApplyScreen> createState() => LeaveApplyScreenState();
}

class LeaveApplyScreenState extends State<LeaveApplyScreen> {
  String FromDate='Select Date';
  String ToDate='Select Date';
  String Session1='Select Session';
  String Session2='Select Session';
  String LeaveType="select";
  String? valueChoose; // Allow valueChoose to be null
  List<String> listItem = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  final List<String> LeaveTypeList=<String>[
    'CASUAL LEAVE',
    'EARNED LEAVE',
    'SPECIAL LEAVE',
    'COMPANSATORY LEAVE',
    'LEAVE WITHOUT PAY',
    'ABSENT',
    'NOT PUNCHED(ABSENT)',
    'EXTRA WORKING',
    'OUTSTATION DUTY'
  ];
  var Session=[
    'Whole Day',
    'First Session',
    'Second Session'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text('Apply Leave',
            style: GoogleFonts.abhayaLibre(
              textStyle:TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),)),
      ),
      body: Column(
        children: [
          //Marks :- Container for ass.name and rep.person
          Column(
            children: [
              //MArks :- Row container for ASSOCIate NAme
              Row(
                children: [
                  Padding( //Marks for Spaceing
                    padding: const EdgeInsets.only(top: 15.0,left: 15),
                    child: Container(
                      //color: Colors.blue.shade900,
                      width: MediaQuery.of(context).size.width*.40, //MArks :- take space 1/4th of width
                      child: Text("Associate Name    : ",
                          style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                            color: Colors.blue.shade900,) )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,top: 15),
                    child: Text("Aditya",style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                    ) )),
                  )
                ],
              ),
              Row(// Marks Reporting person
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text("Reporting Person : ",style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                      color: Colors.blue.shade900,) )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text("Aditya",style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,)
                    ),),
                  )
                ],
              ),
            ],
            
          ),
          Divider(),
          Row(
            children: [
              //Text("Leave Type  ",style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                //color: Colors.blue.shade900,))),
              SizedBox(width: 10,),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: DropdownButtonFormField<String>(
                  value: valueChoose,
                  hint: Text('Select an option'),
                  onChanged: (String? newValue) {
                    setState(() {
                      valueChoose = newValue;
                    });
                  },
                  validator: (String? value) {
                    if (value == null) {
                      return 'Please select an option';
                    }
                    return null;
                  },
                  items: listItem.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              )


              /*Padding(padding: EdgeInsets.only(left: 5),
                child: DropdownButtonFormField(
                  value: LeaveType,
                  items: LeaveTypeList.map((String item){
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      LeaveType=value!;
                    });
                  },

                ),

              )*/

              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blue,
                  width: MediaQuery.of(context).size.width*.40,
                  child:DropdownButton<String>(
                    isExpanded: true,
                    hint: Text("Select Leave"),
                      value: LeaveType,
                      icon: Icon(Icons.keyboard_arrow_down),
                    items: LeaveTypeList.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),

                    onChanged: (String? value) {
                      setState(() {
                        LeaveType = value!;
                      });
                    },

                ),
              )


              )*/
            ],
          ),
          SizedBox(height: 10,),
          // Marks Balanced
          /*Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  //color: Colors.blue.shade900,
                  width: MediaQuery.of(context).size.width*.40,
                  child: Text("Balanced  ",style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                    color: Colors.blue.shade900,) )),
                ),
              ),



            ],
          ),*/
          SizedBox(height: 20,),
          // Marks Date To and From
          Row(
            children: [

              // Marks :- From date Container
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  children: [
                    Text("From Date  ",style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                      color: Colors.blue.shade900,) )),
                    Container(
                      height: MediaQuery.of(context).size.height*.10,
                      //width: double.infinity,
                      //color: Colors.lightBlue,
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(left: 15)),
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
                                  FromDate=DateFormat('dd/MM/yyyy').format(selectedDate);
                                });
                                //print('Selected date: $selectedDate');
                              }
                            },
                            child: Container(
                              // padding: EdgeInsets.only(left: 20),
                              height: 50,
                              width: MediaQuery.of(context).size.width*.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(width: .5)
                              ),
                              child: Center(
                                child: Text(FromDate,
                                  style:TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400


                                  ) ,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),

                        ],

                      ),
                    ),

                  ],
                ),
              ),

              //SizedBox(width: 10,),

              // Marks : - To Date Container
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child:  Container(
                  //color: Colors.blue.shade900,
                 width: MediaQuery.of(context).size.width*.45,
                  child: Column(
                    children: [
                      Text("To Date  ",style:GoogleFonts.abhayaLibre(textStyle:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
                        color: Colors.blue.shade900,) )),
                      Container(
                        height: MediaQuery.of(context).size.height*.10,
                        width: double.infinity,
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
                                    ToDate=DateFormat('dd/MM/yyyy').format(selectedDate);
                                  });

                                  print('Selected date: $selectedDate');
                                }
                              },
                              child: Container(
                                // padding: EdgeInsets.only(left: 20),
                                height: 50,
                                width: MediaQuery.of(context).size.width*.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(width: .5)
                                ),
                                child: Center(
                                  child: Text(ToDate,
                                    style:TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400

                                    ) ,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 5,),

                          ],

                        ),
                      ),

                    ],
                  ),
                ),
              ),



            ],
          ),
          SizedBox(height: 20,),



          
        ],
        
      )

    );
  }
}
