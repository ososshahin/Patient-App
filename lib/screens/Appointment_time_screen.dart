import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:intl/intl.dart';
import 'package:patient_app/screens/home_screen.dart';
import 'package:patient_app/screens/type_of_consultant_screen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import the package

class AppointmentTimeScreen extends StatefulWidget {
  static const String routeName = 'AppointmentTime';
  AppointmentTimeScreen({super.key});

  @override
  State<AppointmentTimeScreen> createState() => _AppointmentTimeScreenState();
}

class _AppointmentTimeScreenState extends State<AppointmentTimeScreen> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay? _selectedTime;
  List<bool> selections = [true, false];
  Color? AmColor;
  Color? PmColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          },
          child: Text(
            'X',
            style: TextStyle(fontSize: 25.sp, fontFamily: 'Epilogue'),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Schedule',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Epilogue',
          ),
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              leftChevronIcon: Icon(
                Icons.arrow_back_ios, // Custom left icon
                color: Colors.blue, // Icon color
                size: 18.sp, // Icon size
              ),
              rightChevronIcon: Icon(
                Icons.arrow_forward_ios, // Custom right icon
                color: Colors.blue, // Icon color
                size: 18.sp, // Icon size
              ),
              titleTextStyle: TextStyle(
                fontFamily: 'SfPro',
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle(
                fontFamily: 'SfPro',
                fontSize: 16.sp,
                color: Color(0xff3C3C434D),
              ),
              weekdayStyle: TextStyle(
                fontFamily: 'SfPro',
                fontSize: 16.sp,
                color: Color(0xff3C3C434D),
              ),
            ),
            calendarStyle: CalendarStyle(
              disabledTextStyle: TextStyle(
                fontSize: 20.sp,
                fontFamily: 'SfPro',
              ),
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
              ),
              todayTextStyle: TextStyle(
                color: Color(0xff007AFF),
                fontSize: 20.sp,
              ),
              weekendTextStyle: TextStyle(
                fontSize: 20.sp,
                fontFamily: 'SfProDisplay',
              ),
              defaultTextStyle: TextStyle(
                fontSize: 20.sp,
                fontFamily: 'SfProDisplay',
              ),
              selectedTextStyle: TextStyle(
                color: Color(0xff007AFF),
                fontSize: 24.sp,
              ),
              selectedDecoration: BoxDecoration(
                color: Color(0xffd9e8f8),
                shape: BoxShape.circle,
              ),
            ),
            focusedDay: _selectedDate,
            firstDay: DateTime.now(),
            lastDay: DateTime(2100),
            calendarFormat: CalendarFormat.month,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDate = selectedDay;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(day, _selectedDate);
            },
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Text(
                  'Choose time',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 30.w),
              InkWell(
                onTap: () {
                  selectTime(context);
                },
                child: Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Color(0xff787880).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  width: 60.w,
                  child: Center(
                    child: Text(
                      '${formatTime(_selectedTime ?? TimeOfDay.now())}',
                      style: TextStyle(
                        fontFamily: 'SfPro',
                        fontSize: 17.sp,
                        letterSpacing: -0.02,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              ToggleButtons(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Am',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      'Pm',
                      style: TextStyle(fontSize: 15.sp),
                    ),
                  ),
                ],
                fillColor: Colors.white, // Selected button background
                selectedColor: Colors.black, // Selected button text color
                borderColor: Colors.transparent, // Border for unselected
                selectedBorderColor: Colors.grey, // Border for selected
                color: Color(0xFF787880),
                borderWidth: 0.5,
                borderRadius: BorderRadius.circular(6.r),
                isSelected: selections,
                highlightColor: Colors.white,
                onPressed: (index) {
                  setState(() {
                    for (int i = 0; i < selections.length; i++) {
                      selections[i] = i == index;
                    }
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 280.h),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, TypeOfConsultantScreen.routeName);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 60.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff3898FC),
                    Color(0xff298AEF),
                    Color(0xff17FFF0)
                  ],
                ),
              ),
              child: Text(
                'Select this date',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? PickedTime = await showTimePicker(
        context: context, initialTime: _selectedTime ?? TimeOfDay.now());
    setState(() {
      _selectedTime = PickedTime ?? TimeOfDay.now();
    });
  }

  String formatTime(TimeOfDay time) {
    final now = DateTime.now();
    String formattedTime = DateFormat('hh:mm').format(
      DateTime(now.year, now.month, now.day, time.hour, time.minute),
    );
    return formattedTime;
  }
}
