import 'package:flutter/material.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_button.dart';
import '../../../custom/my_text_widget.dart';



class BrandEditProfileScreen extends StatelessWidget {
  const BrandEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Edit Profile",
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(onTap: (){}, buttonText: "Save"),
        ),
      ),
      body: Padding(
        padding: AppSizes.HORIZONTAL,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonImageView(
              imagePath: Assets.imagesNike,
              height: 80,
            ),
            SizedBox(height: 15,),
            MyText(
              text: "Change profile picture",
              size: 14,
              weight: FontWeight.w600,
              color: kPrimaryColor,
            ),
            SizedBox(height: 30,),
            buildInputField(label: "Brand Name", hint: "Nike",),
            SizedBox(height: 10,),
            buildInputField(label: "User Name", hint: "Jhoony_D",),
            SizedBox(height: 10,),
            buildInputField(label: "Bio", hint: "Lorem ipsum dolor sit amet consectetur. Consequat a odio semper cum sit vulputate commodo sed ut. Lorem facilisis.",maxLines: 3),
            SizedBox(height: 10,),
            buildInputField(label: "Website URL", hint: "https.www.nike.com/",),
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
