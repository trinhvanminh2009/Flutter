import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_app/src/helpers/read_more_text.dart';
import 'package:my_app/src/models/genre.dart';
import 'package:my_app/src/models/movie_item.dart';
import '../blocs/movies_bloc.dart';
import 'package:intl/intl.dart';

class MovieItemUI extends StatefulWidget {
  final int id;

  const MovieItemUI({Key key, this.id}) : super(key: key);

  @override
  MovieItemState createState() => MovieItemState();
}

class MovieItemState extends State<MovieItemUI> {
  String getLinkPoster(path) {
    return "https://image.tmdb.org/t/p/w185$path";
  }

  Widget buildMovieItem(AsyncSnapshot<MovieItem> snapshot) {
    String posterPath =
        "https://image.tmdb.org/t/p/w500${snapshot.data.poster_path}";
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var releaseDate =
        new DateFormat('yyyy-MM-dd').parse(snapshot.data.release_date, false);
    String genres = "";
    for (int i = 0; i < snapshot.data.genre.length; i++) {
      if (i == snapshot.data.genre.length - 1) {
        genres += snapshot.data.genre[i].name;
      } else {
        genres += snapshot.data.genre[i].name + ", ";
      }
    }

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Image.network(posterPath, width: width, fit: BoxFit.fitWidth),
              Positioned(
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.red,
                    shape: CircleBorder(),
                  ),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        minWidth: 40.0,
                        height: 40.0,
                        splashColor: Colors.deepOrange,
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.redAccent,
                        ),
                      )),
                ),
              ),
              Positioned(
                top: height / 3,
                left: 0,
                right: 0,
                height: height,
                child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(38.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Card(
                            elevation: 9,
                            color: Colors.deepOrange,
                            margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                            shape: BeveledRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  child: Opacity(
                                    opacity: 0.7,
                                    child: Text(
                                      "Rating",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                                  child: Text(
                                    (snapshot.data.vote_average * 10)
                                            .toString() +
                                        "%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(100, 20, 0, 0),
                            child: RaisedButton(
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              color: Colors.white12,
                              onPressed: () {
                                // Respond to button press
                              },
                              child: Text("Rate it!"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: SizedBox(
                              width: 45,
                              child: RaisedButton(
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                color: Colors.white12,
                                onPressed: () {
                                  // Respond to button press
                                },
                                child: Icon(
                                  Icons.flag_outlined,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          snapshot.data.title,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ReadMoreText(
                          snapshot.data.overview,
                          style: TextStyle(letterSpacing: 1.2),
                          trimLines: 3,
                          colorClickableText: Colors.pink,
                          trimCollapsedText: "...show More",
                          trimExpandedText: ' show less',
                          trimMode: TrimMode.Line,
                        ),
                      ),
                      SizedBox(
                          width: width,
                          height: 150,
                          child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  //Duration
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Card(
                                      color: Colors.black12,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 0, 0),
                                            child: Icon(Icons.timer),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 10, 10, 0),
                                                  child: Opacity(
                                                    opacity: 0.6,
                                                    child: Text("Duration",
                                                        style: TextStyle(
                                                            fontSize: 12)),
                                                  )),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 10, 40, 15),
                                                child: Text(
                                                    snapshot.data.runtime
                                                            .toString() +
                                                        " min",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  //Release date
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Card(
                                      color: Colors.black12,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 0, 0),
                                            child: Icon(
                                                Icons.calendar_today_outlined),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 10, 10, 0),
                                                  child: Opacity(
                                                    opacity: 0.6,
                                                    child: Text("Release",
                                                        style: TextStyle(
                                                            fontSize: 12)),
                                                  )),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 10, 40, 15),
                                                child: Text(
                                                    releaseDate.year.toString(),
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Card(
                                      color: Colors.black12,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 0, 0),
                                            child: Icon(
                                                Icons.account_tree_outlined),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 10, 10, 0),
                                                  child: Opacity(
                                                    opacity: 0.6,
                                                    child: Text("Genre",
                                                        style: TextStyle(
                                                            fontSize: 12)),
                                                  )),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 10, 40, 15),
                                                child: Text(genres,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Card(
                                      color: Colors.black12,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 0, 0),
                                            child: Icon(
                                                Icons.how_to_vote_outlined),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 10, 10, 0),
                                                  child: Opacity(
                                                    opacity: 0.6,
                                                    child: Text("Vote Count",
                                                        style: TextStyle(
                                                            fontSize: 12)),
                                                  )),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 10, 40, 15),
                                                child: Text(
                                                    snapshot.data.vote_count
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),

                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Card(
                                      color: Colors.black12,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 10, 0, 0),
                                            child: Icon(Icons.family_restroom_outlined),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      10, 10, 10, 0),
                                                  child: Opacity(
                                                    opacity: 0.6,
                                                    child: Text("Popularity",
                                                        style: TextStyle(
                                                            fontSize: 12)),
                                                  )),
                                              Padding(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 10, 40, 15),
                                                child: Text(
                                                    snapshot.data.popularity
                                                            .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )))
                    ],
                  ),
                ),
              ),
            ],
            clipBehavior: Clip.none,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    bloc.fetchItemMovie(widget.id);
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: StreamBuilder(
        stream: bloc.getItemMovie,
        builder: (context, AsyncSnapshot<MovieItem> snapshot) {
          if (snapshot.hasData) {
            return buildMovieItem(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      )),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
