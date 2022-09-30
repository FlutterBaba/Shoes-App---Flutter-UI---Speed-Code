import 'package:flutter/material.dart';
import 'package:flutter_shoes_app_ui/components/shake_transition.dart';
import 'package:flutter_shoes_app_ui/constants.dart';
import 'package:flutter_shoes_app_ui/data/data.dart';
import 'package:flutter_shoes_app_ui/models/product.dart';
import 'package:flutter_shoes_app_ui/screen/details/details_page.dart';
import 'package:flutter_shoes_app_ui/screen/home_page/components/popular_item.dart';
import 'package:flutter_shoes_app_ui/screen/home_page/components/search_bar.dart';
import 'package:flutter_shoes_app_ui/screen/home_page/components/top_bar.dart';
import 'package:flutter_shoes_app_ui/screen/home_page/components/top_brands_item.dart';
import 'package:flutter_svg/svg.dart';

// size use for MediaQuery
Size? size;

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final ValueNotifier<bool> valueNotifier = ValueNotifier(true);
  void _onTapItem({
    required Product product,
    required BuildContext context,
  }) async {
    valueNotifier.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: DetailsPage(
            product: product,
          ),
        );
      }),
    );
    valueNotifier.value = true;
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: ShakeTransition(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: kPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Top Bar..
                          const TopBar(),
                          SizedBox(height: size!.height * .026),
                          // Search Bar
                          const SearchBar(),
                          SizedBox(height: size!.height * .027),
                          const Text(
                            "Top Brands",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: gilroySemibold,
                            ),
                          ),
                          SizedBox(height: size!.height * .017),
                        ],
                      ),
                    ),
                    // Top Brands Items
                    const ShakeTransition(
                      child: TopBrandsItem(),
                    ),
                    SizedBox(height: size!.height * .039),
                    const Padding(
                      padding: EdgeInsets.only(left: 35),
                      child: Text(
                        "Popular",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: gilroySemibold,
                        ),
                      ),
                    ),
                    SizedBox(height: size!.height * .039),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 17.5),
                      child: GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 21,
                        ),
                        itemBuilder: (context, index) {
                          Product product = products[index];
                          return Transform.translate(
                            offset: Offset(0.0, index.isOdd ? 37 : 0),
                            child: PopularIten(
                              product: product,
                              onTap: () {
                                _onTapItem(context: context, product: product);
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: valueNotifier,
              child: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/home_icon.svg",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/heart_icon.svg",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/cart_icon.svg",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/icons/profile_icon.svg",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              builder: (context, value, child) {
                return AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: 0,
                  right: 0,
                  height: kToolbarHeight,
                  bottom: value ? 0 : -kToolbarHeight,
                  child: child!,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
