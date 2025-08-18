import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_button.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});
  final RxBool isSwitched = true.obs;
  final RxBool isToggled = true.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Notifications",
        actions: [
          CommonImageView(svgPath: Assets.svgMore),
          SizedBox(width: 15),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(onTap: () {}, buttonText: "Save"),
        ),
      ),
      body: Padding(
        padding: AppSizes.HORIZONTAL,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 6),
              decoration: ShapeDecoration(
                color: kQuaternaryColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: kWhiteLightColor),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: "Allow Notifications",
                    size: 15,
                    weight: FontWeight.w600,
                  ),
                  Obx(
                    () => Switch(
                      value: isSwitched.value,
                      onChanged: (value) {
                        isSwitched.value = value;
                      },
                      activeColor: Colors.white,
                      activeTrackColor: Colors.orange,
                      inactiveThumbColor: Colors.orange,
                      inactiveTrackColor: Colors.white,
                      trackOutlineColor: MaterialStateProperty.all(Colors.orange),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // ✅ removes extra tap padding
                    ),
                  ),
                ],
              ),
            ),
            /*Obx(
              () => CustomToggleSwitch(
                value: isToggled.value,
                onChanged: (value) {
                  isToggled.value = value;
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

class CustomToggleSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double width;
  final double height;

  const CustomToggleSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
    this.width = 60.0,
    this.height = 30.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height / 2),
          color: value ? Colors.orange : Colors.grey[300],
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
              top: 2.0,
              left: value ? width - height + 2 : 2.0,
              right: value ? 2.0 : width - height + 2,
              child: Container(
                width: 50,
                height: height - 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
