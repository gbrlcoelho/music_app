import 'package:get/get.dart';
import 'package:music_app/core/mixins/screen_loading_and_error_mixin.dart';
import 'package:music_app/shared/features/music_player/presentation/controllers/music_player_controller.dart';
import 'package:music_app/shared/models/genre_model.dart';
import 'package:music_app/shared/models/music_model.dart';

import '../../../../core/errors/failures.dart';
import '../../../../shared/models/genre_details_model.dart';
import '../../data/repositories/genre_details_repository.dart';

class GenreDetailsController extends GetxController
    with ScreenLoadingAndErrorMixin {
  final GenreDetailsRepository _genreDetailsRepository;
  final MusicPlayerController _musicPlayerController;

  GenreDetailsController(GenreDetailsRepository genreDetailsRepository,
      MusicPlayerController musicPlayerController)
      : _genreDetailsRepository = genreDetailsRepository,
        _musicPlayerController = musicPlayerController;

  GenreDetailsModel? genreDetails;

  @override
  void onInit() {
    final genre = Get.arguments as GenreModel;

    loadGenreDetails(genre.searchString);
    super.onInit();
  }

  Future<void> loadGenreDetails(String genre) async {
    setLoadingToTrue();
    setErrorMessage(null);

    final genreDetailsReponse = await _genreDetailsRepository.getGenreDetails(
      genre,
    );

    genreDetailsReponse.fold(
      (Failure failure) {
        if (failure is GetGenreDetailsFailure) {
          setErrorMessage(failure.message);
        }
      },
      (GenreDetailsModel genreDetailsModel) {
        genreDetails = genreDetailsModel;

        _musicPlayerController.loadPlaylist(
            genreDetailsModel.musics, _musicPlayerController.selectedPlaylist);
      },
    );
    setLoadingToFalse();
  }

  MusicModel? getMusicByIndex(int index) => genreDetails?.musics[index];

  List<MusicModel>? get getMusics => genreDetails?.musics;
}
