import 'package:test2/materialConstants/color_palette.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
BoxDecoration HeaderDeco = const BoxDecoration(
  gradient:
      LinearGradient(colors: [Colors.transparent, CustomColors.redPrimary]),
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(90),
    bottomRight: Radius.circular(90),
  ),
);
