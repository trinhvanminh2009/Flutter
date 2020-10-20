import 'package:my_app/src/models/item_model.dart';
import 'package:my_app/src/resources/movie_api_provider.dart';

class Repository{
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel>fetchAllMovies(movieType) => moviesApiProvider.fetchMovieList(movieType);
}