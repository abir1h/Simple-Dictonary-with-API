import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_dictionary/Dictionary.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:intl/intl.dart';


import 'fp_2.dart';
class calender extends StatefulWidget {
  @override
  _calenderState createState() => _calenderState();
}

class _calenderState extends State<calender> {

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  String formattedDate;
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>dictionary()));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff6C63FE),
          ),
        ),
        title: Text("Calender",
            style: GoogleFonts.lato(
              color: Color(0xff6C63FE),
              fontSize: 26,
              fontWeight: FontWeight.w900,
            )),

      ),
      body: Stack(
        children: [ Column(
          children: [
            TableCalendar(

              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,

              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                  formattedDate =
                      DateFormat.yMMMMd('en_US').format(focusedDay);
                });
                print(formattedDate);
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },

              //To style the Calendar
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Color(0xff6C63FE),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Color(0xff6C63FE),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ), fp(
            dockOffset:
            5.0, // Offset the dock from the edge depending on the 'dockType' property
            panelAnimDuration:
            300, // Duration for panel open and close animation
            panelAnimCurve:
            Curves.easeOut, // Curve for panel open and close animation
            dockAnimDuration:
            300, // Auto dock to the edge of screen - animation duration
            dockAnimCurve: Curves.easeOut, // Auto dock animation curve
            panelOpenOffset: 20.0,
            size: 70.0, // Size of single button in the panel
            iconSize: 24.0, // Size of icons
            borderWidth: 1.0,
            positionTop: 0.0, // Initial Top Position
            positionLeft: 0.0,
            backgroundColor: Colors.indigoAccent,
            contentColor: Colors.white,
            panelIcon: Icons.menu_open,
            onPressed: (index) {
              //onpress action which gives pressed button index
              print(index);
              if (index == 0) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => dictionary()));
              }
            },
            buttons: [
              // Add Icons to the buttons list.
              Icons.home,
              //add more buttons here
            ])],
      ),
    ));
  }
}
