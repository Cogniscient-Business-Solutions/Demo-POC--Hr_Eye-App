import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class LeaveCalendarScreen extends StatefulWidget {
  const LeaveCalendarScreen({super.key});

  @override
  State<LeaveCalendarScreen> createState() => _LeaveCalendarScreenState();
}

class _LeaveCalendarScreenState extends State<LeaveCalendarScreen> {
  DateTime today=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Text('Leave Calender',
            style: GoogleFonts.abhayaLibre(
              textStyle:TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,

              ),)),
      ),
      body: calender(),

    );
  }

  Widget calender(){
    return Column(
      children: [
        Container(
          child: TableCalendar(
            locale: "en_US",
            rowHeight: 38,
            headerStyle: HeaderStyle(formatButtonVisible: false,titleCentered: true,),
            availableGestures: AvailableGestures.all,
            focusedDay: today,
            firstDay: DateTime.utc(2010,10,16),
            lastDay: DateTime.utc(2030),
            onDaySelected: _ondayselected,
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
              defaultTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              weekendTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              weekendDecoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.rectangle,
              ),

            ),


          ),
        ),
        Divider(),
        Row(
          children: [
            Text("Leave Type  :",style: GoogleFonts.abhayaLibre(textStyle:TextStyle(
                fontSize: 23,
              color: Colors.blue.shade900
            ),) ),

          ],
        )
      ],
    );
  }

  void _ondayselected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      today=selectedDay;
    });
  }
}
