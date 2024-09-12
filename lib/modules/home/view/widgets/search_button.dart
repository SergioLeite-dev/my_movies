import 'package:flutter/material.dart';
import 'package:my_movies/shared/shared_colors.dart';

class SearchButton extends StatelessWidget {
  final void Function() onPressed;

  const SearchButton({required this.onPressed, super.key});

  static const double height = 40;
  static const double radius = 25;
  static const double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
          FocusScope.of(context).unfocus();
        },
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(radius),
              bottomRight: Radius.circular(radius),
            ),
          ),
          backgroundColor: SharedColors.favoritesRed,
        ),
        child: const Icon(
          Icons.search,
          size: iconSize,
          color: SharedColors.appWhite,
        ),
      ),
    );
  }
}
