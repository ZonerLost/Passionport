import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:passion_port/config/constants/app_fonts.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';
import 'package:passion_port/view/custom/my_button.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';
import 'package:passion_port/view/custom/my_textfeild.dart';
import 'package:passion_port/view/screens/fan/auth/role_widget.dart';
import 'package:pinput/pinput.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../custom/custom_animated_row.dart';
import 'auth_dialog.dart';


class SelectRoleBottomSheet extends StatelessWidget {
  const SelectRoleBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    RxString selectedRole = "fan".obs;
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
                  groupValue: selectedRole.value,
                  onChanged: (val) => selectedRole.value = val,
                  title: "Fan",
                  subtitle: "Users who can buy from brands and campaigns to support them through social means",
                )),
                const SizedBox(height: 15),
                Obx(() => RadioOption(
                  value: "brand",
                  groupValue: selectedRole.value,
                  onChanged: (val) => selectedRole.value = val,
                  title: "Brand",
                  subtitle: "Users who can sell through app and engage fans through campaigns",
                )),
                SizedBox(height: 30,),
                MyButton(
                    onTap: (){
                      Get.back();
                      Get.bottomSheet(
                          const LoginBottomSheet(),
                          isScrollControlled: true,
                          isDismissible: false,
                          enableDrag: false
                      );
                    }, buttonText: "Next"),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key});

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
                  label: "Email",
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
                        const VerifyAccountBottomSheet(),
                        isScrollControlled: true,
                        isDismissible: false,
                        enableDrag: false,
                      );
                    },
                    child: MyText(
                      text: "Forgot Password",
                      size: 12,
                      weight: FontWeight.w500,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                MyButton(onTap: (){
                }, buttonText: "Login"),
                SizedBox(height: 40,),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: kWhiteLightColor,
                        height: 0.50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: MyText(
                        text: "or",
                        color: kWhiteLightColor,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: kWhiteLightColor,
                        height: 0.50,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 35),
                      decoration: ShapeDecoration(
                        color: kQuaternaryColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: kWhiteLightColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: CommonImageView(
                        svgPath: Assets.svgGoogle,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 35),
                      decoration: ShapeDecoration(
                        color: kQuaternaryColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: kWhiteLightColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: CommonImageView(
                        svgPath: Assets.svgFacebook,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 35),
                      decoration: ShapeDecoration(
                        color: kQuaternaryColor,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            color: kWhiteLightColor,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: CommonImageView(
                        svgPath: Assets.svgApple,
                      ),
                    ),


                  ],
                ),
                SizedBox(height: 40,),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                      Get.bottomSheet(
                          const CreateAccountBottomSheet(),
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
                              fontWeight: FontWeight.w500,
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

class CreateAccountBottomSheet extends StatelessWidget {
  const CreateAccountBottomSheet({super.key});

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
                  label: "Username",
                  hint: "Jhon Doe",
                ),
                MyTextField(
                  label: "Email",
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

                }, buttonText: "Create Account"),
                SizedBox(height: 40,),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                      Get.bottomSheet(
                          const LoginBottomSheet(

                          ),
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
                              fontWeight: FontWeight.w500,
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

class VerifyAccountBottomSheet extends StatelessWidget {
  const VerifyAccountBottomSheet({super.key});

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
                  label: "Email",
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

class EnterCodeBottomSheet extends StatelessWidget {
  const EnterCodeBottomSheet({super.key});

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
                  text: "Enter Code",
                  size: 22,
                  weight: FontWeight.w600,
                ),
                SizedBox(height: 10,),
                MyText(
                  text:  'Enter the 4-digit code sent to your email',
                  size: 15,
                  weight: FontWeight.w400,
                  color: kGreyTxColor,
                ),
                SizedBox(height: 30,),
                MyText(
                  text: "Code",
                  size: 12,
                  weight: FontWeight.w600,
                ),
                SizedBox(height: 3,),
                AnimatedRow(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Pinput(
                      length: 4,
                      defaultPinTheme: PinTheme(
                        width: 44,
                        height: 50,
                        textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
                            fontFamily: AppFonts.poppins,
                            color: kPrimaryColor
                        ),
                        decoration: BoxDecoration(
                            color: kCBGColor, // Center color
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kWhiteLightColor, width: 1)
                        ),
                        //margin: EdgeInsets.only(left: 8),
                      ),
                      focusedPinTheme: PinTheme(
                        width: 44,
                        height: 50,
                        textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          fontFamily: AppFonts.poppins,
                          color: kPrimaryColor,
                        ),
                        decoration: BoxDecoration(
                            color: kCBGColor,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kPrimaryColor, width: 1)),
                        // margin: EdgeInsets.only(left: 8),
                      ),
                      submittedPinTheme: PinTheme(
                        width: 44,
                        height: 50,
                        textStyle: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: kPrimaryColor,
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: kPrimaryColor, width: 1),
                        ),
                        // margin: EdgeInsets.only(left: 8),
                      ),
                      onCompleted: (pin) {},
                    ),
                  ],
                ),
                SizedBox(height: 25,),
                MyButton(onTap: (){
                  AuthDialog.showAuthDialog(
                    title: "Code Verified",
                    desc: "Your account has been verified by the code. You can proceed with changing password",
                    buttonText: "Change Password",
                    onTap: (){
                      Get.back();
                      Get.back();
                      Get.bottomSheet(
                          const ResetPasswordBottomSheet(),
                          isScrollControlled: true,
                          isDismissible: false,
                          enableDrag: false
                      );
                    },
                  );
                }, buttonText: "Verify Code"),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ResetPasswordBottomSheet extends StatelessWidget {
  const ResetPasswordBottomSheet({super.key});

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
                  text: "Reset Password",
                  size: 22,
                  weight: FontWeight.w600,
                ),
                SizedBox(height: 10,),
                MyText(
                  text:  'Please enter a new password to secure your account',
                  size: 15,
                  weight: FontWeight.w400,
                  color: kGreyTxColor,
                ),
                SizedBox(height: 30,),
                Obx(() => MyTextField(
                  label: "New Password",
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
                SizedBox(height: 25,),
                MyButton(onTap: (){
                  AuthDialog.showAuthDialog(
                    title: "Password Changed",
                    desc: "Congratulations! Your account has been protected",
                    buttonText: "Go to Home",
                    onTap: (){},
                  );
                }, buttonText: "Reset Password"),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
