import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movies/configuration/environment_values.dart';
import 'package:my_movies/models/request/search_request_model.dart';
import 'package:my_movies/models/response/movie_result_model.dart';
import 'package:my_movies/models/response/trending_response_model.dart';
import 'package:my_movies/services/http_client_service.dart';

class SearchMoviesController extends GetxController {
  final HttpClientService _client;

  SearchMoviesController(this._client);

  final searchQueryController = TextEditingController();
  String queryString = "";

  //Trending API
  SearchRequestModel searchRequest = SearchRequestModel(query: "", page: 1);
  MovieListResponseModel? response;
  List<MovieResultModel> searchedMovies = [];

  //Infinite Scroll & Loading
  late final ScrollController scrollController;
  bool finishedInitializing = false;
  bool isLoading = false;
  int page = 1;
  bool shouldDisplayBackToTop = false;

  @override
  void onInit() {
    getSearch();
    scrollController = ScrollController(initialScrollOffset: 5.0)..addListener(_scrollListener);
    super.onInit();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void searchFromResultsPage() {
    if (queryString == searchRequest.query) return;
    searchRequest = SearchRequestModel(query: queryString, page: 1);
    searchedMovies.clear();
    getSearch();
  }

  Future<void> getSearch() async {
    try {
      const path = EnvironmentValues.searchURL;
      final responseRaw = await _client.get(path, searchRequest.toMap());
      response = MovieListResponseModel.fromMap(responseRaw);
      final newMovies = response?.results ?? [];
      searchedMovies.addAll(newMovies);
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
        debugPrint("Searching for '${null}'...");
        update();
        page++;
        searchRequest = searchRequest.copyWith(page: page);
        getSearch();
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
