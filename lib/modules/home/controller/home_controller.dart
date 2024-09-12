import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movies/configuration/environment_values.dart';
import 'package:my_movies/models/trending/request/trending_request_model.dart';
import 'package:my_movies/models/trending/response/movie_result_model.dart';
import 'package:my_movies/models/trending/response/trending_response_model.dart';
import 'package:my_movies/services/http_client_service.dart';

enum TimeWindow {
  day,
  week,
}

class HomeController extends GetxController {
  final HttpClientService _client;

  HomeController(this._client);

  //Trending API
  TrendingRequestModel trendingRequest = TrendingRequestModel(page: 1);
  TrendingResponseModel? response;
  List<MovieResultModel> trendingMoviesToday = [];
  List<MovieResultModel> trendingMoviesThisWeek = [];
  TimeWindow window = TimeWindow.day;

  @override
  void onInit() {
    print("oia eu aqui!\n\n");
    getMovies();
    super.onInit();
  }

  Future<void> getMovies() async {
    try {
      final path = "${EnvironmentValues.trendingBaseURL}/${window.name}";
      print(path);
      final responseRaw = await _client.get(path, trendingRequest.toMap());
      response = TrendingResponseModel.fromMap(responseRaw);
      trendingMoviesToday = response?.results ?? [];
      print(response);
      for (var e in trendingMoviesToday) {
        print(e.title);
      }
      update();
    } on DioException catch (e) {
      debugPrint(e.message);
      debugPrint(e.response.toString());
    }
  }
}
