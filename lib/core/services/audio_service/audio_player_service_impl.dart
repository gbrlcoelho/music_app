import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import './audio_player_service.dart';
import '../../errors/exceptions.dart';

class AudioPlayerServiceImpl extends GetxService implements AudioPlayerService {
  final AudioPlayer audioPlayer;

  AudioPlayerServiceImpl(this.audioPlayer);

  @override
  Future<int> get getCurrentPosition async {
    try {
      final position = await audioPlayer.getCurrentPosition();
      return position?.inSeconds ?? 0;
    } catch (error, stackTrace) {
      const errorMessage = 'Error getting music current position';
      log('$errorMessage: $error', stackTrace: stackTrace);
      throw AudioPlayerException(message: errorMessage);
    }
  }

  @override
  Stream<Duration> getPositionStream() {
    return audioPlayer.onPositionChanged;
  }

  @override
  Stream<void> onAudioComplete() {
    return audioPlayer.onPlayerComplete;
  }

  Future<void> callAudioPlayServiceTryAndCatchFunction(
      Future<void> Function() tryFunction,
      String audioPlayerExceptionMessage) async {
    try {
      await tryFunction();
    } catch (error, stackTrace) {
      final errorMessage = audioPlayerExceptionMessage;
      log('$errorMessage: $error', stackTrace: stackTrace);
      throw AudioPlayerException(message: errorMessage);
    }
  }

  @override
  Future<void> pauseMusic() {
    return callAudioPlayServiceTryAndCatchFunction(
        () => audioPlayer.pause(), 'Error pausing music');
  }

  @override
  Future<void> playMusic(String audioAsset) {
    return callAudioPlayServiceTryAndCatchFunction(
        () => audioPlayer.play(AssetSource(audioAsset)), 'Error playing music');
  }

  @override
  Future<void> resumeMusic() {
    return callAudioPlayServiceTryAndCatchFunction(
        () => audioPlayer.resume(), 'Error resuming music');
  }

  @override
  Future<void> seek(int seconds) {
    return callAudioPlayServiceTryAndCatchFunction(
        () => audioPlayer.seek(Duration(seconds: seconds)),
        'Error seeking music');
  }

  @override
  Future<void> stopMusic() {
    return callAudioPlayServiceTryAndCatchFunction(
        () => audioPlayer.stop(), 'Error stopping music');
  }

  @override
  void onClose() {
    audioPlayer
      ..stop()
      ..dispose();
    super.onClose();
  }
}
