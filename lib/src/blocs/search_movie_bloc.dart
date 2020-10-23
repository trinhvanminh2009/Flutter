import 'package:my_app/src/models/item_search.dart';
import 'package:my_app/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class SearchMovieBloc{
  final _repository = Repository();
  final _searchQuery = PublishSubject<ItemSearch>();
  Stream<ItemSearch> get allResultSearch => _searchQuery.stream;

  fetchAllMovies(keyword) async{
    ItemSearch itemSearch = await _repository.querySearch(keyword);
    _searchQuery.sink.add(itemSearch);
  }

  dispose(){
    _searchQuery.close();
  }

}

final movieBloc = SearchMovieBloc();