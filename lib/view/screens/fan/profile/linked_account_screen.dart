import 'package:flutter/material.dart';

import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_button.dart';
import '../../../custom/my_textfeild.dart';



class LinkedAccountScreen extends StatelessWidget {
  const LinkedAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Linked Account",
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
