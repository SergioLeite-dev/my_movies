import 'package:flutter/material.dart';
import 'package:my_movies/shared/shared_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  static const double height = 40;
  static const double radius = 25;

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SizedBox(
        height: height,
        child: TextField(
          controller: null,
          decoration: InputDecoration(
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
        ),
      ),
    );
  }
}
