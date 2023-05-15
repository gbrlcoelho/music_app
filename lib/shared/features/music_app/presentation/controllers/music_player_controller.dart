import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:music_app/core/errors/exceptions.dart';
import 'package:music_app/core/services/audio_service/audio_player_service.dart';
import 'package:music_app/shared/models/music_model.dart';

import '../../../../../core/mixins/snack_bar_mixin.dart';

class MusicPlayerController with SnackBarMixin {
  final AudioPlayerService _audioPlayer;

  MusicPlayerController(AudioPlayerService audioPlayer)
      : _audioPlayer = audioPlayer {
    _audioCompleteStreamSubscription =
        _audioPlayer.onAudioComplete().listen((_) {
      skipTrack();
    });
  }

  StreamSubscription? _audioCompleteStreamSubscription;

  final RxBool isPlaying = false.obs;

  final RxInt currentMusicDuration = 0.obs;

  final RxnInt currentMusicIndexPlaying = RxnInt();

  int? get getCurrentMusicIndexPlaying => currentMusicIndexPlaying.value;

  final RxList<MusicModel> _playlistPlaying = <MusicModel>[].obs;

  List<MusicModel> get getPlaylistPlaying => _playlistPlaying;

  final List<MusicModel> selectedPlaylist = [];

  Stream<Duration> get getCurrentMusicDurationStream =>
      _audioPlayer.getPositionStream();

  Future<void> seek(int seekToDurationInSeconds) =>
      _audioPlayer.seek(seekToDurationInSeconds);

  void loadPlaylist(
      List<MusicModel> newPlaylist, List<MusicModel> playlistToChange) {
    playlistToChange
      ..clear()
      ..addAll(newPlaylist);
  }

  Future<void> onCallMusicPlayerTryAndCatchFunction(
      Future<void> Function() tryFunction) async {
    try {
      await tryFunction();
    } on AudioPlayerException catch (error) {
      showErrorSnackBar(error.toString());
    }
  }

  Future<void> playMusic(String url) async {
    onCallMusicPlayerTryAndCatchFunction(() async {
      isPlaying.value = true;
      await _audioPlayer.playMusic(url);
    });
  }

  Future<void> stopMusic() async {
    onCallMusicPlayerTryAndCatchFunction(() async {
      isPlaying.value = false;
      await _audioPlayer.stopMusic();
    });
  }

  Future<void> loadMusic() async {
    onCallMusicPlayerTryAndCatchFunction(() async {
      loadPlaylist(selectedPlaylist, _playlistPlaying);

      await stopMusic();

      await playMusic(_playlistPlaying[getCurrentMusicIndexPlaying ?? 0].url);
    });
  }

  Future<void> pauseMusic() async {
    onCallMusicPlayerTryAndCatchFunction(() async {
      isPlaying.value = false;
      await _audioPlayer.pauseMusic();
    });
  }

  Future<void> skipTrack() async {
    if (getCurrentMusicIndexPlaying != null) {
      if (getCurrentMusicIndexPlaying! < _playlistPlaying.length - 1) {
        currentMusicIndexPlaying.value = currentMusicIndexPlaying.value! + 1;
      } else {
        currentMusicIndexPlaying.value = 0;
      }

      await loadMusic();
    }
  }

  MusicModel? get getCurrentPlayingMusic {
    if (getCurrentMusicIndexPlaying != null) {
      return _playlistPlaying[getCurrentMusicIndexPlaying!];
    }
    return null;
  }

  Future<void> backTrack() async {
    if (getCurrentMusicIndexPlaying != null &&
        getCurrentMusicIndexPlaying! > 0) {
      currentMusicIndexPlaying.value = currentMusicIndexPlaying.value! - 1;
    } else {
      currentMusicIndexPlaying.value = _playlistPlaying.length - 1;
    }
    await loadMusic();
  }

  void dispose() {
    _audioCompleteStreamSubscription?.cancel();
  }

  Future<void> loadCurrentMusicDuration() async {
    currentMusicDuration.value = await _audioPlayer.getCurrentPosition;
  }

  void playSelectedMusic(BuildContext context, int musicIndex) {
    currentMusicIndexPlaying.value = musicIndex;
    loadMusic();

    showMusicPlayer(context);
  }

  Future<void> showMusicPlayer(BuildContext context) async {}
}
