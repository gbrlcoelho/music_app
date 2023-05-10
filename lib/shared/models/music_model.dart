class MusicModel {
  final String? img;
  final String title;
  final String url;
  final int duration;

  MusicModel({
    this.img,
    required this.title,
    required this.url,
    required this.duration,
  });

  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(
      img: map['img'],
      title: map['title'] ?? '',
      url: map['path'] ?? '',
      duration: map['duration'] ?? 0,
    );
  }
}
