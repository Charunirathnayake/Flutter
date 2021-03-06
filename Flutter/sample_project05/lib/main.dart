import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,title: "Stateful widget example",home: FavoriteCity(),
    )
  );
}
class FavoriteCity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return _FavoriteCityState();
  }

}
class _FavoriteCityState extends State<FavoriteCity>{
String nameOfCity="";
var _currencies=['Rupees','Dollors','Pounds','Other'];
String currentvalue="Rupees";

@override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Stateful widget example"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (String userinput){
                setState(() {
                  nameOfCity=userinput;
                });
              
              },
            ),

DropdownButton<String>(
  items: _currencies.map((String dropDownStringItem){
    return DropdownMenuItem<String>(
      value: dropDownStringItem,
      child:Text(dropDownStringItem),
    );
  }).toList(),
  onChanged: (String newselectedvalue){
    setState(() {
      this.currentvalue=newselectedvalue;
    });
  },
  value: currentvalue,

),
            Padding(
              padding: EdgeInsets.all(20.0),
            child: Text("Your best city is $nameOfCity",style:TextStyle(fontSize: 25.0),))
          ],
        ),
      ),
    );
  }


}