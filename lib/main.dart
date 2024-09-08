import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movies/application/application_bindings.dart';
import 'package:my_movies/application/route_manager.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Movies',
      initialBinding: ApplicationBindings(),
      getPages: RouteManager.routes,
    );
  }
}
