import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_fonts.dart';
import '../../../../generated/assets.dart';
import '../../../custom/my_text_widget.dart';
import '../../fan/home/home_screen.dart';
import '../../fan/post/create_post_screen.dart';
import '../../fan/profile/profile_screen.dart';
import '../../fan/search/search_screen.dart';
import '../../fan/shop/shop_screen.dart';
import '../brand_home/brand_home_screen.dart';
import '../brand_post/brand_create_post_screen.dart';
import '../brand_profile/brand_profile_screen.dart';
import '../brand_shop/brand_shop_screen.dart';

class BrandBottomNavBar extends StatefulWidget {
  const BrandBottomNavBar({super.key});

  @override
  State<BrandBottomNavBar> createState() => _BrandBottomNavBarState();
}

class _BrandBottomNavBarState extends State<BrandBottomNavBar> {
  final RxInt currentIndex = 0.obs;

  late List<Map<String, dynamic>> items;

  @override
  void initState() {
    super.initState();
    updateItems();
  }

  void updateItems() {
    items = [
      {'image': Assets.imagesDashboard, 'label': 'Dashboard'},
      {'image': Assets.imagesSearch, 'label': 'Search'},
      {'image': Assets.imagesPost, 'label': 'Post'},
      {'image': Assets.imagesShop, 'label': 'Shop'},
      {'image': Assets.imagesNike, 'label': 'Profile'},
    ];
  }

  final List<Widget> screens = [
    BrandHomeScreen(),
    SearchScreen(),
    BrandCreatePostScreen(),
    BrandShopScreen(),
    BrandProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: screens[currentIndex.value],
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(color: kCBGColor),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            onTap: (index) {
              currentIndex.value = index;
              log(currentIndex.value.toString());
              updateItems();
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex.value,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedLabelStyle: TextStyle(
              fontFamily: AppFonts.poppins,
              color: kDividerColor,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: AppFonts.poppins,
              color: kDividerColor,
            ),
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: kGreyTxColor,
            items: List.generate(items.length, (index) {
              final isActive = currentIndex.value == index;
              return BottomNavigationBarItem(
                tooltip: 'ss',
                icon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      items[index]['image'],
                      color:
                          index == 4
                              ? null
                              : (isActive ? kPrimaryColor : kGreyTxColor),
                      width: 32,
                    ),
                    const SizedBox(height: 4),
                    MyText(
                      text: items[index]['label'],
                      color: isActive ? kPrimaryColor : kGreyTxColor,
                      size: 12,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                label: '',
              );
            }),
          ),
        ),
      ),
    );
  }
}
