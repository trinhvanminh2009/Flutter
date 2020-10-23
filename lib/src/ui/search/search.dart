import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/src/models/item_search.dart';
import 'package:my_app/src/ui/menu/app_drawer.dart';

import '../../blocs/search_movie_bloc.dart';
class Search extends StatefulWidget {
  static const String routeName = '/src/ui/search/search';

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: _isSearching ? _buildSearchField() : _buildTitle(context),
          actions: _buildActions(),
        ),
        drawer: AppDrawer(),
        body: StreamBuilder(
          stream: movieBloc.allResultSearch,
          builder: (context, AsyncSnapshot<ItemSearch>snapshot){
            if(searchQuery != ""){
              if (snapshot.hasData && snapshot.data.searchResult.length >0) {
                return Text(snapshot.data.searchResult[0].name.toString());
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Center(child: Text("No result found"));
              }
            }else{
              return Center(child: Text("Let's find some movies"));
            }

          },
        )
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Mission impossible",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onChanged: (query) => updateSearchQuery(query),
    );
  }

  Widget _buildTitle(context) {
    return Text("Search movie");
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (_searchQueryController == null ||
                _searchQueryController.text.isEmpty) {
              Navigator.pop(context);
              return;
            }
            _clearSearchQuery();
            return;
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });

    if(newQuery != ""){
      movieBloc.fetchAllMovies(newQuery);
    }else{

    }
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }
}
