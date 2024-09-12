import 'package:get/get.dart';
import 'package:my_movies/modules/home/controller/home_controller.dart';
import 'package:my_movies/services/http_client_service.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HttpClientService());
    Get.lazyPut(() => HomeController(Get.find()));
  }
}
