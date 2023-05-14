import 'package:dartz/dartz.dart';
import 'package:music_app/core/errors/exceptions.dart';
import 'package:music_app/core/services/api_service.dart';
import 'package:music_app/shared/models/genre_details_model.dart';

import '../../../../core/errors/failures.dart';

class GenreDetailsRepository {
  final ApiService _apiService;

  GenreDetailsRepository({required ApiService apiService})
      : _apiService = apiService;

  Future<Either<Failure, GenreDetailsModel>> getGenreDetails(
      String genre) async {
    try {
      final response = await _apiService.getGenreDetails(genre: genre);

      return Right(response);
    } on ApiException catch (apiExcepetion) {
      return Left(GetGenreDetailsFailure(apiExcepetion.message));
    } on GeneralException catch (generalException) {
      return Left(GetGenreDetailsFailure(generalException.message));
    }
  }
}
