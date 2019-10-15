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
  var displayresult='';
  var _formKey=GlobalKey<FormState>();

  TextEditingController principalcontroller=TextEditingController();
  TextEditingController roicontroller=TextEditingController();
  TextEditingController termcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle=Theme.of(context).textTheme.title;
    
    return Scaffold(
      //resizeToAvoidBottomPadding:false ,
      appBar: AppBar(
        title: Text("Simple interst App"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
           Padding(
             padding: EdgeInsets.only(top:10.0,bottom: 10.0),
             child:TextFormField(
               
               validator: (String value){
                 if(value.isEmpty){
                   return 'Plaese enter principal amount';
                 }
               },
               controller: principalcontroller,
               style: textStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.yellowAccent,
                fontSize: 15),
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
             child:TextFormField(
               validator: (String value){
                 if(value.isEmpty){
                   return 'Please enter the rate of interst';
                 }
               },
               controller: roicontroller,
               style: textStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                errorStyle: TextStyle(fontSize: 15.0,color: Colors.yellowAccent),
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
                Expanded(child:  TextFormField(
                  validator: (String value){
                    if(value.isEmpty){
                      return 'Please enter the term';
                    }
                  },
                  controller: termcontroller,
                  style: textStyle,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.yellowAccent,fontSize: 15.0),
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
                    setState(() {
                      if(_formKey.currentState.validate()){
                      this.displayresult=_calculateTotalReturn(); }
                    });
            },
          ),
        ),
        Expanded(
          child: RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Theme.of(context).primaryColorDark,
            child: Text('Reset',),
            onPressed: (){
                setState(() {
                 reset(); 
                });
            },
          ),
        )

      ],
    ))
    ,Padding(
      padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
      child: Text(this.displayresult)
    )
             ],
        ),
      ),

    );
  }

  String _calculateTotalReturn(){
    double principal=double.parse(principalcontroller.text);
    double roi=double.parse(roicontroller.text);
    double term=double.parse(termcontroller.text);
    double value=principal+(principal*roi*term)/100;
    String result='After $term Your investments is $value';
    return result;

  }
  void reset(){
    principalcontroller.text='';
    roicontroller.text='';
    termcontroller.text='';
    displayresult='';
    currentvalue=_currencies[0];
  }
}


