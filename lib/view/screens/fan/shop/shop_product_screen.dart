import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/my_button.dart';
import 'package:passion_port/view/screens/fan/shop/shop_cart_screen.dart';
import 'package:passion_port/view/screens/fan/shop/shop_product_detail_screen.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../../main.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_text_widget.dart';



class ShopProductScreen extends StatelessWidget {
   ShopProductScreen({super.key});
  final RxInt selectedIndex = 0.obs;

  final List<String> categories = [
    "Shoes",
    "Bags",
    "Watches",
    "Clothes",
    "Accessories",
    "Shoes",
    "Bags",
    "Watches",
    "Clothes",
    "Accessories",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(
        actions: [

          CommonImageView(
            svgPath: Assets.svgMore,
          ),
          SizedBox(width: 15,),
        ],
        child: Row(
          children: [
            CommonImageView(
              height: 30,
              width: 30,
              imagePath: Assets.imagesNike,
              radius: 25,
            ),
            SizedBox(width: 10,),
            MyText(
              text: "Nike_official",
              size: 13,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: AppSizes.VERTICAL,
          child: Column(
            children: [
              SizedBox(
                height: 25,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  padding: AppSizes.HORIZONTAL,
                  itemBuilder: (context, index) {
                    return Obx(() {
                      final isSelected = selectedIndex.value == index;

                      return GestureDetector(
                        onTap: () => selectedIndex.value = index,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                          decoration: ShapeDecoration(
                            color: isSelected ? kPrimaryColor : kPrimaryLightColor,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(width: 1, color:kPrimaryColor),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              categories[index],
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: isSelected ? kQuaternaryColor : kPrimaryColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              GridView.builder(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.52, // adjust height/width ratio
                ),
                itemCount: 6, // change based on your data
                itemBuilder: (context, index) {
                  return Container(
                    width: 170,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          color: kWhiteLightColor,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(9),
                            topRight: Radius.circular(9),
                          ),
                          child: CommonImageView(
                            imagePath: Assets.imagesP1,
                            width: double.infinity,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MyText(
                                    text: "Track Suit",
                                    size: 15,
                                    weight: FontWeight.w500,
                                  ),
                                  MyText(
                                    text: "\$100.00",
                                    size: 15,
                                    weight: FontWeight.w600,
                                    color: kPrimaryColor,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              MyText(
                                text: "Lorem ipsum dolor sit amet consectetur.",
                                size: 12,
                                weight: FontWeight.w400,
                                color: kGreyTxColor,
                              ),
                              const SizedBox(height: 10),
                              GenderSelector(),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 35,
                                      child: MyButton(
                                        onTap: () {
                                          Get.to(()=>ShopProductDetailScreen());
                                        },
                                        buttonText: "Buy Now",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  GestureDetector(
                                    onTap:(){
                                      Get.to(()=>ShopCartScreen());
                                    },
                                    child: CommonImageView(
                                      imagePath: Assets.imagesC2,
                                      height: 32,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              )


            ],
          ),
        ),
      ),
    );
  }
}





class GenderSelector extends StatelessWidget {
  final RxString selectedValue = "U".obs; // default selected value

  GenderSelector({super.key});

  final List<String> options = ["U", "M", "F"];

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: options.map((value) {
          final bool isSelected = selectedValue.value == value;
          return GestureDetector(
            onTap: () => selectedValue.value = value,
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: ShapeDecoration(
                color: isSelected ? kPrimaryColor : kPrimaryLightColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? kQuaternaryColor : kPrimaryColor,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
