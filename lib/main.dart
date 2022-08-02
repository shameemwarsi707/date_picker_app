import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyDatePicker());
class MyDatePicker extends StatelessWidget {
  const MyDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }


}

class _HomePageState extends State<HomePage> {
  DateTime _currentdate=DateTime.now();
  Future<Null>datechange(BuildContext context) async{
    final DateTime? datechange=await showDatePicker(
        context: context,
        initialDate: _currentdate,
        firstDate: DateTime(2001),
        lastDate: DateTime(2050)
    );
    if(datechange!=null){
      setState(() {
        _currentdate=datechange;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    String formetdate=DateFormat.yMMMd().format(_currentdate);
    return Scaffold(
      appBar: AppBar(title: Center(
        child: Text('Date Picker',style: TextStyle(fontSize: 22,color: Colors.blue),),),
        backgroundColor: Colors.yellowAccent,),
      body: Container(
        padding: EdgeInsets.only(top: 300,left: 60,right: 50),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: Text('Date : $formetdate',style: TextStyle(fontSize: 15),)
                ),
                Expanded(
                    child:IconButton(
                      onPressed: () {
                        datechange(context);
                      },
                      icon: Icon(Icons.date_range,size: 50,color: Colors.blueAccent,),
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

