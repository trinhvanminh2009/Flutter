import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_app/src/models/item_model.dart';

class MovieApiProvider{
  Client client  = Client();
  final _apiKey =  "ceb20ebf889add084b020f4a5b061d3f";

  Future<ItemModel>fetchMovieList(movieType) async{
    final response  = await client.get("https://api.themoviedb.org/3/movie/$movieType?api_key=$_apiKey");
    if(response.statusCode == 200){
      return ItemModel.fromJson(jsonDecode(response.body));

    }else{
      throw Exception('Failed to load post');
    }
  }
}