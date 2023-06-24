import 'package:animation_class/screen/view/home_screen.dart';
import 'package:animation_class/screen/view/view_screen.dart';
import 'package:flutter/material.dart';
void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => Home_Screen(),
        'vi':(context) => ViewScreen(),
      },
    )
  );
}