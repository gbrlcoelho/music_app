import 'package:music_app/shared/models/genre_model.dart';
import 'package:music_app/shared/models/music_model.dart';

class GenreDetailsModel extends GenreModel {
  final List<MusicModel> musics;

  GenreDetailsModel({
    required String title,
    required String img,
    required String searchString,
    required this.musics,
  }) : super(title: title, img: img, searchString: searchString);

  factory GenreDetailsModel.fromMap(Map<String, dynamic> map) {
    return GenreDetailsModel(
      title: map['title'] ?? '',
      musics: (['musics'])
          .map((music) => MusicModel.fromMap(music as Map<String, dynamic>))
          .toList(),
      searchString: map['searchString'] ?? '',
      img: map['img'] ?? '',
    );
  }
}
