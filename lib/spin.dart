
import 'package:flutter/material.dart';

class Spin extends StatefulWidget{
  @override
  _SpinState createState() => _SpinState();


}

class _SpinState extends State<Spin> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> animation;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds:  10),
      vsync: this,
    );

    animation =  CurvedAnimation(parent: controller, curve: Curves.bounceInOut).drive(Tween(begin: 0, end: 100));
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        controller
          ..reset()
          ..forward();
      },
      child: RotationTransition(
          turns: animation,
          child: Stack(
            children: [
              Positioned.fill(
                child: FlutterLogo(),
              ),
              Center(
                child: Text('Tap here',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                )
                )
              )
            ],
          ),
      ),
    );
  }

}
