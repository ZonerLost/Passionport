import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../config/constants/app_colors.dart';
import '../../../config/constants/app_sizes.dart';
import '../../../controller/select_role_controller/select_role_controller.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/my_button.dart';
import '../../custom/my_text_widget.dart';
import '../brand/auth/brand_auth_bottom_sheets.dart';
import '../fan/auth/fan_auth_bottom_sheets.dart';
import '../fan/auth/role_widget.dart';


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
    /*WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.bottomSheet(
        const SelectRoleBottomSheet(),
        isScrollControlled: true,
        isDismissible: false,
        enableDrag: false,
      );
    });*/
  }
  @override
  Widget build(BuildContext context) {
    final SelectRoleController roleController = Get.find<SelectRoleController>();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
              ),
              child: Padding(
                padding: AppSizes.DEFAULT,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonImageView(
                      svgPath: Assets.svgLogo2,
                    ),
                    SizedBox(height: 20,),
                    MyText(
                      text: "Select a role",
                      size: 22,
                      weight: FontWeight.w600,
                    ),
                    SizedBox(height: 10,),
                    MyText(
                      text:  'Which of these roles define you best?',
                      size: 15,
                      weight: FontWeight.w400,
                      color: kGreyTxColor,
                    ),
                    SizedBox(height: 30,),
                    Obx(() => RadioOption(
                      value: "fan",
                      groupValue: roleController.selectedRole.value,
                      onChanged: (val) => roleController.selectedRole.value = val,
                      title: "Fan",
                      subtitle: "Users who can buy from brands / creators and also support their funding campaigns",
                    )),
                    const SizedBox(height: 15),
                    Obx(() => RadioOption(
                      value: "brand",
                      groupValue: roleController.selectedRole.value,
                      onChanged: (val) => roleController.selectedRole.value = val,
                      title: "Brand",
                      subtitle: "Users who can sell through app and engage fans through funding campaigns",
                    )),
                    SizedBox(height: 30,),
                    MyButton(
                      onTap: () {
                        Get.back();
                        if (roleController.selectedRole.value == "fan") {
                          // Go to Fan Login
                          Get.bottomSheet(
                            const LoginBottomSheet(), // Replace with your Fan Login Bottom Sheet
                            isScrollControlled: true,
                            isDismissible: false,
                            enableDrag: false,
                          );
                        } else {
                          // Go to Brand Login
                          Get.bottomSheet(
                            const BrandLoginBottomSheet(), // Replace with your Brand Login Bottom Sheet
                            isScrollControlled: true,
                            isDismissible: false,
                            enableDrag: false,
                          );
                        }
                      },
                      buttonText: "Next",
                    )



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

