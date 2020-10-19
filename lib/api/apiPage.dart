import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/api/photo.dart';
import 'package:my_app/api/photoList.dart';

import 'album.dart';

class ApiPage extends StatefulWidget {
  @override
  ApiPageState createState() => ApiPageState();
}

Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/1');
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

Future<List<Photo>> fetchPhotos() async {
  http.Client client = http.Client();
  final response =
      await client.get("https://jsonplaceholder.typicode.com/photos");
  return parsePhotos(response.body);
}

class ApiPageState extends State<ApiPage> {
  Future<Album> futureAlbum;
  @override
  void initState() {
    // TODO: implement initState
    futureAlbum = fetchAlbum();
    print(futureAlbum);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Api page"),
      ),
      body: ListView(
        children: [
          Center(
            child: FutureBuilder<Album>(
              future: futureAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data.title);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
          SizedBox(
            height: 800,
            child: FutureBuilder<List<Photo>>(
              future: fetchPhotos(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? PhotoList(
                        photos: snapshot.data,
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ),

        ],
      ),
    );
  }
}
