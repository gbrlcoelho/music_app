extension DurationExtension on int {
  String get fromSecondsToMinutesString {
    final minutes = (this / 60).floor();
    final seconds = this % 60;

    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
