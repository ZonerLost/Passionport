import 'package:flutter/material.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_fonts.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/my_text_widget.dart';



class LiveCoachingScreen extends StatelessWidget {
  const LiveCoachingScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CommonImageView(
            imagePath: "Assets.imagesHomeVideos",
            width: double.infinity,
          ),
          Positioned(
            top: 45,
              right: 20,
              left: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    text: "Live Coaching",
                    size: 22,
                    weight: FontWeight.w600,
                    color: kQuaternaryColor,
                  ),
                  GestureDetector(
                      onTap: (){
                       // Get.to(()=>NotificationScreen());
                      },
                      child: CommonImageView(imagePath: "Assets.imagesBell", height: 45)),
                ],

          ),
          ),
          Positioned(
            bottom: 25,
              right: 15,
              left: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 ListView.builder(
                   shrinkWrap: true,
                   itemCount:5,
                   itemBuilder: (context, index) {
                   return  Padding(
                     padding: const EdgeInsets.only(bottom: 5.0),
                     child: Row(
                       children: [
                         CommonImageView(
                           imagePath: "Assets.imagesProfile",
                           height: 24,
                         ),
                         SizedBox(width: 10,),
                         MyText(
                           text: "User_name",
                           size: 15,
                           weight: FontWeight.w600,
                           color: kQuaternaryColor,
                         ),
                         SizedBox(width: 5,),
                         MyText(
                           text: "Lorem ipsum dolor sit amet cons",
                           size: 12,
                           weight: FontWeight.w500,
                           color: kQuaternaryColor,
                           textOverflow: TextOverflow.ellipsis,
                         ),
                       ],
                     ),
                   );
                 },
                 ),
                 SizedBox(height: 5,),
                 Container(
                   width: double.infinity,
                   padding: const EdgeInsets.all(8),
                   decoration: ShapeDecoration(
                     color: const Color(0x33AAB7B7),
                     shape: RoundedRectangleBorder(
                       side: BorderSide(
                         width: 1,
                         color: const Color(0xFFE4E4E4),
                       ),
                       borderRadius: BorderRadius.circular(10),
                     ),
                   ),
                   child: Row(
                     children: [
                       Expanded(
                         child: TextField(
                           decoration: InputDecoration(
                             hintText: 'Enter a comment....',
                             hintStyle: TextStyle(
                               fontSize: 12,
                               fontWeight: FontWeight.w400,
                               color: kQuaternaryColor,
                             ),
                             border: InputBorder.none,
                             isDense: true, // Minimizes vertical padding
                             contentPadding: EdgeInsets.zero, // Removes internal padding
                           ),
                         ),
                       ),
                       MyText(text: "❤️ 🔥"),
                     ],
                   ),
                 )

                ],

          ),
          ),
        ],
      ),
    );
  }
}
