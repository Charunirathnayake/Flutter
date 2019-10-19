import 'package:flutter/material.dart';
import 'package:sample_project08/screens/Screen.dart';
class Detail_Screen extends StatefulWidget{
  String appbartitle;
  Detail_Screen(this.appbartitle);
  @override
  State<StatefulWidget> createState() {
    
    return Detail_Screen_State(this.appbartitle);
  }

}
class Detail_Screen_State extends State<Detail_Screen>{
  static var _priyority=['High','Low'];
  TextEditingController titlecontroller=TextEditingController();
  TextEditingController descriptioncontroller=TextEditingController();
  String appbartitle;
  Detail_Screen_State(this.appbartitle);
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle=Theme.of(context).textTheme.title;
    
    return WillPopScope(
      onWillPop: (){
        movetolastscreen();
      },
   child: Scaffold(
      appBar: AppBar(
        title: Text('appbartitle'),
        leading: IconButton(icon: Icon(Icons.arrow_back),
        onPressed: (){
          movetolastscreen();
        },),

      ),
      body:Padding( 
        padding: EdgeInsets.only(top: 15.0,bottom: 15.0,left: 10.0,right: 10.0),
      child:ListView(children: <Widget>[
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
            style: textStyle,
            value: 'Low',
            onChanged: (valueselected){
              setState(() {
                debugPrint ("$valueselected");
                
              });
            },
          ),
          
          
        ),
        Padding(
        padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
      child:  TextField(
          controller: titlecontroller,
          style: textStyle,
          decoration: InputDecoration(
            labelText: 'Title',
            labelStyle: textStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            )
            
          ),
          onChanged: (value){
            setState(() {
             debugPrint("input"); 
            });
          },
        ),),
   Padding(
     padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
   child: TextField(
          controller: descriptioncontroller,
          style: textStyle,
          decoration: InputDecoration(
            labelText: 'Description',
            labelStyle: textStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            )
            
          ),
          onChanged: (value){
            setState(() {
             debugPrint("input"); 
            });
          },
        ),),
        Padding(
          padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
child:Row(
children: <Widget>[
  Expanded(
    child: RaisedButton(
      color: Theme.of(context).primaryColorDark,
      textColor: Theme.of(context).primaryColorLight,
      child: Text(
        'Save',textScaleFactor:1.5,
      ),
      onPressed: (){
        setState(() {
          debugPrint("Save Button Clicked");
        });
      },
    ),

  ),
Container(
width: 5.0,
),
Expanded(
    child: RaisedButton(
      color: Theme.of(context).primaryColorDark,
      textColor: Theme.of(context).primaryColorLight,
      child: Text(
        'Delete',textScaleFactor:1.5,
      ),
      onPressed: (){
        setState(() {
          debugPrint("Delete Button Clicked");
        });
      },
    ),

  )

],
  
)
)

      ],),)
      )
    );
  }
  void movetolastscreen(){
    Navigator.pop(context);
  }

}