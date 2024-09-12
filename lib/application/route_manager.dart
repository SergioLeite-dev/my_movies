import 'package:get/get.dart';
import 'package:my_movies/modules/home/home_bindings.dart';
import 'package:my_movies/modules/home/view/home_page.dart';

class RouteManager {
  static String home = "/";

  static List<GetPage> routes = [
    GetPage(
      name: home,
      binding: HomeBindings(),
      page: () => HomePage(Get.find()),
    ),
  ];
}
