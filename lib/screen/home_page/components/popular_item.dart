import 'package:flutter/material.dart';
import 'package:flutter_shoes_app_ui/constants.dart';
import 'package:flutter_shoes_app_ui/models/product.dart';

class PopularIten extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const PopularIten({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(34),
            child: Material(
              color: kSecondaryColor,
              child: InkWell(
                onTap: onTap,
                child: Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(product.image),
                    ),
                  ),
                  child: Transform.translate(
                    offset: const Offset(-25, -10),
                    child: Image.asset(
                      product.brandImage,
                      height: 29,
                      width: 47,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 19,
        ),
        Expanded(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  product.price.toString(),
                  style: const TextStyle(
                    fontSize: 22,
                    fontFamily: gilroySemibold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 22,
                    color: kTextLightColor,
                    fontFamily: gilroySemibold,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
