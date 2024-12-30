import 'package:test2/materialConstants/header_decoration.dart';
import 'package:flutter/material.dart';
import 'package:test2/materialConstants/color_palette.dart';
import 'package:test2/materialConstants/nav_format.dart';
import 'package:test2/utils/rainbow_text.dart';
import 'package:test2/widgets/logo.dart';

class HeaderDesktop extends StatefulWidget {
  const HeaderDesktop({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

  @override
  // ignore: library_private_types_in_public_api
  _HeaderDesktopState createState() => _HeaderDesktopState();
}

class _HeaderDesktopState extends State<HeaderDesktop> {
  final List<bool> _isHoveredList =
      List.generate(navTitles.length, (index) => false);
  final List<GlobalKey> navKeys =
      List.generate(navTitles.length, (index) => GlobalKey());

  // void _scrollToSection(GlobalKey key) {
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     if (key.currentContext != null) {
  //       Scrollable.ensureVisible(
  //         key.currentContext!,
  //         duration: const Duration(seconds: 1),
  //         curve: Curves.easeInOut,
  //       );
  //     }
  //   });
  // }

  void onNavMenuTap(int index) {
    widget.onNavItemTap(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: HeaderDeco,
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Row(
        children: [
          const Logo(),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHoveredList[i] = true),
                onExit: (_) => setState(() => _isHoveredList[i] = false),
                child: TextButton(
                  onPressed: () {
                    // _scrollToSection(navKeys[i]);
                    onNavMenuTap(i);
                  },
                  child: _isHoveredList[i]
                      ? AnimatedRainbowText(
                          text: navTitles[i],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Pixelify',
                          ),
                        )
                      : Text(
                          navTitles[i],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Pixelify',
                            color: CustomColors.bgLight1,
                          ),
                        ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
