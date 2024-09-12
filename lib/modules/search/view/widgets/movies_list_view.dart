import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movies/modules/home/view/widgets/movie_card.dart';
import 'package:my_movies/modules/search/controller/search_movies_controller.dart';

class MoviesListView extends StatelessWidget {
  const MoviesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchMoviesController>(
      builder: (controller) {
        return ListView.builder(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          shrinkWrap: true,
          itemCount: controller.searchedMovies.length,
          itemBuilder: (context, index) => MovieCard(controller.searchedMovies[index]),
          controller: controller.scrollController,
        );
      },
    );
  }
}
