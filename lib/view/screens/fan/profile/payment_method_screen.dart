import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/screens/fan/profile/add_payment_details_screen.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_text_widget.dart';

class PaymentMethodScreen extends StatelessWidget {
  PaymentMethodScreen({super.key});
  RxString selectedMethod = "visa".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Payment Method",
        actions: [
          CommonImageView(svgPath: Assets.svgMore),
          SizedBox(width: 15),
        ],
      ),
      body: Padding(
        padding: AppSizes.DEFAULT,
        child: Obx(
          () => Column(
            children: [
              PaymentCard(
                title: "Visa/Mastercard",
                value: "both",
                groupValue: selectedMethod.value,
                onChanged: (val) => selectedMethod.value = val,
                firstImage: Assets.svgVisa,
                secondImage: Assets.svgMastercard,
              ),
              const SizedBox(height: 10),
              PaymentCard(
                title: "Stripe",
                value: "stripe",
                groupValue: selectedMethod.value,
                onChanged: (val) => selectedMethod.value = val,
                firstImage: Assets.svgStripe,
              ),
              const SizedBox(height: 10),
              PaymentCard(
                title: "Paypal",
                value: "paypal",
                groupValue: selectedMethod.value,
                onChanged: (val) => selectedMethod.value = val,
                firstImage: Assets.svgP1,
              ),
              const SizedBox(height: 10),
              PaymentCard(
                title: "Google Pay",
                value: "google pay",
                groupValue: selectedMethod.value,
                onChanged: (val) => selectedMethod.value = val,
                firstImage: Assets.svgG1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  final String title;
  final dynamic value;
  final dynamic groupValue;
  final ValueChanged<dynamic>? onChanged;
  final String? firstImage;
  final String? secondImage;

  const PaymentCard({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    this.onChanged,
    this.firstImage,
    this.secondImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(value);
          Get.to(()=>AddPaymentDetailsScreen());
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 13),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isSelected ? kPrimaryColor : kWhiteLightColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Row(
          children: [
            RadioTheme(
              data: RadioThemeData(
                fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                  if (states.contains(MaterialState.selected)) {
                    return kPrimaryColor;
                  }
                  return kGreyTxColor;
                }),
              ),
              child: Radio(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
            if (firstImage != null) CommonImageView(svgPath: firstImage!,),

            if (secondImage != null) const SizedBox(width: 8),

            if (secondImage != null) CommonImageView(svgPath: secondImage!),

            const SizedBox(width: 12),

            MyText(
              text: title,
              size: 17,
              weight: FontWeight.w500,
              color: kBlack2Color,
            ),
          ],
        ),
      ),
    );
  }
}
