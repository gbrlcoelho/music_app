import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/core/app/music_app_colors.dart';

import '../../../../controllers/music_player_controller.dart';

enum PlayPauseButtonSize {
  small,
  normal,
}

class PlayPauseButtonWidget extends StatelessWidget {
  final String? musicUrl;
  final PlayPauseButtonSize _playPauseButtonSize;

  const PlayPauseButtonWidget({
    this.musicUrl,
    PlayPauseButtonSize? playPauseButtonSize,
    super.key,
  }) : _playPauseButtonSize = playPauseButtonSize ?? PlayPauseButtonSize.normal;

  @override
  Widget build(BuildContext context) {
    final musicPlayerController = Get.find<MusicPlayerController>();
    return Obx(
      () => IconButton(
        iconSize: _playPauseButtonSize == PlayPauseButtonSize.normal ? 70 : 50,
        onPressed: () async {
          if (musicUrl != null) {
            if (musicPlayerController.isPlaying.value) {
              musicPlayerController.pauseMusic();
            } else {
              musicPlayerController.playMusic(musicUrl!);
            }
          }
        },
        icon: Icon(
          musicPlayerController.isPlaying.value
              ? Icons.pause_circle_filled
              : Icons.play_circle_filled,
          color: MusicAppColors.secondaryColor,
        ),
        padding: const EdgeInsets.all(0),
      ),
    );
  }
}
