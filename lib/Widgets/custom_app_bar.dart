import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 32,
          ),
        ),
        const Spacer(),
        if (icon != null)
          CustomIcon(
            onPressed: onPressed,
            icon: icon!,
          ),
      ],
    );
  }
}
