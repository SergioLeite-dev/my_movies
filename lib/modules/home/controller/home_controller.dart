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

  //Infinite Scroll & Loading
  late final ScrollController scrollController;
  bool finishedInitializing = false;
  bool isLoading = false;
  int page = 1;

  @override
  void onInit() {
    getMovies();
    scrollController = ScrollController(initialScrollOffset: 5.0)..addListener(_scrollListener);
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> getMovies() async {
    try {
      final path = "${EnvironmentValues.trendingBaseURL}/${window.name}";
      final responseRaw = await _client.get(path, trendingRequest.toMap());
      response = TrendingResponseModel.fromMap(responseRaw);
      final newMovies = response?.results ?? [];
      trendingMoviesToday.addAll(newMovies);
      isLoading = false;
      update();
    } on DioException catch (e) {
      debugPrint(e.message);
      debugPrint(e.response.toString());
    } finally {
      finishedInitializing = true;
    }
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      if (finishedInitializing) {
        isLoading = true;
        debugPrint("Loading more Movies...");
        update();
        page++;
        trendingRequest = trendingRequest.copyWith(page: page);
        getMovies();
      }
    }
  }
}
