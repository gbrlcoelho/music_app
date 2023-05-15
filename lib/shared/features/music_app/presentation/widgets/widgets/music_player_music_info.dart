import 'package:flutter/material.dart';
import 'package:music_app/shared/models/music_model.dart';
import 'package:music_app/shared/widgets/image_widget.dart';
import 'package:music_app/shared/widgets/text_widget.dart';

class MusicPlayerMusicInfo extends StatelessWidget {
  final MusicModel music;
  const MusicPlayerMusicInfo({required this.music, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(builder: (_, BoxConstraints constraints) {
          return ImageWidget(
            width: constraints.maxWidth,
            height: constraints.maxWidth,
            img: music.img,
          );
        }),
        const SizedBox(height: 14),
        Align(
          alignment: Alignment.topLeft,
          child: TextWidget.title(music.title),
        )
      ],
    );
  }
}
