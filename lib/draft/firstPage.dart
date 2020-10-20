import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/draft/list/HeaderItem.dart';
import 'package:my_app/draft/list/ListItem.dart';
import 'package:my_app/draft/list/MessageItem.dart';
import 'package:my_app/draft/secondPage.dart';
import 'list/List.dart';
import 'spin.dart';


class FirstPage extends StatefulWidget{


  @override
  _FistPageState createState() => _FistPageState();

}


class _FistPageState extends State<FirstPage>{
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        // Column is also a layout widget. It takes a draft.list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Invoke "debug painting" (press "p" in the console, choose the
        // "Toggle Debug Paint" action from the Flutter Inspector in Android
        // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
        // to see the wireframe for each widget.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        padding: EdgeInsets.zero,
        children: <Widget>[

          RaisedButton(
            onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
            },
            child: Text('Next'),
          ),
          Container(
            height: 700,
            child: ListText(
              items: List<ListItem>.generate(
                10000,
                    (i) => i % 6 == 0 ? HeadingItem("Heading $i") : MessageItem("Sender $i", "Message body $i"),
              ),
            ),

          ),

          Padding(
              child: Spin(),
              padding: EdgeInsets.fromLTRB(30, 40, 30, 40)
          ),
          Padding(
              child: Stack(
                alignment: Alignment.center,
                children: [


                  Padding(
                      child:  Text(
                          'You have pushed the button this many times:',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          )
                      ),
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 100)
                  ),

                  Text(
                    '$_counter',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                ],
              ),
              padding: EdgeInsets.fromLTRB(10, 20, 30, 40)
          ),
        ],
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',

        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }


}