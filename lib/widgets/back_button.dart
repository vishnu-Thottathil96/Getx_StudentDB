import 'package:flutter/material.dart';
import '../constants/colors.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
    this.icon = Icons.arrow_back_ios_new,
    this.iconcolor = whiteColor,
    required this.onPressed,
  });
  final IconData icon;
  final Color iconcolor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        size: 30,
        color: iconcolor,
      ),
    );
  }
}
