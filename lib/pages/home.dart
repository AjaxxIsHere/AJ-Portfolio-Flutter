import 'package:test2/materialConstants/color_palette.dart';
import 'package:test2/materialConstants/size_layout.dart';
import 'package:test2/utils/project_utils.dart';
import 'package:test2/widgets/contact_desktop.dart';
import 'package:test2/widgets/contact_mobile.dart';
import 'package:test2/widgets/drawer_menu.dart';
import 'package:test2/widgets/header_mobile.dart';
import 'package:test2/widgets/main_desktop.dart';
import 'package:test2/widgets/main_mobile.dart';
import 'package:test2/widgets/skills_desktop.dart';
import 'package:flutter/material.dart';
import 'package:test2/widgets/header_desktop.dart';
import '../widgets/project_cards.dart';
import '../widgets/skills_mobile.dart';
import 'package:test2/utils/rainbow_text.dart';

class Home extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
            key: scaffoldKey,
            backgroundColor: CustomColors.scaffoldBackground,
            endDrawer: constraints.maxWidth >= MinWidth
                ? null
                : DrawerMenu(
                    onNavItemTap: (int navIndex) {
                      scrollToIndex(navIndex);
                      scaffoldKey.currentState?.closeEndDrawer();
                    },
                  ),
            body: Container(
              //padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                //color: CustomColors.textFieldBackground,
                border: Border.all(color: CustomColors.hintDark, width: 10),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    // MAIN
                    Column(
                      children: [
                        if (constraints.maxWidth > 600)
                          HeaderDesktop(
                            onNavItemTap: (int navIndex) {
                              // call function to scroll to the selected index
                              scrollToIndex(navIndex);
                            },
                          )
                        else
                          HeaderMobile(
                            onLogoTap: () {},
                            onMenuTap: () {
                              scaffoldKey.currentState?.openEndDrawer();
                            },
                          ),
                      ],
                    ),
                    // About
                    Container(
                      decoration: BoxDecoration(
                        //color: CustomColors.textFieldBackground,
                        border: Border.symmetric(
                          horizontal: BorderSide(
                              color: CustomColors.hintDark, width: 5),
                        ),
                        //borderRadius: BorderRadius.circular(20),
                      ),
                      child: constraints.maxWidth > 740
                          ? const MainDesktop()
                          : const MainMobile(),
                    ),

                    // Skills

                    Container(
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(
                              color: CustomColors.hintDark, width: 5),
                        ),
                        //borderRadius: BorderRadius.circular(10),
                      ),
                      child: constraints.maxWidth > 740
                          ? SkillsDesktop(
                              key: navbarKeys[1],
                            )
                          : SkillsMobile(
                              key: navbarKeys[1],
                            ),
                    ),

                    // Projects
                    // SizedBox(key: navbarKeys[2]),
                    Container(
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //     color: CustomColors.hintDark, width: 2.5),
                        border: Border.symmetric(
                          horizontal: BorderSide(
                              color: CustomColors.hintDark, width: 5),
                        ),
                        //borderRadius: BorderRadius.circular(10),
                      ),
                      child: ProjectCardWidget(
                        key: navbarKeys[2],
                        screenWidth: screenWidth,
                        project: projectItems[0],
                      ),
                    ),

                    // Contact
                    Container(
                      decoration: BoxDecoration(
                        //color: CustomColors.textFieldBackground,
                        border: Border.symmetric(
                          horizontal: BorderSide(
                              color: CustomColors.hintDark, width: 5),
                        ),
                        //borderRadius: BorderRadius.circular(10),
                      ),
                      key: navbarKeys[3],
                      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Divider(
                                  color: CustomColors.whitePrimary,
                                  thickness: 2,
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "Get in touch:",
                                style: TextStyle(
                                  fontSize: 45,
                                  color: CustomColors.whitePrimary,
                                  fontFamily: 'Pixelify',
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Divider(
                                  color: CustomColors.whitePrimary,
                                  thickness: 2,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          if (constraints.maxWidth > 1000)
                            const ContactDesktop()
                          else
                            const ContactMobile(),
                          const SizedBox(height: 50),
                          Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Designed and made by AJ using Flutter ",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: CustomColors.whitePrimary,
                                ),
                              ),
                              const Text(
                                "and a little bit of ",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: CustomColors.whitePrimary,
                                ),
                              ),
                              Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 11,
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "All rights reserved © 2024 ",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: CustomColors.whitePrimary,
                                ),
                              ),
                              AnimatedRainbowText(
                                text: "Larry&AJ Co.",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: CustomColors.whitePrimary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }

  void scrollToIndex(int index) {
    final key = navbarKeys[index];
    // final RenderBox renderBox = key.currentContext?.findRenderObject() as RenderBox;
    // final position = renderBox.localToGlobal(Offset.zero);
    // scrollController.animateTo(position.dy,
    //     duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);

    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(milliseconds: 500),
        alignment: 0.5,
        curve: Curves.easeIn);
  }
}
