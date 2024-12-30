import 'dart:math';
import 'package:flutter/material.dart';

class GlowingButton extends StatefulWidget {
  const GlowingButton({super.key});

  @override
  State<GlowingButton> createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  final Color color1 = Colors.red;
  final Color color2 = Colors.blue;
  double width = 200;
  double height = 50;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )
      ..forward()
      ..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return InkWell(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            onHover: (value) {
              isHovered = value;
              if (width != 200) {
                width = 200;
                height = 50;
              }
            },
            onTapDown: (details) {
              width = 190;
              height = 45;
            },
            onTapUp: (details) {
              width = 200;
              height = 50;
            },
            child: Container(
              width: width,
              height: height,
              color: Colors.amber,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    // ignore: deprecated_member_use
                    color: Colors.white.withOpacity(0.1),
                    width: 2,
                  ),
                  gradient: isHovered
                      ? LinearGradient(
                          colors: [color1, color2],
                          transform:
                              GradientRotation(controller.value * pi * 2),
                        )
                      : null,
                  color: isHovered ? null : Colors.grey[800],
                  boxShadow: [
                    BoxShadow(
                      color: color2,
                      blurRadius: 10,
                      spreadRadius: 1.5,
                      offset:
                          Offset.fromDirection(controller.value * 2 * pi, 3.5),
                    ),
                    BoxShadow(
                      color: color1,
                      blurRadius: 10,
                      spreadRadius: 1.5,
                      offset: Offset.fromDirection(
                          (controller.value + 0.5) * 2 * pi, 3.5),
                    )
                  ]),
              child: Center(
                child: Text(
                  'Glowing Button',
                  style: TextStyle(
                    color: isHovered ? Colors.black : Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
