import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_app/src/config/config.dart';
import 'package:my_app/src/models/item_model.dart';
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

  Future<MovieItem>getItemMovie(id) async{
    final response = await client
        .get(Config().baseUrl + "$id?api_key=" + Config().apiKey);
    if (response.statusCode == 200) {
      return MovieItem.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
