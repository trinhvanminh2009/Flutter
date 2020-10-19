import 'package:flutter/material.dart';
import 'package:my_app/api/photo.dart';

class PhotoList extends StatefulWidget {
  final List<Photo> photos;

  const PhotoList({Key key, this.photos}) : super(key: key);

  @override
  PhotoListState createState() {
    return new PhotoListState();
  }
}

class PhotoListState extends State<PhotoList>
    with SingleTickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
      begin: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          border: Border.all(style: BorderStyle.none),
          image: new DecorationImage(
            image: new AssetImage('images/robot.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(60.0),
          shape: BoxShape.rectangle,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Color(0x66666666),
              blurRadius: 40.0,
              spreadRadius: 3.0,
              offset: Offset(0, 10.0),
            )
          ]),
      end: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        image: new DecorationImage(
          image: new AssetImage('images/robot.png'),
          fit: BoxFit.cover,
        ),
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
    // TODO: implement build
    return GridView.builder(
      scrollDirection: Axis.horizontal ,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,


      ),
      itemCount: widget.photos.length,
      itemBuilder: (context, index) {
        return DecoratedBoxTransition(
          position: DecorationPosition.background,
          decoration: decorationTween.animate(_controller),
          child: Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.all(10),
              child: Center(
                child: Image.network(widget.photos[index].thumbnailUrl),
              )),
        );
      },
    );
  }
}
