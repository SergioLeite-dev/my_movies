import 'package:get/get.dart';
import 'package:my_movies/services/http_client_service.dart';

class ApplicationBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HttpClientService(), fenix: true);
  }
}
