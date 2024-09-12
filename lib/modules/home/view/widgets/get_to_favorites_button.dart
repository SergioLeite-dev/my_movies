import 'package:flutter/material.dart';
import 'package:my_movies/shared/shared_colors.dart';

class GetToFavoritesButton extends StatelessWidget {
  const GetToFavoritesButton({super.key});

  static const double height = 40;
  static const double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: () {
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: SharedColors.appWhite,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: const Size.fromRadius(height / 2),
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
        ),
        child: const Icon(
          Icons.favorite_border,
          size: iconSize,
          color: SharedColors.favoritesRed,
        ),
      ),
    );
  }
}
