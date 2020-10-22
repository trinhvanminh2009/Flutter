
import 'package:my_app/src/models/genre.dart';

class MovieItem {
  int _vote_count;
  int _id;
  bool _video;
  var _vote_average;
  String _title;
  double _popularity;
  String _poster_path;
  String _original_language;
  String _original_title;
  List<Genre> _genre = [];
  String _backdrop_path;
  bool _adult;
  String _overview;
  String _release_date;
  Object _belongs_to_collection;
  int _budget;
  String _homepage;
  String _imdb_id;
  List<Object> _production_companies = [];
  List<Object> _production_countries = [];
  int _revenue;
  int _runtime;
  List<Object> _spoken_languages = [];
  String _status;

  MovieItem.fromJson(Map<String, dynamic> parsedJson) {
    _vote_count = parsedJson['vote_count'];
    _id = parsedJson['id'];
    _video = parsedJson['video'];
    _vote_average = parsedJson['vote_average'];
    _title = parsedJson['title'];
    _popularity = parsedJson['popularity'];
    _poster_path = parsedJson['poster_path'];
    _original_language = parsedJson['original_language'];
    _original_title = parsedJson['original_title'];
    if (parsedJson['genres'] != null) {
      for (int i = 0; i < parsedJson['genres'].length; i++) {
        Genre genre = Genre(parsedJson['genres'][i]);
        _genre.add(genre);
      }
    }

    _backdrop_path = parsedJson['backdrop_path'];
    _adult = parsedJson['adult'];
    _overview = parsedJson['overview'];
    _release_date = parsedJson['release_date'];
    _belongs_to_collection = parsedJson['belongs_to_collection'];
    _budget = parsedJson['budget'];
    _homepage = parsedJson['homepage'];
    _imdb_id = parsedJson['imdb_id'];
    for (int i = 0; i < parsedJson['production_companies'].length; i++) {
      _production_companies.add(parsedJson['production_companies'][i]);
    }
    for (int i = 0; i < parsedJson['production_countries'].length; i++) {
      _production_countries.add(parsedJson['production_countries'][i]);
    }
    _revenue = parsedJson['revenue'];
    _runtime = parsedJson['runtime'];
    for (int i = 0; i < parsedJson['spoken_languages'].length; i++) {
      _spoken_languages.add(parsedJson['spoken_languages'][i]);
    }
    _status = parsedJson['status'];
  }

  int get vote_count => _vote_count;

  int get id => _id;

  bool get video => _video;

  get vote_average => _vote_average;

  String get title => _title;

  double get popularity => _popularity;

  String get poster_path => _poster_path;

  String get original_language => _original_language;

  String get original_title => _original_title;

  List<Genre> get genre => _genre;

  String get backdrop_path => _backdrop_path;

  bool get adult => _adult;

  String get overview => _overview;

  String get release_date => _release_date;

  String get status => _status;

  List<Object> get spoken_languages => _spoken_languages;

  int get runtime => _runtime;

  int get revenue => _revenue;

  List<Object> get production_countries => _production_countries;

  List<Object> get production_companies => _production_companies;

  String get imdb_id => _imdb_id;

  String get homepage => _homepage;

  int get budget => _budget;

  Object get belongs_to_collection => _belongs_to_collection;
}

