import 'package:flutter/material.dart';
import 'package:my_app/src/ui/movie_category.dart';


void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: MovieCategory(),
    ),
  ));
}
