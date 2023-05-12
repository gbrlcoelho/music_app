import 'package:flutter/material.dart';
import 'package:music_app/shared/widgets/screen_widget.dart';

class GenreListScreen extends StatelessWidget {
  static const String routeName = '/genre-list';
  const GenreListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWidget(
      isLoading: false,
      title: 'Lista de Gêneros',
      child: Container(),
    );
  }
}
