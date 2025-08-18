import 'package:flutter/material.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';
import 'package:passion_port/view/custom/my_textfeild.dart';

import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_button.dart';


class LoginAccountScreen extends StatelessWidget {
  const LoginAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Login Account",
        actions: [
          CommonImageView(
            svgPath: Assets.svgMore,
          ),
          SizedBox(width: 15,),
        ],
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
          children: [
            MyTextField(
              prefix: Padding(
                padding: const EdgeInsets.all(12),
                child: CommonImageView(
                  svgPath: Assets.svgGoogle,
                ),
              ),
              hint: "example@gmail.com",
              isReadOnly: true,
              filledColor: Colors.transparent,
            ),
            MyTextField(
              prefix: Padding(
                padding: const EdgeInsets.all(12),
                child: CommonImageView(
                  svgPath: Assets.svgFacebook,
                ),
              ),
              hint: "/jhondoe",
              isReadOnly: true,
            ),

          ],
        ),
      ),
    );
  }
}
