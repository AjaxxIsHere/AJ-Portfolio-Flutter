// ignore_for_file: deprecated_member_use

import 'package:test2/utils/project_utils.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'package:flutter/material.dart';
import '../materialConstants/color_palette.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.screenWidth,
    required this.project,
  });

  final double screenWidth;
  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
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
                "My Projects:",
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
          const SizedBox(height: 30),
          Wrap(children: [
            for (var project in projectItems)
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: ProjectCardsWidget(project: project))
          ]),
        ],
      ),
    );
  }
}

class ProjectCardsWidget extends StatefulWidget {
  const ProjectCardsWidget({
    super.key,
    required this.project,
  });

  final ProjectUtils project;

  @override
  // ignore: library_private_types_in_public_api
  _ProjectCardsWidgetState createState() => _ProjectCardsWidgetState();
}

class _ProjectCardsWidgetState extends State<ProjectCardsWidget> {
  bool _isHovered = false;
  bool _isInView = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: VisibilityDetector(
        key: Key(widget.project.title),
        onVisibilityChanged: (VisibilityInfo info) {
          if (screenWidth < 600) {
            bool inView = info.visibleFraction > 0.99;
            if (_isInView != inView) {
              setState(() => _isInView = inView);
            }
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          transform: _isHovered || _isInView
              ? (Matrix4.identity()..scale(1.03))
              : (Matrix4.identity()..scale(0.98)),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColors.bgLight1,
            boxShadow: _isHovered || _isInView
                ? [
                    BoxShadow(
                      color: CustomColors.redSecondary.withOpacity(0.5),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ]
                : [],
          ),
          clipBehavior: Clip.antiAlias,
          foregroundDecoration: screenWidth < 600 && !_isInView
              ? BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                )
              : null,
          height: 331,
          width: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                widget.project.image,
                height: 140,
                width: 250,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
                child: Text(
                  widget.project.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: CustomColors.whitePrimary),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                child: Text(widget.project.subtitle,
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: CustomColors.whiteSecondary)),
              ),
              const Spacer(),
              // footer
              Container(
                color: const Color.fromARGB(255, 78, 78, 78),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    const Text(
                      "Check it out on:",
                      style: TextStyle(
                          color: CustomColors.whitePrimary,
                          fontSize: 15,
                          fontFamily: "Pixelify"),
                    ),
                    const Spacer(),
                    for (int i = 0; i < widget.project.url!.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(1),
                        child: InkWell(
                          onTap: () {
                            js.context
                                .callMethod("open", [widget.project.url![i]]);
                          },
                          child: Image.asset(widget.project.linklogo[i],
                              height: 20, width: 20),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
