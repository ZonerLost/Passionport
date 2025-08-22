import 'package:flutter/material.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';
import 'package:passion_port/view/custom/custom_appbar.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';
import 'package:passion_port/view/screens/brand/brand_shop/project_graph.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../fan/home/story_widget.dart';




class BrandShopScreen extends StatelessWidget {
   BrandShopScreen({super.key});

  final List<Map<String, String>> campaigns = [
    {"title": "Views", "count": "1000","percentage":"+11.03%"},
    {"title": "Customers  ", "count": "715","percentage":"-1.15%"},
    {"title": "Orders", "count": "350","percentage":"+6.01%"},
    {"title": "Revenue", "count": "\$350","percentage":"+20.57%"},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        actions: [
          CommonImageView(
            svgPath: Assets.svgPresentionChart,
          ),
          SizedBox(width: 15,),
          CommonImageView(
            svgPath: Assets.svgBag2,
          ),
          SizedBox(width: 15,)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:AppSizes.VERTICAL,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: MyText(
                  text: "Promoters",
                  size: 14,
                  weight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              StoriesWidget(addStory: false),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 2.4,
                  ),
                  itemCount: campaigns.length,
                  itemBuilder: (context, index) {
                    final item = campaigns[index];
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: ShapeDecoration(
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: item["title"] ?? "",
                            size: 12,
                            weight: FontWeight.w400,
                            color: kQuaternaryColor,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                text: item["count"] ?? "",
                                size: 22,
                                weight: FontWeight.w600,
                                color: kQuaternaryColor,
                              ),

                                MyText(
                                  text: item["percentage"] ?? "",
                                  size: 12,
                                  weight: FontWeight.w400,
                                  color: kQuaternaryColor,
                                ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: ShapeDecoration(
                    color: kQuaternaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x16000000),
                        blurRadius: 20,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: "Projection VS Actuals",
                        size: 14,
                        weight: FontWeight.w600,
                      ),
                      ProjectionVsActualsChart()
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: AppSizes.HORIZONTAL,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: kQuaternaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x16000000),
                        blurRadius: 20,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       MyText(
                         text: "Target Sales",
                         size: 14,
                         weight: FontWeight.w600,
                       ),
                       SizedBox(height: 10,),
                       Row(
                         children: [
                           MyText(
                             text: "65%",
                             size: 22,
                             weight: FontWeight.w600,
                             color: kPrimaryColor,
                           ),
                           MyText(
                             text: " / 13,675 units",
                             size: 14,
                             weight: FontWeight.w400,
                           ),
                         ],
                       ),
                       SizedBox(height: 10,),
                       LinearProgressIndicator(
                         minHeight: 15,
                         borderRadius: BorderRadius.circular(25),
                         value: 0.5, // 50% progress, remove this for an indeterminate loader
                         backgroundColor: kPrimaryLight2Color,
                         valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                       ),
                       Padding(
                         padding: AppSizes.VERTICAL,
                         child: Divider(
                           color: kWhiteLightColor,
                         ),
                       ),
                       MyText(
                         text: "Best selling products",
                         size: 14,
                         weight: FontWeight.w600,
                       ),
                       SizedBox(height: 10,),
                       Row(
                         children: [
                           MyText(
                             text: "65%",
                             size: 22,
                             weight: FontWeight.w600,
                             color: kPrimaryColor,
                           ),
                           MyText(
                             text: " / 13,675 units",
                             size: 14,
                             weight: FontWeight.w400,
                           ),
                         ],
                       ),
                       SizedBox(height: 10,),
                       SizedBox(
                         height: 100,
                         child: ListView.builder(
                           shrinkWrap: true,
                           scrollDirection: Axis.horizontal,
                           itemCount: 5,
                           itemBuilder: (context, index) {
                           return Padding(
                             padding: const EdgeInsets.only(right: 8),
                             child: CommonImageView(
                               imagePath: Assets.imagesFeed,
                               height: 100,
                             ),
                           );
                         },
                         ),
                       ),

                     ],
                   ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
