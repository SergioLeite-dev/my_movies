import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movies/modules/home/view/widgets/get_to_favorites_button.dart';
import 'package:my_movies/modules/home/view/widgets/search_button.dart';
import 'package:my_movies/modules/home/view/widgets/search_text_field.dart';
import 'package:my_movies/modules/search/controller/search_movies_controller.dart';
import 'package:my_movies/modules/search/view/widgets/movies_list_view.dart';
import 'package:my_movies/shared/shared_colors.dart';

class SearchResultsPage extends StatelessWidget {
  final SearchMoviesController _controller;

  const SearchResultsPage(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Search Results"),
        backgroundColor: SharedColors.favoritesRed,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const GetToFavoritesButton(),
                const SizedBox(width: 16),
                SearchTextField(),
                SearchButton(
                  onPressed: _controller.onTapSearchButton,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Expanded(child: MoviesListView()),
            GetBuilder<SearchMoviesController>(
              builder: (_) {
                if (_controller.isLoading) {
                  return Container(
                    margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                    height: 20,
                    width: 20,
                    child: const CircularProgressIndicator(
                      color: SharedColors.favoritesRed,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            //const SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: GetBuilder<SearchMoviesController>(
        builder: (_) {
          if (_controller.shouldDisplayBackToTop) {
            return FloatingActionButton(
              onPressed: _controller.backToTop,
              backgroundColor: Colors.white.withOpacity(0.82),
              foregroundColor: SharedColors.favoritesRed,
              mini: true,
              child: const Icon(
                Icons.arrow_upward,
                size: 30,
              ),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
