class ItemSearch {
  int _page;
  int _total_results;
  int _total_pages;
  List<_SearchResults> _searchResult = [];

  ItemSearch.fromJson(Map<String, dynamic> parsedJson) {
    _page = parsedJson['page'];
    _total_results = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];

    List<_SearchResults> tempList = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      _SearchResults _result = _SearchResults(parsedJson['results'][i]);
      tempList.add(_result);
    }
    _searchResult = tempList;
  }

  List<_SearchResults> get searchResult => _searchResult;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;
}

class _SearchResults {
  int _id;
  String _name;

  _SearchResults(searchResults) {
    _id = searchResults['id'];
    _name = searchResults['name'];
  }

  int get id => _id;

  String get name => _name;
}
