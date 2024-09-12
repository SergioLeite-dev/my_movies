import 'package:flutter/material.dart';
import 'package:my_movies/modules/home/controller/home_controller.dart';
import 'package:my_movies/modules/home/view/widgets/get_to_favorites_button.dart';
import 'package:my_movies/modules/home/view/widgets/search_button.dart';
import 'package:my_movies/modules/home/view/widgets/search_text_field.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller;

  const HomePage(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                GetToFavoritesButton(),
                SizedBox(width: 16),
                SearchTextField(),
                SearchButton(),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
