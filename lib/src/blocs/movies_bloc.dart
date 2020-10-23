import 'package:my_app/src/models/item_model.dart';
import 'package:my_app/src/models/movie_item.dart';
import 'package:my_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesBloc{

  final _repository = Repository();
  final _movieFetcher = PublishSubject<ItemModel>();
  final _itemMovieFetcher = PublishSubject<MovieItem>();
  Stream<ItemModel> get allMovies => _movieFetcher.stream;
  Stream<MovieItem> get getItemMovie => _itemMovieFetcher.stream;

  fetchAllMovies(movieType) async{
    ItemModel itemModel = await _repository.fetchAllMovies(movieType);
    _movieFetcher.sink.add(itemModel);
  }

  fetchItemMovie(id)async{
    MovieItem itemMovie = await _repository.fetchItemMovie(id);
    _itemMovieFetcher.sink.add(itemMovie);
  }


  dispose(){
    _movieFetcher.close();
    _itemMovieFetcher.close();
  }
}

final bloc = MoviesBloc();