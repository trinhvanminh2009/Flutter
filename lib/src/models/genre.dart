class Genre {
  int _id;
  String _name;

  Genre(genre) {
    _id = genre['id'];
    _name = genre['name'];
  }

  String get name => _name;

  int get id => _id;
}
