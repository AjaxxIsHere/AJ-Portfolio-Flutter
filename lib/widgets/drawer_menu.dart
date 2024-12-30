import 'package:test2/materialConstants/color_palette.dart';
import 'package:test2/materialConstants/nav_format.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key, required this.onNavItemTap});
  final Function(int) onNavItemTap;

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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColors.bgLight2,
      child: ListView(children: [
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20, top: 10, bottom: 20, right: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close)),
          ),
        ),
        for (int i = 0; i < navTitles.length; i++)
          ListTile(
            leading: Icon(
              navIcons[i],
              color: CustomColors.whiteSecondary,
            ),
            title: Text(
              navTitles[i],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Pixelify',
                color: CustomColors.whiteSecondary,
              ),
            ),
            onTap: () {
              // Navigator.pop(context);
              // _scrollToSection(navKeys[i]);
              onNavItemTap(i);
            },
          ),
      ]),
    );
  }
}
