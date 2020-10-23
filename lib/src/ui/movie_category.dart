import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/src/ui/menu/app_drawer.dart';
import 'package:my_app/src/ui/movie_list.dart';

class MovieCategory extends StatefulWidget {
  static const String routeName = '/movieCategory';
  @override
  MovieCategoryState createState() => MovieCategoryState();
}

class MovieCategoryState extends State<MovieCategory> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          drawer: AppDrawer(),
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "Popular"),
                Tab(text: "Now Playing"),
                Tab(text: "Top Rated"),
                Tab(text: "Upcoming"),
              ],
            ),
            title: Text("Movie"),
          ),
          body: TabBarView(
            children: [
              MovieList(movieType: "popular"),
              MovieList(movieType: "now_playing"),
              MovieList(movieType: "top_rated"),
              MovieList(movieType: "upcoming"),
            ],
          ),
        ),
      ),
    );
  }
}
