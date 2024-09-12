import 'package:get/get.dart';
import 'package:my_movies/modules/home/home_bindings.dart';
import 'package:my_movies/modules/home/view/home_page.dart';
import 'package:my_movies/modules/search/search_bindings.dart';
import 'package:my_movies/modules/search/view/search_results_page.dart';

class RouteManager {
  RouteManager._();

  static String home = "/";
  static String search = "/search";

  static List<GetPage> routes = [
    GetPage(
      name: home,
      binding: HomeBindings(),
      page: () => HomePage(Get.find(), Get.find()),
    ),
    GetPage(
      name: search,
      binding: SearchBindings(),
      page: () => SearchResultsPage(Get.find()),
    ),
  ];
}
