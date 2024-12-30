import 'package:flutter/material.dart';
import '../materialConstants/color_palette.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:test2/utils/rainbow_text.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:glowy_borders/glowy_borders.dart';
import 'package:url_launcher/url_launcher.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainMobileState createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutExpo,
    ));
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutExpo,
    ));
    _slideController.forward();
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return SingleChildScrollView(
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: screenWidth / 10, vertical: 20),
        height: screenSize.height / 1.2,
        constraints: const BoxConstraints(
          minHeight: 560,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: AvatarGlow(
                        glowColor: CustomColors.redSecondary,
                        glowRadiusFactor: 0.1,
                        curve: Curves.bounceInOut,
                        duration: Duration(milliseconds: 2000),
                        repeat: true,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          radius: 110.0,
                          child: Image.asset(
                            "assets/ProfilePic.png",
                            width: screenWidth,
                            height: 220,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Hi !, I'm Mohamad Ajaz",
              style: TextStyle(
                fontSize: 30,
                height: 1.5,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pixelify',
                color: CustomColors.redPrimary,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "A Flutter Developer",
                  textStyle: const TextStyle(
                    fontSize: 24,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pixelify',
                    color: Colors.red,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  "A Gamer",
                  textStyle: const TextStyle(
                    fontSize: 24,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pixelify',
                    color: Colors.lightGreen,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  "A University Student",
                  textStyle: const TextStyle(
                    fontSize: 24,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pixelify',
                    color: Color.fromARGB(255, 66, 133, 244),
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
                TypewriterAnimatedText(
                  "A Freelancer",
                  textStyle: const TextStyle(
                    fontSize: 24,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Pixelify',
                    color: Color.fromARGB(255, 244, 160, 0),
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              repeatForever: true,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Im an aspiring flutter developer I am passionate about creating mobile applications and games. Currently pursuing a Bachelor's degree in Computer Science and Software Engineering. I am also a freelancer who loves to work on projects that challenge me and help me grow. Think im good for your team? Lets get in touch!",
              style: TextStyle(
                fontSize: 12,
                height: 1.5,
                fontWeight: FontWeight.w100,
                color: CustomColors.whiteSecondary,
                fontFamily: "Pixelify",
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            AnimatedGradientBorder(
              gradientColors: [
                Colors.white,
                const Color.fromARGB(255, 159, 159, 159),
                const Color.fromARGB(255, 236, 236, 236),
                const Color.fromARGB(255, 99, 99, 99),
              ],
              glowSize: 6,
              borderRadius: BorderRadius.circular(15),
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHovered = true),
                onExit: (_) => setState(() => _isHovered = false),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.resolveWith(
                      (states) => CustomColors.redPrimary,
                    ),
                    overlayColor: WidgetStateProperty.resolveWith(
                      (states) {
                        if (states.contains(WidgetState.hovered)) {
                          return const Color.fromARGB(255, 47, 47, 47);
                        }
                        return null;
                      },
                    ),
                  ),
                  onPressed: () {
                    const url =
                        'https://drive.google.com/uc?export=download&id=1UE3NFxiIhLvMqBYX-WZymkyH2vTkca2b';
                    launchUrl(Uri.parse(url));
                  },
                  child: _isHovered
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AnimatedRainbowText(
                              text: "Download my Resume!",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Pixelify',
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.download,
                              color: CustomColors.whiteSecondary,
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Download my Resume!",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Pixelify',
                                color: CustomColors.bgLight1,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.download,
                              color: CustomColors.hintDark,
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
