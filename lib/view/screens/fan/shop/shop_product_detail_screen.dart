import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:passion_port/view/screens/fan/shop/shop_cart_screen.dart';
import 'package:passion_port/view/screens/fan/shop/shop_payment_screen.dart';
import 'package:passion_port/view/screens/fan/shop/shop_product_screen.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_button.dart';
import '../../../custom/my_text_widget.dart';



class ShopProductDetailScreen extends StatelessWidget {
   ShopProductDetailScreen({super.key});
  final RxInt selectedIndex = 0.obs;

  final List<Color> colors = [
    const Color(0xFFFFCC00), // Yellow
    Colors.red,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        title: "Track Suit",
        actions: [
          CommonImageView(
            svgPath: Assets.svgMore,
          ),
          SizedBox(width: 15,),

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
                Expanded(child: MyButton(onTap: (){
                  Get.to(()=>ShopPaymentScreen());
                }, buttonText: "Buy Now")),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>ShopCartScreen());
                  },
                  child: CommonImageView(
                    imagePath: Assets.imagesC2,
                    height: 50,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: AppSizes.DEFAULT,
          child: Column(
            children: [
              CommonImageView(
                imagePath: Assets.imagesP1,
                radius: 10,
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonImageView(
                    imagePath: Assets.imagesC1,
                    height: 95,
                  ),
                  CommonImageView(
                    imagePath: Assets.imagesC1,
                    height: 95,
                  ),
                  CommonImageView(
                    imagePath: Assets.imagesC1,
                    height: 95,
                  ),
                  CommonImageView(
                    imagePath: Assets.imagesC1,
                    height: 95,
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                 Expanded(
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       MyText(
                         text: "Track Suit",
                         size: 17,
                         weight: FontWeight.w600,
                       ),
                       SizedBox(height: 5,),
                       MyText(
                         text:  'Lorem ipsum dolor sit amet consectetur.',
                         size: 10,
                         weight: FontWeight.w400,
                         color: kGreyTxColor,
                       ),
                     ],
                   ),
                 ),
                  MyText(
                    text: "\$100.00",
                    size: 22,
                    weight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              GenderSelector(),
              const SizedBox(height: 15),
              Obx(() => Row(
            children: List.generate(colors.length, (index) {
              final isSelected = selectedIndex.value == index;

              return GestureDetector(
                onTap: () {
                  selectedIndex.value = index;
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.all(3),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: isSelected ? kPrimaryColor : kWhiteLightColor,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: ShapeDecoration(
                      color: colors[index],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ))


            ],
          ),
        ),
      ),
    );
  }
}




