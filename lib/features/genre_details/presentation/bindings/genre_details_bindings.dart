import 'package:get/get.dart';
import 'package:music_app/core/services/api_service.dart';
import 'package:music_app/features/genre_details/data/repositories/genre_details_repository.dart';
import 'package:music_app/features/genre_details/presentation/controllers/genre_details_controller.dart';
import 'package:music_app/shared/features/music_player/presentation/controllers/music_player_controller.dart';

class GenreDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      GenreDetailsController(
        GenreDetailsRepository(
          apiService: Get.find<ApiService>(),
        ),
        Get.find<MusicPlayerController>(),
      ),
    );
  }
}
