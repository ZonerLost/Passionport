import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../../main.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_text_widget.dart';
import '../../fan/chat/message_screen.dart';



class BrandChatScreen extends StatelessWidget {
  const BrandChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar2(
          title: "Messages",
          actions: [
            CommonImageView(
              svgPath: Assets.svgMore,
            ),
            SizedBox(width: 15,),
          ],
        ),
        body: Column(
          children: [
            TabBar(
              labelColor: kBlack2Color,
              dividerColor: kWhiteLightColor,
              indicatorColor:kPrimaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(
                fontWeight: FontWeight.w500
              ),
              tabs: [
                Tab(text: "Fans"),
                Tab(text: "Campaign Requests"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: AppSizes.HORIZONTAL,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: (){
                             Get.to(()=>ChatUiScreen());
                          },
                          contentPadding: EdgeInsets.zero,
                          minVerticalPadding: 0,
                          visualDensity: VisualDensity.compact,
                          leading: CommonImageView(
                            height: 50,
                            width: 50,
                            url: dummyImage1,
                            radius: 25,
                          ),
                          title: MyText(
                            text: "User_name",
                            size: 13,
                            weight: FontWeight.w600,
                          ),
                          subtitle: MyText(
                            text: "Nice shirt buddy",
                            size: 12,
                            weight: FontWeight.w400,
                            color: kGreyTxColor,
                          ),
                          trailing: MyText(
                            text: "12:00 PM",
                            size: 12,
                            weight: FontWeight.w400,
                            color: kPrimaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: AppSizes.HORIZONTAL,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: (){
                             Get.to(()=>ChatUiScreen());
                          },
                          contentPadding: EdgeInsets.zero,
                          minVerticalPadding: 0,
                          visualDensity: VisualDensity.compact,
                          leading: CommonImageView(
                            height: 50,
                            width: 50,
                            url: dummyImage1,
                            radius: 25,
                          ),
                          title: MyText(
                            text: "User_name",
                            size: 13,
                            weight: FontWeight.w600,
                          ),
                          subtitle: MyText(
                            text: "Requested for campaign promotion",
                            size: 12,
                            weight: FontWeight.w400,
                            color: kGreyTxColor,
                          ),
                          trailing: MyText(
                            text: "12:00 PM",
                            size: 12,
                            weight: FontWeight.w400,
                            color: kPrimaryColor,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
