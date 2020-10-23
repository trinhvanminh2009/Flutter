import 'package:my_app/src/models/item_model.dart';
import 'package:my_app/src/models/item_search.dart';
import 'package:my_app/src/models/movie_item.dart';
import 'package:my_app/src/resources/movie_api_provider.dart';

class Repository{
  final moviesApiProvider = MovieApiProvider();

  Future<ItemModel>fetchAllMovies(movieType) => moviesApiProvider.fetchMovieList(movieType);

  Future<MovieItem>fetchItemMovie(id) => moviesApiProvider.getItemMovie(id);

  Future<ItemSearch>querySearch(keyword) => moviesApiProvider.getMovieByKeyword(keyword);
}