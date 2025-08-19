import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_button.dart';
import '../../../custom/my_text_widget.dart';
import '../profile/payment_method_screen.dart';

class ShopPaymentScreen extends StatelessWidget {
   ShopPaymentScreen({super.key});

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
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: kCBGColor),
          child: Padding(
            padding: AppSizes.DEFAULT,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Total Amount",
                      size: 12,
                      weight: FontWeight.w400,
                      color: kGreyTxColor,
                    ),
                    SizedBox(height: 8,),
                    MyText(
                      text: "\$300.00",
                      size: 22,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                    width: 140,
                    child: MyButton(onTap: (){}, buttonText: "Cash Out")),
              ],
            ),
          ),
        ),
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
