import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:passion_port/config/constants/app_fonts.dart';
import 'package:passion_port/main.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';
import 'package:passion_port/view/custom/my_textfeild.dart';
import 'package:passion_port/view/screens/fan/userProfile/user_profile_screen.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';




class CommentBottomSheet extends StatelessWidget {
  const CommentBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: SafeArea(
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
          ),
          child: Padding(
            padding: AppSizes.DEFAULT,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: MyText(
                    text: "Comments",
                    size: 17,
                    weight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10,),
                CommentWidget(
                  userImage: dummyImage1,
                  userName: "User_name",
                  commentText: "Best one there is 🔥",
                  likeIcon: Assets.svgHeartgrey,
                ),
                CommentWidget(
                  userImage: dummyImage1,
                  userName: "User_name",
                  commentText: "Best one there is 🔥",
                  isReply: true,
                  likeIcon: Assets.svgHeartgrey,
                ),
                CommentWidget(
                  userImage: dummyImage1,
                  userName: "User_name",
                  commentText: "Best one there is 🔥",
                  likeIcon: Assets.svgHeartgrey,
                ),
                CommentWidget(
                  userImage: dummyImage1,
                  userName: "Reply_user",
                  commentText: "I agree! 🔥", // indent for reply
                  likeIcon: Assets.svgHeartgrey,
                ),
                SizedBox(height: 10,),
                MyTextField(
                  marginBottom: 0,
                  radius: 25,
                  prefix: Padding(
                    padding: const EdgeInsets.all(8),
                    child: CommonImageView(
                      url: dummyImage1,
                      radius: 25,
                      height: 25,
                    ),
                  ),
                  suffix: Padding(
                    padding: const EdgeInsets.all(10),
                    child: CommonImageView(
                      svgPath: Assets.svgGreySend,
                    ),
                  ),
                  hint: "Write a comment.....",

                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}



class CommentWidget extends StatelessWidget {
  final String userImage;
  final String userName;
  final String commentText;
  final bool isReply;
  final VoidCallback? onLikeTap;
  final String? likeIcon; // optional

  const CommentWidget({
    Key? key,
    required this.userImage,
    required this.userName,
    required this.commentText,
    this.isReply = false,
    this.onLikeTap,
    this.likeIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: isReply ? 30.0 : 0.0, // indent for reply
        top: 5,
        bottom: 5,
      ),
      child: Row(
        children: [
          // Profile image
          GestureDetector(
            onTap: (){
              Get.to(()=>UserProfileScreen());
            },
            child: CommonImageView(
              url: userImage,
              height: 25,
              radius: 25,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: userName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const TextSpan(text: ' '),
                  TextSpan(
                    text: commentText,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
            GestureDetector(
              onTap: onLikeTap,
              child: CommonImageView(
                svgPath: Assets.svgHeartgrey,
              ),
            ),
        ],
      ),
    );
  }
}
