// ignore_for_file: deprecated_member_use

import 'package:test2/materialConstants/color_palette.dart';
import 'package:test2/materialConstants/social_media_links.dart';
import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile>
    with TickerProviderStateMixin {
  late final GifController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GifController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () =>
                  launchURL('https://www.youtube.com/watch?v=dQw4w9WgXcQ'),
              child: FittedBox(
                child: Gif(
                  image: AssetImage("assets/6oa.gif"),
                  controller: _controller,
                  autostart: Autostart.loop,
                  width: 100, // Set the desired width
                  height: 100, // Set the desired height
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              ' "I’m a developer passionate about creating user-friendly, impactful applications. From a simple project to a revolutional idea, I blend creativity and technical expertise to deliver meaningful, functional designs. Feel free to reach out—I’m always excited to connect and collaborate on new challenges." ',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Pixelify',
                color: CustomColors.whitePrimary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: socialMediaLinks
                  .map((link) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          foregroundColor: CustomColors.whitePrimary,
                          backgroundColor: CustomColors.bgLight1,
                          padding: const EdgeInsets.all(20),
                        ),
                        onPressed: () {
                          // Handle button press
                          if (link.name == 'Gmail') {
                            launchURL('mailto:${link.url}');
                          } else {
                            launchURL(link.url);
                          }
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(link.iconPath, width: 30, height: 30),
                            const SizedBox(width: 10),
                            Text(
                              link.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Pixelify',
                              ),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
