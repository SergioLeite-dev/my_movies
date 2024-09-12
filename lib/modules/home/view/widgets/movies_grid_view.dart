import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movies/modules/home/controller/home_controller.dart';
import 'package:my_movies/modules/home/view/widgets/movie_card.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: MovieCard.ratio,
          ),
          shrinkWrap: true,
          itemCount: controller.trendingMoviesToday.length,
          itemBuilder: (context, index) => MovieCard(controller.trendingMoviesToday[index]),
        );
      },
    );
  }
}
