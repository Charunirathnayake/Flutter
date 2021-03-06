import 'package:flutter/material.dart';
import 'package:sample_project08/screens/Detail_Screen.dart';

class NoteList extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
  
    return NoteListState();
  }

}

class NoteListState extends State<NoteList>{
  int count=0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Notes'),
    ),
    floatingActionButton: FloatingActionButton(

onPressed: (){
debugPrint('fab print');
navigateToDetail('Edit Note');
},


child: Icon(Icons.add),
tooltip: 'Add note',
    ),
    body: getNoteListView(),
    );

}
ListView getNoteListView(){
TextStyle titleStyle=Theme.of(context).textTheme.subhead;
return ListView.builder(
  itemCount: count,
  itemBuilder: (BuildContext context,int position){
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.yellow,
          child: Icon(Icons.keyboard_arrow_right),
    
        ),
        title: Text('Dummy title',style: titleStyle,),
        subtitle: Text('Dummy date'),
        trailing: Icon(Icons.delete,color:Colors.grey),
        onTap: (){
          navigateToDetail('Add note');
        },
      ),
    )
 ; },
);
}
void navigateToDetail(String title){
  Navigator.push(context, MaterialPageRoute(builder: (context){
            return Detail_Screen(title);
          }));
}
}