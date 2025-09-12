import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_fonts.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_dropdown.dart';
import '../../../custom/my_button.dart';
import '../../../custom/my_text_widget.dart';
import '../../../custom/my_textfeild.dart';
import '../../fan/auth/auth_dialog.dart';
import '../../fan/auth/fan_auth_bottom_sheets.dart';
import '../brand_bottom_nav_bar/brand_bottom_nav_bar.dart';



class BrandLoginBottomSheet extends StatelessWidget {
  const BrandLoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool showPassword = false.obs;
    return  SingleChildScrollView(
      child: SafeArea(
        child: Container(
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
                  text: "Login",
                  size: 22,
                  weight: FontWeight.w600,
                ),
                SizedBox(height: 10,),
                MyText(
                  text:  'Enter your credentials to login!',
                  size: 15,
                  weight: FontWeight.w400,
                  color: kGreyTxColor,
                ),
                SizedBox(height: 30,),
                MyTextField(
                  label: "Bussiness Email",
                  hint: "example@email.com",
                ),
                Obx(() => MyTextField(
                  label: "Password",
                  hint: "******",
                  isObSecure: !showPassword.value, // toggle visibility
                  suffix: GestureDetector(
                    onTap: () => showPassword.value = !showPassword.value,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: CommonImageView(
                        svgPath: showPassword.value
                            ? Assets.svgShow // 👁 open eye
                            : Assets.svgHide, // 👁 closed eye
                      ),
                    ),
                  ),
                  marginBottom: 5,
                )),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                      Get.bottomSheet(
                          const BrandVerifyAccountBottomSheet(),
                          isScrollControlled: true,
                          isDismissible: false,
                          enableDrag: false
                      );
                    },
                    child: MyText(
                      text: "Forgot Password",
                      size: 12,
                      weight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                MyButton(onTap: (){
                 Get.to(()=>BrandBottomNavBar());
                }, buttonText: "Login"),
                SizedBox(height: 40,),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                      Get.bottomSheet(
                          const BrandCreateAccountBottomSheet(),
                          isScrollControlled: true,
                          isDismissible: false,
                          enableDrag: false
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don’t have an account?',
                            style: TextStyle(
                              color: kBlack2Color,
                              fontSize: 12,
                              fontFamily: AppFonts.poppins,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: kBlack2Color,
                              fontSize: 12,
                              fontFamily: AppFonts.poppins,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Create Account',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 12,
                              fontFamily: AppFonts.poppins,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}



class BrandCreateAccountBottomSheet extends StatelessWidget {
  const BrandCreateAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool showPassword = false.obs;
    RxBool showConfirmPassword = false.obs;
    return  SingleChildScrollView(
      child: SafeArea(
        child: Container(
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
                  text: "Create Account",
                  size: 22,
                  weight: FontWeight.w600,
                ),
                SizedBox(height: 10,),
                MyText(
                  text:  'Provide credentials to create a new account',
                  size: 15,
                  weight: FontWeight.w400,
                  color: kGreyTxColor,
                ),
                SizedBox(height: 30,),
                MyTextField(
                  label: "Brand Name",
                  hint: "Nike",
                ),
                MyTextField(
                  label: "Username",
                  hint: "@nike_official",
                ),
                MyTextField(
                  label: "Bussiness Email",
                  hint: "example@email.com",
                ),
                Obx(() => MyTextField(
                  label: "Password",
                  hint: "******",
                  isObSecure: !showPassword.value, // toggle visibility
                  suffix: GestureDetector(
                    onTap: () => showPassword.value = !showPassword.value,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: CommonImageView(
                        svgPath: showPassword.value
                            ? Assets.svgShow // 👁 open eye
                            : Assets.svgHide, // 👁 closed eye
                      ),
                    ),
                  ),
                )),
                Obx(() => MyTextField(
                  label: "Confirm Password",
                  hint: "******",
                  isObSecure: !showConfirmPassword.value, // toggle visibility
                  suffix: GestureDetector(
                    onTap: () => showConfirmPassword.value = !showConfirmPassword.value,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: CommonImageView(
                        svgPath: showConfirmPassword.value
                            ? Assets.svgShow // 👁 open eye
                            : Assets.svgHide, // 👁 closed eye
                      ),
                    ),
                  ),
                )),
                SizedBox(height: 25,),
                MyButton(onTap: (){
                  Get.back();
                  Get.bottomSheet(
                       BrandAdditionalDetails(),
                      isScrollControlled: true,
                      isDismissible: false,
                      enableDrag: false
                  );

                }, buttonText: "Create Account"),
                SizedBox(height: 40,),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                      Get.bottomSheet(
                          const BrandLoginBottomSheet(),
                          isScrollControlled: true,
                          isDismissible: false,
                          enableDrag: false
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(
                              color: kBlack2Color,
                              fontSize: 12,
                              fontFamily: AppFonts.poppins,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' ',
                            style: TextStyle(
                              color: kBlack2Color,
                              fontSize: 12,
                              fontFamily: AppFonts.poppins,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 12,
                              fontFamily: AppFonts.poppins,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}



class BrandAdditionalDetails extends StatelessWidget {
   BrandAdditionalDetails({super.key});
  RxString selectedCategory = "Sports Accessories".obs;
   final List<String> sportsAccessoriesCategories = [
     "Footballs & Basketballs",
     "Cricket Bats & Balls",
     "Tennis & Badminton Rackets",
     "Sports Shoes",
     "Gym & Fitness Equipment",
     "Protective Gear (Helmets, Pads, Gloves)",
     "Sportswear & Jerseys",
     "Bags & Backpacks",
     "Water Bottles & Shakers",
   ];

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: SafeArea(
        child: Container(
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
                  text: "Additional Details",
                  size: 22,
                  weight: FontWeight.w600,
                ),
                SizedBox(height: 10,),
                MyText(
                  text:  'You can always change them from profile settings',
                  size: 15,
                  weight: FontWeight.w400,
                  color: kGreyTxColor,
                ),
                SizedBox(height: 30,),
                Obx(() => CustomDropDown(
                  labelText: "Business Category",
                  hint: "Sports Accessories",
                  items: sportsAccessoriesCategories,
                  selectedValue: selectedCategory.value, // ✅ reactive binding
                  onChanged: (value) {
                    if (value != null) {
                      selectedCategory.value = value;   // ✅ update state
                    }
                  },
                ),),
                MyTextField(
                  label: "Website URL",
                  hint: "https.www.nike.com/",
                ),
                MyTextField(
                  label: "Phone Number",
                  hint: "+1 (000) 000 0000",
                ),
                MyTextField(
                  label: "Short Bio",
                  hint: "Add a description...",
                  maxLines: 4,
                ),
                SizedBox(height: 20,),
                MyButton(onTap: (){

                }, buttonText: "Continue"),
                SizedBox(height: 20,),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                      Get.bottomSheet(
                          const BrandLoginBottomSheet(),
                          isScrollControlled: true,
                          isDismissible: false,
                          enableDrag: false
                      );
                    },
                    child: MyText(
                        text: "Skip for now",
                      size: 17,
                      weight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20,),


              ],
            ),
          ),
        ),
      ),
    );
  }
}



