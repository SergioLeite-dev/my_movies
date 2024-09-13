import 'package:flutter/material.dart';
import 'package:my_movies/configuration/environment_values.dart';
import 'package:my_movies/models/response/movie_result_model.dart';
import 'package:my_movies/shared/helper_functions.dart';
import 'package:my_movies/shared/shared_colors.dart';

class MovieTile extends StatelessWidget {
  const MovieTile(this.movie, {super.key});

  final MovieResultModel? movie;

  static const double width = 220;
  static const double imgHeight = 330;
  static const factor = 0.8;

  @override
  Widget build(BuildContext context) {
    String? posterURL;
    String? profileURL;
    if (movie?.posterPath != null) {
      posterURL = "${EnvironmentValues.posterBaseURL}/${movie?.posterPath}";
    }
    if (movie?.profilePath != null) {
      profileURL = "${EnvironmentValues.posterBaseURL}/${movie?.profilePath}";
    }
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      height: imgHeight * factor,
      child: Row(
        children: [
          SizedBox(
            width: width * factor,
            height: imgHeight * factor,
            child: (posterURL != null || profileURL != null)
                ? Image.network(
                    posterURL ?? profileURL ?? "",
                    fit: BoxFit.fill,
                  )
                : const Placeholder(),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 6),
                Text(
                  movie?.title ?? movie?.name ?? "",
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  Helpers.formatDate(movie?.releaseDate ?? movie?.firstAirDate ?? ""),
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: SharedColors.darkGrey,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Text(
                    movie?.overview ?? "",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      fontSize: 12,
                      color: SharedColors.darkGrey,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
