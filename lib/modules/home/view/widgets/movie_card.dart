import 'package:flutter/material.dart';
import 'package:my_movies/configuration/environment_values.dart';
import 'package:my_movies/models/response/movie_result_model.dart';
import 'package:my_movies/shared/helper_functions.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(this.movie, {super.key});

  final MovieResultModel? movie;

  static const double width = 220;
  static const double imgHeight = 330;
  static const double infoHeight = 70;
  static const ratio = width / (imgHeight + infoHeight);

  @override
  Widget build(BuildContext context) {
    String? posterURL;
    if (movie?.posterPath != null) {
      posterURL = "${EnvironmentValues.posterBaseURL}/${movie?.posterPath}";
    }
    return Container(
      width: width,
      height: imgHeight + infoHeight,
      color: Colors.black,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: width,
              height: imgHeight,
              child: posterURL != null
                  ? Image.network(
                      posterURL,
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                    )
                  : const Placeholder(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              foregroundDecoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.55),
                    Colors.black.withOpacity(0.9),
                    Colors.black,
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 0, 0, 6),
              width: width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${movie?.title}",
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    Helpers.formatDate(movie?.releaseDate),
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