class BrandVerifyAccountBottomSheet extends StatelessWidget {
  const BrandVerifyAccountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: SafeArea(
        child: Container(
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                        Get.bottomSheet(
                            const BrandLoginBottomSheet(

                            ),
                            isScrollControlled: true,
                            isDismissible: false,
                            enableDrag: false
                        );
                      },
                      child: CommonImageView(
                        imagePath: Assets.imagesBackButton,
                        height: 32,
                      ),
                    ),
                    SizedBox(width: 12,),
                    CommonImageView(
                      svgPath: Assets.svgLogo2,
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                MyText(
                  text: "Verify Account",
                  size: 22,
                  weight: FontWeight.w600,
                ),
                SizedBox(height: 10,),
                MyText(
                  text:  'Enter your email to verify your account',
                  size: 15,
                  weight: FontWeight.w400,
                  color: kGreyTxColor,
                ),
                SizedBox(height: 30,),
                MyTextField(
                  label: "Bussiness Email",
                  hint: "example@email.com",
                ),
                SizedBox(height: 25,),
                MyButton(onTap: (){
                  AuthDialog.showAuthDialog(
                    title: "Code Sent",
                    desc: "Code sent to your email. Please check your email to provide code",
                    buttonText: "Enter Code",
                    onTap: (){
                      Get.back();
                      Get.back();
                      Get.bottomSheet(
                          const EnterCodeBottomSheet(),
                          isScrollControlled: true,
                          isDismissible: false,
                          enableDrag: false
                      );
                    },
                  );
                }, buttonText: "Send Code"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


