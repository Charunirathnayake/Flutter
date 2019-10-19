import 'package:flutter/material.dart';
import 'package:sample_project08/screens/Screen.dart';
import 'package:sample_project08/screens/Detail_Screen.dart';

void main(){
  runApp(myapp());
}
 class myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notekeeper',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      
      ),
      home:NoteList(),
    );
  }

 }
 