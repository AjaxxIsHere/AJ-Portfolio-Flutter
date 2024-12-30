// import 'package:aj_porfolio_web/materialConstants/color_palette.dart';
// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   const CustomTextField({
//     super.key,
//     this.controller,
//     this.maxLine = 1,
//     this.hintText,
//   });
//   final TextEditingController? controller;
//   final int maxLine;
//   final String? hintText;

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       maxLines: maxLine,
//       style: const TextStyle(
//         color: CustomColors.redPrimary,
//       ),
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.all(15),
//         filled: true,
//         fillColor: const Color.fromARGB(255, 144, 144, 144),
//         focusedBorder: getInputBorder,
//         enabledBorder: getInputBorder,
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide.none),
//         hintText: hintText,
//         hintStyle: const TextStyle(
//           color: Color.fromARGB(255, 81, 81, 81),
//         ),
//       ),
//     );
//   }

//   OutlineInputBorder get getInputBorder {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide.none,
//     );
//   }
// }

import 'package:test2/materialConstants/color_palette.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.maxLines = 1,
    this.hintText, required IconData icon,
  });

  final TextEditingController? controller;
  final int maxLines;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(
        color: CustomColors.redPrimary,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: const Color.fromARGB(255, 144, 144, 144),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 81, 81, 81),
        ),
      ),
    );
  }
}
