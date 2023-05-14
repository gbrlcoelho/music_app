import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/features/genre_details/presentation/screens/genre_details_screen.dart';
import 'package:music_app/shared/widgets/screen_widget.dart';

import '../../../../shared/widgets/img_and_title_row_widget.dart';
import '../controllers/genre_list_controller.dart';

class GenreListScreen extends StatelessWidget {
  static const String routeName = '/genre-list';
  const GenreListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genreListController = Get.find<GenreListController>();
    return Obx(
      () => ScreenWidget(
        isLoading: false,
        title: 'Lista de Gêneros',
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  itemBuilder: (_, int index) {
                    final genre = genreListController.genres[index];
                    return InkWell(
                      onTap: () => Get.toNamed(
                        '${GenreListScreen.routeName}${GenreDetailsScreen.routeName}',
                        arguments: genre,
                      ),
                      child: ImgAndTitleRowWidget(
                        heroTag: genre.title,
                        title: genre.title,
                        img: genre.img,
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemCount: genreListController.genres.length,
                ),
              ),
            ),
            const SizedBox(height: 12)
          ],
        ),
      ),
    );
  }
}
