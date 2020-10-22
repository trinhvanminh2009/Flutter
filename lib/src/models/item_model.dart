
import 'package:my_app/src/models/result.dart';

class ItemModel{
  int _page;
  int _total_results;
  int _total_pages;
  List<Result> _results = [];


  ItemModel.fromJson(Map<String, dynamic>parsedJson){
      _page = parsedJson['page'];
      _total_results = parsedJson['total_results'];
      _total_pages = parsedJson['total_pages'];

      List<Result>tempList = [];
      for(int i = 0; i < parsedJson['results'].length; i++){
        Result _result = Result(parsedJson['results'][i]);
        tempList.add(_result);
      }
      _results = tempList;
  }
  int get page => _page;

  int get total_results => _total_results;

  List<Result> get results => _results;

  int get total_pages => _total_pages;
}

