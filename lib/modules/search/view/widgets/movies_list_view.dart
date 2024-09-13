import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movies/modules/search/controller/search_movies_controller.dart';
import 'package:my_movies/modules/search/view/widgets/movie_tile.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchMoviesController>(
      builder: (controller) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: controller.searchedMovies.length,
          itemBuilder: (context, index) => MovieTile(controller.searchedMovies[index]),
          controller: controller.scrollController,
        );
      },
    );
  }
}
