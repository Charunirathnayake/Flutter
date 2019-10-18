import 'package:flutter/material.dart';
class Detail_Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return Detail_Screen_State();
  }

}
class Detail_Screen_State extends State<Detail_Screen>{
  static var _priyority=['High','Low'];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),

      ),
      body: ListView(children: <Widget>[
        ListTile(
          title: DropdownButton<String>(
            items:_priyority.map(
              (String dropDownStringItems){
                return DropdownMenuItem<String>(child: Text(
                  dropDownStringItems
                ),
                value: dropDownStringItems,);
              }
            ).toList() ,
          ),
        )
      ],),
      )
    ;
  }

}