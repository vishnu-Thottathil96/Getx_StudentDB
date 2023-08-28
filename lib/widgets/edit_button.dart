import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class EditButtonWidget extends StatelessWidget {
  const EditButtonWidget({
    super.key,
    this.icon = CupertinoIcons.pencil_outline,
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
