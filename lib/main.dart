import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:passion_port/view/screens/brand/brand_bottom_nav_bar/brand_bottom_nav_bar.dart';
import 'package:passion_port/view/screens/brand/brand_home/brand_home_screen.dart';
import 'package:passion_port/view/screens/brand/brand_home/stats_widget.dart';
import 'package:passion_port/view/screens/fan/chat/message_screen.dart';
import 'package:passion_port/view/screens/fan/fan_bottom_nav_bar/fan_bottom_nav_bar.dart';
import 'package:passion_port/view/screens/fan/post/create_post_screen.dart';
import 'package:passion_port/view/screens/fan/post/edit_post_add_details_screen.dart';
import 'package:passion_port/view/screens/fan/post/post_add_details_screen.dart';
import 'package:passion_port/view/screens/fan/profile/account_settings_screen.dart';
import 'package:passion_port/view/screens/fan/profile/add_payment_details_screen.dart';
import 'package:passion_port/view/screens/fan/profile/edit_profile_screen.dart';
import 'package:passion_port/view/screens/fan/profile/general_setting_screen.dart';
import 'package:passion_port/view/screens/fan/profile/linked_account_screen.dart';
import 'package:passion_port/view/screens/fan/profile/login_account_screen.dart';
import 'package:passion_port/view/screens/fan/profile/notification_screen.dart';
import 'package:passion_port/view/screens/fan/profile/payment_method_screen.dart';
import 'package:passion_port/view/screens/fan/profile/profile_screen.dart';
import 'package:passion_port/view/screens/fan/profile/setting_screen.dart';
import 'package:passion_port/view/screens/fan/search/search_screen.dart';
import 'package:passion_port/view/screens/fan/shop/brand_post_and_campagin_view/campagin_view_screen.dart';
import 'package:passion_port/view/screens/fan/shop/brand_post_and_campagin_view/post_view_screen.dart';
import 'package:passion_port/view/screens/fan/shop/shop_cart_screen.dart';
import 'package:passion_port/view/screens/fan/shop/shop_payment_screen.dart';
import 'package:passion_port/view/screens/fan/shop/shop_product_detail_screen.dart';
import 'package:passion_port/view/screens/fan/shop/shop_product_screen.dart';
import 'package:passion_port/view/screens/fan/shop/shop_profile_screen.dart';
import 'package:passion_port/view/screens/fan/shop/shop_screen.dart';
import 'package:passion_port/view/screens/fan/userProfile/user_profile_screen.dart';
import 'package:passion_port/view/splash_service/splash_screen.dart';

import 'config/constants/app_fonts.dart';
import 'controller/select_role_controller/select_role_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await UserSimplePreferences.init();
  // ✅ Set bottom navigation bar color globally
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Optional
      statusBarIconBrightness: Brightness.dark, // Optional
      systemNavigationBarColor: Colors.black, // Bottom nav bar color
      systemNavigationBarIconBrightness: Brightness.light, // Icons color
    ),
  );
  Get.put(SelectRoleController());
  runApp(MyApp());
}

final String dummyImage2 = 'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
final String dummyImage1 = 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face';
final String dummyImage = 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: "Passion Port",
      theme: ThemeData(
        fontFamily: AppFonts.poppins,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      ),
      home: BrandBottomNavBar(),
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
