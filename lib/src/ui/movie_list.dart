import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/src/models/item_model.dart';
import 'package:my_app/src/ui/movie_item.dart';

import '../blocs/movies_bloc.dart';

class MovieList extends StatefulWidget {
  final String movieType;
  final String searchKeyword;

  const MovieList({Key key, this.movieType, this.searchKeyword})
      : super(key: key);

  @override
  MovieListState createState() => MovieListState();
}

class MovieListState extends State<MovieList> {
  Widget buildList(AsyncSnapshot<ItemModel> snapshot) {
    return GridView.builder(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 30),
      itemCount: snapshot.data.results.length,
      shrinkWrap: true,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 4,
      ),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
            onTap: () {
              print(snapshot.data.results[index].id.toString());
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                  builder: (context) =>
                      MovieItemUI(id: snapshot.data.results[index].id)));
            },
            child: Card(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 15, 5, 0),
                  child: Image.network(
                      'https://image.tmdb.org/t/p/w185${snapshot.data.results[index].poster_path}',
                      width: 200,
                      height: 200,
                      fit: BoxFit.scaleDown),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text(
                      snapshot.data.results[index].title,
                      maxLines: 2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ))
              ],
            )));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (widget.movieType != null) {
      bloc.fetchAllMovies(widget.movieType);
    }
    if (widget.searchKeyword != null) {}
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder(
          stream: bloc.allMovies,
          builder: (context, AsyncSnapshot<ItemModel> snapshot) {
            if (snapshot.hasData) {
              return buildList(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
