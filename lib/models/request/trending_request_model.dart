import 'package:my_movies/configuration/environment_values.dart';

class TrendingRequestModel {
  final String apikey = EnvironmentValues.apiKey;
  final int page;

  TrendingRequestModel({
    required this.page,
  });

  TrendingRequestModel copyWith({
    int? page,
  }) {
    return TrendingRequestModel(
      page: page ?? this.page,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "api_key": apikey,
      "page": page,
    };
  }
}
