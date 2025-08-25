import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:passion_port/view/custom/my_textfeild.dart';

import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/custom_dropdown.dart';
import '../../../custom/my_button.dart';



class AddPaymentDetailsScreen extends StatelessWidget {
   AddPaymentDetailsScreen({super.key});
   RxString selectedOccupation = "Bank Of America".obs;
   final List<String> occupationList = [
    "Bank Of America",
    "PayPal",
    "Debit",
    "Credit",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Visa/Mastercard",
        actions: [
          CommonImageView(svgPath: Assets.svgMore),
          SizedBox(width: 15),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: MyButton(onTap: () {}, buttonText: "Confirm"),
        ),
      ),
      body: Padding(
        padding: AppSizes.DEFAULT,
        child: Column(
          children: [
            Obx(() => CustomDropDown(
              labelText: "Bank",
              hint: "Bank Of America",
              items: occupationList,
              selectedValue: selectedOccupation.value, // ✅ reactive binding
              onChanged: (value) {
                if (value != null) {
                  selectedOccupation.value = value;   // ✅ update state
                }
              },
            ),),
            MyTextField(
              label: "Name of holder",
              hint: "Jhon Doe",
            ),
            MyTextField(
              label: "Card Number",
              hint: "1234 5678 90123",
            ),
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                    label: "Exp. Date",
                    hint: "9/29",
                  ),
                ),
                SizedBox(width: 10,),
                Expanded(
                  child: MyTextField(
                    label: "CVV",
                    hint: "123",
                  ),
                ),

              ],
            )

          ],
        ),
      ),
    );
  }
}
