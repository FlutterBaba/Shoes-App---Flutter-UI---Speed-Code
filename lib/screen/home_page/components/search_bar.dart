import 'package:flutter/material.dart';
import 'package:flutter_shoes_app_ui/constants.dart';
import 'package:flutter_svg/svg.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(vertical: 14),
              child: SvgPicture.asset(
                "assets/icons/search_icon.svg",
              ),
            ),
            hintText: "Search",
            hintStyle: const TextStyle(
              fontSize: 18,
              fontFamily: gilroySemibold,
              color: ksearchColor,
            ),
          ),
        ),
      ),
    );
  }
}
