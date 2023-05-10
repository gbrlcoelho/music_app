class GenreModel {
  final String? img;
  final String title;
  final String searchString;

  GenreModel({
    this.img,
    required this.title,
    required this.searchString,
  });

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      img: map['img'],
      title: map['title'] ?? '',
      searchString: map['searchString'] ?? '',
    );
  }
}
