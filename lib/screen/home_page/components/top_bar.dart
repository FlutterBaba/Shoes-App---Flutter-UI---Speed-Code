import 'package:flutter/material.dart';
import 'package:flutter_shoes_app_ui/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Sneaks',
          style: TextStyle(
            fontFamily: gilroyBold,
            fontSize: 18.0,
            color: kTextColor,
          ),
        ),
        SvgPicture.asset("assets/icons/notification_icon.svg"),
      ],
    );
  }
}
