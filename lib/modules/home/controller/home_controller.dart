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
  List<MovieResultModel> selectedMovies = [];
  TimeWindow window = TimeWindow.day;
  final List<bool> windowSelection = <bool>[true, false];

  //Infinite Scroll & Loading
  late final ScrollController scrollController;
  bool finishedInitializing = false;
  bool isLoading = false;
  int pageForToday = 1;
  int pageForThisWeek = 1;
  bool shouldDisplayBackToTop = false;

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

  void toggleTrendingWindow(int index) {
    if (index == 0) {
      windowSelection[0] = true;
      windowSelection[1] = false;
      window = TimeWindow.day;
      selectedMovies = trendingMoviesToday;
    }
    if (index == 1) {
      windowSelection[0] = false;
      windowSelection[1] = true;
      window = TimeWindow.week;
      selectedMovies = trendingMoviesThisWeek;
      if (selectedMovies.isEmpty) getMovies();
    }
    update();
  }

  Future<void> getMovies() async {
    try {
      final path = "${EnvironmentValues.trendingBaseURL}/${window.name}";
      final responseRaw = await _client.get(path, trendingRequest.toMap());
      response = TrendingResponseModel.fromMap(responseRaw);
      final newMovies = response?.results ?? [];
      if (window == TimeWindow.day) {
        trendingMoviesToday.addAll(newMovies);
        selectedMovies = trendingMoviesToday;
      } else {
        trendingMoviesThisWeek.addAll(newMovies);
        selectedMovies = trendingMoviesThisWeek;
      }
      isLoading = false;
      update();
    } on DioException catch (e) {
      debugPrint(e.message);
      debugPrint(e.response.toString());
    } finally {
      finishedInitializing = true;
    }
  }

  backToTop() {
    scrollController.animateTo(0, duration: const Duration(milliseconds: 1600), curve: Curves.easeOutCubic);
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      if (finishedInitializing) {
        isLoading = true;
        debugPrint("Loading more Movies for ${window.name}...");
        update();
        if (window == TimeWindow.day) {
          pageForToday++;
          trendingRequest = trendingRequest.copyWith(page: pageForToday);
        } else {
          pageForThisWeek++;
          trendingRequest = trendingRequest.copyWith(page: pageForThisWeek);
        }
        getMovies();
      }
    }

    if (!shouldDisplayBackToTop && scrollController.offset > 1200) {
      shouldDisplayBackToTop = true;
      //print(shouldDisplayBackToTop);
      update();
    }
    if (shouldDisplayBackToTop && scrollController.offset == 0) {
      shouldDisplayBackToTop = false;
      //print(shouldDisplayBackToTop);
      update();
    }
  }
}
