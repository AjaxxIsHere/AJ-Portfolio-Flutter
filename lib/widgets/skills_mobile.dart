// ignore_for_file: library_private_types_in_public_api, unused_field

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../materialConstants/color_palette.dart';
import '../materialConstants/skills_items.dart';

class SkillsMobile extends StatefulWidget {
  const SkillsMobile({super.key});

  @override
  _SkillsMobileState createState() => _SkillsMobileState();
}

class _SkillsMobileState extends State<SkillsMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _fadeAnimation;
  bool _isInView = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
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
    return VisibilityDetector(
      key: Key('skills-mobile'),
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
        margin: const EdgeInsets.all(30),
        child: Column(
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
            const SizedBox(height: 40),
            for (int i = 0; i < platformItems.length; i++)
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(i % 2 == 0 ? -1.0 : 1.0, 0.0),
                  end: Offset.zero,
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeInOut,
                )),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5.0),
                    width: double.maxFinite,
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
                          blurRadius: 4,
                          offset: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      leading: Image.asset(platformItems[i]["img"],
                          width: 40, height: 40),
                      title: Text(platformItems[i]["name"]),
                    ),
                  ),
                ),
              ),
            const SizedBox(
              height: 50,
            ),
            Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  for (int i = 0; i < skillsItems.length; i++)
                    Chip(
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
                      shadowColor: CustomColors.redSecondary,
                      elevation: 8,
                    ),
                ])
          ],
        ),
      ),
    );
  }
}
