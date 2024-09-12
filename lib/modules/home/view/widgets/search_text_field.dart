import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_movies/modules/search/controller/search_movies_controller.dart';
import 'package:my_movies/shared/shared_colors.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({super.key});

  static const double height = 40;
  static const double radius = 25;

  final controller = Get.find<SearchMoviesController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: height,
        child: GetBuilder<SearchMoviesController>(
          builder: (_) {
            return TextField(
              controller: controller.searchQueryController,
              onChanged: (value) => controller.queryString = value,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                hintText: "Search Movies",
                filled: true,
                fillColor: SharedColors.lightGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    bottomLeft: Radius.circular(radius),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
