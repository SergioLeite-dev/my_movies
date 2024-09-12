import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movies/application/route_manager.dart';
import 'package:my_movies/modules/home/controller/home_controller.dart';
import 'package:my_movies/modules/home/view/widgets/get_to_favorites_button.dart';
import 'package:my_movies/modules/home/view/widgets/movies_grid_view.dart';
import 'package:my_movies/modules/home/view/widgets/search_button.dart';
import 'package:my_movies/modules/home/view/widgets/search_text_field.dart';
import 'package:my_movies/modules/search/controller/search_movies_controller.dart';
import 'package:my_movies/shared/shared_colors.dart';

class HomePage extends StatelessWidget {
  final HomeController _homeController;
  final SearchMoviesController _searchController;

  const HomePage(this._homeController, this._searchController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text("Trending"),
      //   backgroundColor: SharedColors.favoritesRed,
      //   foregroundColor: Colors.white,
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const GetToFavoritesButton(),
                const SizedBox(width: 16),
                SearchTextField(),
                SearchButton(
                  onPressed: () {
                    _searchController.onTapSearchButton();
                    Get.toNamed(RouteManager.search);
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            GetBuilder<HomeController>(
              builder: (_) {
                return ToggleButtons(
                  isSelected: _homeController.windowSelection,
                  onPressed: (int index) => _homeController.toggleTrendingWindow(index),
                  constraints: const BoxConstraints(minHeight: 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  borderRadius: BorderRadius.circular(20),
                  selectedColor: SharedColors.favoritesRed,
                  fillColor: SharedColors.favoritesRed.withOpacity(0.22),
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 8, 8, 8),
                      child: Text("Today"),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(8, 8, 15, 8),
                      child: Text("This Week"),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 10),
            const Expanded(child: MoviesGridView()),
            GetBuilder<HomeController>(
              builder: (_) {
                if (_homeController.isLoading) {
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
          ],
        ),
      ),
      floatingActionButton: GetBuilder<HomeController>(
        builder: (_) {
          if (_homeController.shouldDisplayBackToTop) {
            return FloatingActionButton(
              onPressed: _homeController.backToTop,
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
