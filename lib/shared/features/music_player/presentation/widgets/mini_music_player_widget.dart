import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:music_app/core/app/music_app_colors.dart';
import 'package:music_app/shared/features/music_player/presentation/controllers/music_player_controller.dart';
import 'package:music_app/shared/widgets/image_widget.dart';
import 'package:music_app/shared/widgets/text_widget.dart';

import 'music_player_controls/widgets/play_pause_button_widget.dart';

class MiniMusicPlayerWidget extends StatelessWidget {
  const MiniMusicPlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final musicPlayerController = Get.find<MusicPlayerController>();
    return GestureDetector(
      onTap: () => musicPlayerController.showMusicPlayer(context),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              MusicAppColors.primaryColor,
              MusicAppColors.tertiaryColor.withOpacity(0.5),
            ],
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        ImageWidget(
                          height: 50,
                          width: 50,
                          img:
                              musicPlayerController.getCurrentPlayingMusic?.img,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: TextWidget.normal(
                            musicPlayerController
                                    .getCurrentPlayingMusic?.title ??
                                'Music',
                          ),
                        )
                      ],
                    ),
                  ),
                  PlayPauseButtonWidget(
                    musicUrl: musicPlayerController.getCurrentPlayingMusic?.url,
                    playPauseButtonSize: PlayPauseButtonSize.small,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
