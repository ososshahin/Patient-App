import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import ScreenUtil
import 'package:patient_app/screens/AppointmentSet.dart';

class TypeOfConsultantScreen extends StatefulWidget {
  static const routeName = 'Type of consultant';
  @override
  _TypeOfConsultantScreenState createState() => _TypeOfConsultantScreenState();
}

class _TypeOfConsultantScreenState extends State<TypeOfConsultantScreen> {
  String? selectedOption;
  bool isContainervisisble = false;

  var options = [
    {'title': 'Consulting', 'Price': '230 L.E'},
    {'title': 'Examination', 'Price': '100 L.E'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 70.h, horizontal: 20.w), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                iconStyleData: IconStyleData(
                  icon: ImageIcon(AssetImage('assets/images/Expand Arrow.png')),
                  iconSize: 30.sp, // Responsive icon size
                  iconEnabledColor: Colors.white,
                ),
                isExpanded: true,
                hint: Text(
                  'Choose the type of consultant',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 18.sp, // Responsive font size
                  ),
                ),
                value: selectedOption,
                items: options.map((option) {
                  return DropdownMenuItem<String>(
                    value: option['title'],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          option['title']!,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 18.sp, // Responsive font size
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Text(
                            option['Price']!,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 18.sp, // Responsive font size
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedOption = value as String;
                    isContainervisisble = true;
                  });
                },
                buttonStyleData: ButtonStyleData(
                  height: 60.h, // Responsive height
                  width: 250.w, // Responsive width
                  padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Color(0xff3393F8),
                    borderRadius: BorderRadius.circular(12.r), // Responsive border radius
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200.h, // Responsive max height
                  decoration: BoxDecoration(
                    color: Color(0xff3393F8),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  offset: Offset(0, -10),
                ),
                menuItemStyleData: MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16.w), // Responsive padding
                ),
              ),
            ),
            SizedBox(height: 350.h),
            isContainervisisble
                ? Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Container(
                    height: 250.h, // Responsive height
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w), // Responsive padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cash Breakdown',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 20.sp, // Responsive font size
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            selectedOption ?? '',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 20.sp, // Responsive font size
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              Text(
                                'Fees',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 20.sp, // Responsive font size
                                ),
                              ),
                              SizedBox(width: 200.w),
                              Text(
                                '30 L.E',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 20.sp, // Responsive font size
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 30.h),
                          Row(
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 30.sp, // Responsive font size
                                ),
                              ),
                              SizedBox(width: 140.w),
                              Text(
                                '260 L.E',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 30.sp, // Responsive font size
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xff3393F8),
                      borderRadius: BorderRadius.circular(20.r), // Responsive border radius
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff3393F8),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, AppointmentSet.routeName);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 90.w, vertical: 5.h), // Responsive padding
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Inter',
                        fontSize: 20.sp, // Responsive font size
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
