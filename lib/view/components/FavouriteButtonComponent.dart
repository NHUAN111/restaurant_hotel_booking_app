import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final double right;
  final double top;
  final VoidCallback onPressed;
  final Color iconColor;

  const FavoriteButton({
    Key? key,
    this.right = 8.0,
    this.top = 8.0,
    required this.onPressed,
    this.iconColor = const Color.fromARGB(255, 240, 18, 18),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: top,
      child: IconButton(
        icon: Icon(
          Icons.favorite_border,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
