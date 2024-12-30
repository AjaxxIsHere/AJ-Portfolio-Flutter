import 'package:flutter/material.dart';

class AnimatedRainbowAvatar extends StatefulWidget {
  final double radius;
  final Duration duration;

  const AnimatedRainbowAvatar({
    super.key,
    this.radius = 50.0,
    this.duration = const Duration(seconds: 2),
  });

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedRainbowAvatarState createState() => _AnimatedRainbowAvatarState();
}

class _AnimatedRainbowAvatarState extends State<AnimatedRainbowAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(); // Repeat the animation indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: const [
                Colors.red,
                Color.fromARGB(255, 192, 133, 44),
                Color.fromARGB(255, 175, 160, 26),
                Colors.green,
                Colors.blue,
                Colors.indigo,
                Colors.purple,
              ],
              tileMode: TileMode.mirror,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              transform: GradientRotation(_controller.value * 2 * 3.14159),
            ).createShader(bounds);
          },
          child: CircleAvatar(
            radius: widget.radius,
            backgroundColor: Colors.white,
          ),
        );
      },
    );
  }
}
