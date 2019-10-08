import 'package:flutter/material.dart';
void main(){
runApp(
  MaterialApp(
    debugShowCheckedModeBanner:false,
    theme: ThemeData(
      primaryColor: Colors.indigo,
      accentColor: Colors.indigoAccent,
      brightness: Brightness.dark,
    ),
    title: "Simple Interest App",
    home: SIform(),
  )
);
}
class SIform extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return _SIformState();
  }

}
class _SIformState extends State<SIform>{
  var _currencies=['Ruppes','Dollar','Pounds','others'];
  String currentvalue="Ruppes";

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle=Theme.of(context).textTheme.title;
    
    return Scaffold(
      //resizeToAvoidBottomPadding:false ,
      appBar: AppBar(
        title: Text("Simple interst App"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
           Padding(
             padding: EdgeInsets.only(top:10.0,bottom: 10.0),
             child:TextField(
               style: textStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Principal',
                labelStyle: textStyle,
                hintText: 'Enter principal EX:120000',
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(5.0)
                )
                ),
            ),
           ) ,

           Padding(
             padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
             child:TextField(
               style: textStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Rate of interest',
                labelStyle: textStyle,
                hintText: 'In percent',
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(5.0)
                )
                ),
            )
             ,),
             
            Padding(
              padding: EdgeInsets.only(top: 10.0,bottom: 10.0), 
              child:Row(
               children: <Widget>[
                Expanded(child:  TextField(
                  style: textStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelStyle: textStyle,
                labelText: 'Term',
                hintText: 'Time in years',
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(5.0)
                )
                ),
            ),
            ),
            Container(width: 10.0,),
         Expanded(child: DropdownButton<String>(
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

),),

               ],
             
             )
             ),
   Padding(
     padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
     child: Row(
      children: <Widget>[
        Expanded(
          child: RaisedButton(
            color: Theme.of(context).primaryColorDark,
            textColor: Theme.of(context).primaryColorLight,
            child: Text('Calculate',),
            onPressed: (){

            },
          ),
        ),
        Expanded(
          child: RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Theme.of(context).primaryColorDark,
            child: Text('Reset',),
            onPressed: (){

            },
          ),
        )

      ],
    ))
             ],
        ),
      ),

    );
  }
}


