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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Trending"),
          backgroundColor: SharedColors.favoritesRed,
          foregroundColor: Colors.white,
          actions: [
            GetBuilder<HomeController>(
              builder: (_) {
                return Container(
                  decoration: BoxDecoration(
                    color: SharedColors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ToggleButtons(
                    isSelected: _homeController.windowSelection,
                    onPressed: (int index) => _homeController.toggleTrendingWindow(index),
                    constraints: const BoxConstraints(minHeight: 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    borderRadius: BorderRadius.circular(20),
                    selectedColor: SharedColors.favoritesRed,
                    fillColor: Colors.white,
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 6, 6, 6),
                        child: Text("Today", style: TextStyle(fontSize: 12)),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(6, 6, 8, 6),
                        child: Text("This Week", style: TextStyle(fontSize: 12)),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(width: 20),
          ],
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
                    onPressed: () {
                      _searchController.onTapSearchButton();
                      Get.toNamed(RouteManager.search);
                    },
                  ),
                ],
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
      ),
    );
  }
}
