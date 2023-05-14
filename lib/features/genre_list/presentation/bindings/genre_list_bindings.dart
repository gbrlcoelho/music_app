import 'package:get/get.dart';
import 'package:music_app/core/services/api_service.dart';
import 'package:music_app/features/genre_list/data/repositories/genre_list_repository.dart';
import 'package:music_app/features/genre_list/presentation/controllers/genre_list_controller.dart';

class GenreListBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      GenreListController(
        GenreListRepository(
          apiService: Get.find<ApiService>(),
        ),
      ),
    );
  }
}
