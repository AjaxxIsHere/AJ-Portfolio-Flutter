import 'package:flutter/material.dart';
import 'package:test2/materialConstants/color_palette.dart';
import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Text(
        "< AJ />",
        style: TextStyle(
          fontSize: 30,
          // fontWeight: FontWeight.w900,
          fontFamily: 'Pixelify',
          color: CustomColors.redPrimary,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
