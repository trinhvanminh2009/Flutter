import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_app/src/config/config.dart';
import 'package:my_app/src/models/item_model.dart';
import 'package:my_app/src/models/item_search.dart';
import 'package:my_app/src/models/movie_item.dart';

class MovieApiProvider {
  Client client = Client();

  Future<ItemModel> fetchMovieList(movieType) async {
    final response = await client
        .get(Config().baseUrl + "$movieType?api_key=" + Config().apiKey);
    if (response.statusCode == 200) {
      return ItemModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<MovieItem> getItemMovie(id) async {
    final response = await client.get(
      Config().baseUrl + "$id?api_key=" + Config().apiKey,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      return MovieItem.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<ItemSearch> getMovieByKeyword(keyword) async {
    String url = Config().searchByKeyword+ "?api_key=" + Config().apiKey+"&query=$keyword";
    final response = await client.get(url);
    if (response.statusCode == 200) {
      print('run in getMovieByKeyword');
      return ItemSearch.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
