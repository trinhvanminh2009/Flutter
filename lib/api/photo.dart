class Photo{
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({this.id, this.title, this.url, this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic>json){
    return Photo(
      id: json['id'],
      title: json["title"],
      url: json["url"],
      thumbnailUrl: json["thumbnailUrl"],
    );
  }
}