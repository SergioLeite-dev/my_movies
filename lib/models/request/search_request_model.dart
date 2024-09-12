import 'package:my_movies/configuration/environment_values.dart';

class SearchRequestModel {
  final String apikey = EnvironmentValues.apiKey;
  final String query;
  final int page;

  SearchRequestModel({
    required this.query,
    required this.page,
  });

  SearchRequestModel copyWith({
    int? page,
    String? query,
  }) {
    return SearchRequestModel(
      query: query ?? this.query,
      page: page ?? this.page,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "api_key": apikey,
      "query": query,
      "page": page,
    };
  }
}
