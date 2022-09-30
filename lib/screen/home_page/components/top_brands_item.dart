import 'package:flutter/material.dart';
import 'package:flutter_shoes_app_ui/constants.dart';
import 'package:flutter_shoes_app_ui/data/data.dart';

class TopBrandsItem extends StatelessWidget {
  const TopBrandsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(left: 33),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Material(
                    color: kPrimaryColor,
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        height: 73,
                        width: 70,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Image.asset(
                            e,
                            height: 12,
                            width: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
