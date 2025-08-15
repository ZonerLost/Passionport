import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../generated/assets.dart';
import '../fan/auth/fan_auth_bottom_sheets.dart';


class SelectRole extends StatefulWidget {
  const SelectRole({super.key});

  @override
  State<SelectRole> createState() => _SelectRoleState();
}

class _SelectRoleState extends State<SelectRole> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.bottomSheet(
        const SelectRoleBottomSheet(),
        isScrollControlled: true,
        isDismissible: false,
        enableDrag: false,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBg), // your image path
            fit: BoxFit.cover, // fill the screen
          ),
        ),
      ),
    );
  }
}

