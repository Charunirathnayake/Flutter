import 'package:flutter/material.dart';
void main(){
runApp(
  MaterialApp(
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
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple interst App"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
           Padding(
             padding: EdgeInsets.only(top:10.0,bottom: 10.0),
             child:TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Principal',
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
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Rate of interest',
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
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Term',
                hintText: 'Time in years',
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(5.0)
                )
                ),
            ),
            ),
            Container(width: 10.0,),
              /*Expanded(child: 
            DropdownButton<String>(
                items: _currencies.map((String dropdownStringItems){
                  return DropdownMenuItem(
                    value: dropdownStringItems,
                    child: Text(dropdownStringItems),
                  );
                }).toList(),
                value: 'Rupees',
                onChanged: (String newvalueselected){
                  setState(() {
                    this.currentvalue=newvalueselected;
                  });
                },
            ),
            ),*/
               ],
             ))
          ],
        ),
      ),

    );
  }
}


