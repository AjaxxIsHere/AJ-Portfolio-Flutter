import 'package:test2/materialConstants/color_palette.dart';
import 'package:test2/materialConstants/header_decoration.dart';
import 'package:test2/widgets/logo.dart';
import 'package:flutter/material.dart';

class HeaderMobile extends StatelessWidget {
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(25, 5, 20, 5),
      decoration: HeaderDeco,
      child: Row(
        children: [
          Logo(
            onTap: onLogoTap,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: onMenuTap,
                icon: const Icon(
                  Icons.menu,
                  color: CustomColors.hintDark,
                )),
          )
        ],
      ),
    );
  }
}
