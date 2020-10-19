import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/AnimationPage.dart';
import 'package:universal_widget/universal_widget.dart';

class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  UniversalWidget myUniversal = UniversalWidget(
    color: Colors.red,
  );
  double rotationDegree = 33;

  void _increaseDegree() {
    setState(() {
      if (rotationDegree < 350) {
        rotationDegree += 10;
      } else {
        rotationDegree = 0;
      }
      print(rotationDegree);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Second page"),
      ),
      body: ListView(
        children: [
          Center(child: CircularProgressIndicator()),
          UniversalWidget(
              x: 20,
              y: 40,
              rotation: rotationDegree,
              // degrees
              top: 10,
              left: 20,
              bottom: 30,
              height: 60,
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10),
              child: RaisedButton(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  child: const Text('Gradient Button',
                      style: TextStyle(fontSize: 20)),
                ),
                onPressed: _increaseDegree,
                padding: const EdgeInsets.all(10.0),
              )),
          Card(
            child: InkWell(
              splashColor: Colors.red.withAlpha(30),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AnimationPage()));
              },
              borderRadius: BorderRadius.circular(20),
              child: Container(
                alignment: Alignment.center,
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text('Third page'),
              ),
            ),
          ),
          Image.network(
            'https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true',
          ),
          Image.network(
            'https://picsum.photos/250?image=9',
          ),
        ],
      ),
    );
  }
}
