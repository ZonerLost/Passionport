import 'package:flutter/material.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';
import 'package:passion_port/view/custom/custom_appbar.dart';
import 'package:passion_port/view/custom/my_button.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';
import 'package:passion_port/view/custom/my_textfeild.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Account Settings",
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(onTap: (){}, buttonText: "Save"),
        ),
      ),
      body: Padding(
        padding: AppSizes.DEFAULT,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildInputField(label: "Email", hint: "example@email.com",),
            SizedBox(height: 10,),
            buildInputField(label: "Phone Number", hint: "+1 (000) 000 0000",),
            SizedBox(height: 10,),
            buildInputField(label: "Current Password", hint: "123qwe456",),
            SizedBox(height: 5,),
            MyText(
              text: "Change Password",
              size: 12,
              weight: FontWeight.w600,
              color: kPrimaryColor,
            ),

          ],
        ),
      ),
    );
  }
  Widget buildInputField({
    required String label,
    required String hint,
    TextEditingController? controller,
    int maxLines = 1, // default is single line
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: kWhiteLightColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: label,
            size: 13,
            weight: FontWeight.w600,
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            maxLines: maxLines, // ✅ added here
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              isCollapsed: true,
              border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: kGreyTxColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
