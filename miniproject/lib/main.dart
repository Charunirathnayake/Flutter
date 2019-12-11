import 'package:flutter/material.dart';
import 'package:miniproject/app_screen/Login.dart';
import 'package:miniproject/app_screen/home.dart';
import 'package:miniproject/app_screen/search.dart';
void main(){
  runApp(
    MaterialApp(
      home: LoginInterface(),
      debugShowCheckedModeBanner: false,
    )
  );
}
