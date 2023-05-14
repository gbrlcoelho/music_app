import 'package:get/get.dart';
import 'package:music_app/core/errors/failures.dart';
import 'package:music_app/shared/models/genre_model.dart';

import '../../../../core/mixins/screen_loading_and_error_mixin.dart';
import '../../data/repositories/genre_list_repository.dart';

class GenreListController extends GetxController
    with ScreenLoadingAndErrorMixin {
  final GenreListRepository _genreListRepository;

  GenreListController(GenreListRepository genreListRepository)
      : _genreListRepository = genreListRepository;

  final RxList<GenreModel> genres = RxList([]);

  @override
  void onInit() {
    super.onInit();
    getGenreList();
  }

  Future<void> getGenreList() async {
    setLoadingToTrue();
    setErrorMessage(null);

    final getGenreResponse = await _genreListRepository.getGenreList();

    getGenreResponse.fold((Failure failure) {
      if (failure is GetGenreListFailure) {
        setErrorMessage(failure.message);
      }
    }, (List<GenreModel> genreResponse) {
      genres.value = genreResponse;
    });

    setLoadingToFalse();
  }
}
