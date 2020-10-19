import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  AnimationPageState createState() => AnimationPageState();
}

class AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  bool selected = false;
  final DecorationTween decorationTween = DecorationTween(
      begin: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border.all(style: BorderStyle.none),
          borderRadius: BorderRadius.circular(60.0),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color(0x66666666),
              blurRadius: 10.0,
              spreadRadius: 3.0,
              offset: Offset(0, 6.0),
            )
          ]),
      end: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.zero,
      ));

  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation page"),
      ),
      body: ListView(
        children: [
          Padding(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Center(
                child: AnimatedContainer(
                  width: selected ? 300 : 90,
                  height: selected ? 90 : 300,
                  color: selected ? Colors.green : Colors.blue,
                  alignment: selected
                      ? Alignment.center
                      : AlignmentDirectional.topCenter,
                  duration: Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: Image.asset('images/crab.png'),
                ),
              ),
            ),
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
          ),
          Center(
            child: DecoratedBoxTransition(
              position: DecorationPosition.background,
              decoration: decorationTween.animate(_controller),
              child: Container(
                width: 200,
                height: 200,
                padding: EdgeInsets.all(10),
                child: Image.asset('images/robot.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
