import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:music_app/features/genre_details/presentation/controllers/genre_details_controller.dart';
import 'package:music_app/shared/features/music_player/presentation/controllers/music_player_controller.dart';
import 'package:music_app/shared/features/music_player/presentation/widgets/music_player_controls/widgets/circular_progress_indicator_widget.dart';
import 'package:music_app/shared/widgets/app_music_error_widget.dart';
import 'package:music_app/shared/widgets/text_widget.dart';

import '../bindings/genre_details_bindings.dart';

class GenreDetailsMusicListWidget extends StatelessWidget {
  final String genreSearchString;
  const GenreDetailsMusicListWidget({
    required this.genreSearchString,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(GenreDetailsBindings());
    final genreDetailsController = Get.find<GenreDetailsController>();
    final musicPlayerController = Get.find<MusicPlayerController>();
    return Obx(
      () => SliverList(
        delegate: SliverChildListDelegate(
          [
            const SizedBox(height: 8),
            if (genreDetailsController.isLoading)
              const CircularProgressIndicatorWidget(),
            if (!genreDetailsController.isLoading &&
                genreDetailsController.errorMessage != null)
              AppMusicErrorWidget(
                error: genreDetailsController.errorMessage!,
                onTryAgain: () =>
                    genreDetailsController.loadGenreDetails(genreSearchString),
              ),
            if (!genreDetailsController.isLoading &&
                genreDetailsController.errorMessage == null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget.title('Músicas'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
