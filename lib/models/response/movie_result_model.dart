class MovieResultModel {
  final bool? adult;
  final String? backdropPath;
  final int? id;
  final String? title;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final String? posterPath;
  final String? mediaType;
  final List<int>? genreIds;
  final double? popularity;
  final String? releaseDate;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;
  final String? name;
  final String? firstAirDate;
  final String? profilePath;

  MovieResultModel({
    this.adult,
    this.backdropPath,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.genreIds,
    this.popularity,
    this.releaseDate,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.name,
    this.firstAirDate,
    this.profilePath,
  });

  factory MovieResultModel.fromMap(Map<String, dynamic> json) {
    return MovieResultModel(
      backdropPath: json["backdrop_path"],
      id: json["id"],
      title: json["title"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      mediaType: json["media_type"],
      adult: json["adult"],
      originalLanguage: json["original_language"],
      genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
      popularity: json["popularity"]?.toDouble(),
      releaseDate: json["release_date"],
      video: json["video"],
      voteAverage: json["vote_average"]?.toDouble(),
      voteCount: json["vote_count"],
      name: json["name"],
      firstAirDate: json["first_air_date"],
      profilePath: json["profile_path"],
    );
  }
}
