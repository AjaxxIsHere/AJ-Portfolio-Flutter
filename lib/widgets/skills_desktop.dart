import 'package:test2/materialConstants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../materialConstants/skills_items.dart';

class SkillsDesktop extends StatefulWidget {
  const SkillsDesktop({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SkillsDesktopState createState() => _SkillsDesktopState();
}

class _SkillsDesktopState extends State<SkillsDesktop>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimationLeft;
  late Animation<Offset> _offsetAnimationRight;
  late Animation<double> _fadeAnimation;
  bool _isInView = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _offsetAnimationLeft = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _offsetAnimationRight = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return VisibilityDetector(
      key: Key('skills-desktop'),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.5 && !_isInView) {
          setState(() {
            _isInView = true;
            _controller.forward();
          });
        } else if (info.visibleFraction <= 0.5 && _isInView) {
          setState(() {
            _isInView = false;
            _controller.reverse();
          });
        }
      },
      child: Container(
        height: 518,
        width: screenWidth,
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
        color: CustomColors.scaffoldBackground,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: CustomColors.whitePrimary,
                    thickness: 2,
                    endIndent: 10,
                  ),
                ),
                const Text(
                  "What I can do:",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.whitePrimary,
                    fontFamily: 'Pixelify',
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: CustomColors.whitePrimary,
                    thickness: 2,
                    indent: 10,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),

            // platforms and skills
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //platforms
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 450,
                    maxHeight: 300,
                  ),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: [
                      for (int i = 0; i < platformItems.length; i++)
                        SlideTransition(
                          position: _offsetAnimationLeft,
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                color: CustomColors.bgLight1,
                                borderRadius: BorderRadius.circular(90),
                                border: Border.all(
                                  color: CustomColors.redSecondary,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: CustomColors.redPrimary,
                                    blurRadius: 8,
                                    offset: const Offset(0, 0),
                                  ),
                                ],
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                leading: Image.asset(platformItems[i]["img"],
                                    width: 30),
                                title: Text(platformItems[i]["name"]),
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                  width: 30,
                ),
                Flexible(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 450,
                    ),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        for (int i = 0; i < skillsItems.length; i++)
                          SlideTransition(
                            position: _offsetAnimationRight,
                            child: FadeTransition(
                              opacity: _fadeAnimation,
                              child: Chip(
                                side: const BorderSide(
                                  color: CustomColors.redPrimary,
                                  width: 1,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 16),
                                label: Text(skillsItems[i]["name"]),
                                avatar: Image.asset(
                                  skillsItems[i]["img"],
                                  width: 30,
                                ),
                                backgroundColor: CustomColors.bgLight1,
                                shadowColor:
                                    CustomColors.redPrimary,
                                elevation: 8,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
