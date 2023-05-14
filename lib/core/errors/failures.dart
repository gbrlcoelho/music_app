abstract class Failure {}

class GetGenreListFailure extends Failure {
  final String message;

  GetGenreListFailure(this.message);
}

class GetGenreDetailsFailure extends Failure {
  final String message;

  GetGenreDetailsFailure(this.message);
}
