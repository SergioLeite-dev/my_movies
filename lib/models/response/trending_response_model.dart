import 'package:my_movies/models/response/movie_result_model.dart';

class MovieListResponseModel {
  final int? page;
  final List<MovieResultModel>? results;
  final int? totalPages;
  final int? totalResults;

  MovieListResponseModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory MovieListResponseModel.fromMap(Map<String, dynamic> map) {
    return MovieListResponseModel(
      page: map['page'] != null ? map['page'] as int : null,
      results: map['results'] == null ? null : List<MovieResultModel>.from(map["results"].map((x) => MovieResultModel.fromMap(x))),
      totalPages: map['totalPages'] != null ? map['totalPages'] as int : null,
      totalResults: map['totalResults'] != null ? map['totalResults'] as int : null,
    );
  }
}
