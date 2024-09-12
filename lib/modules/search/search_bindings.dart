import 'package:get/get.dart';
import 'package:my_movies/modules/search/controller/search_movies_controller.dart';
import 'package:my_movies/services/http_client_service.dart';

class SearchBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HttpClientService());
    Get.lazyPut(() => SearchMoviesController(Get.find()));
  }
}
