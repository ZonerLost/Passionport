import 'package:flutter/material.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_fonts.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../generated/assets.dart';
import '../../custom/common_image_view_widget.dart';
import '../../custom/custom_appbar.dart';



class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGGColor,
      appBar: CustomAppBar(
        actions: [
          GestureDetector(
            onTap: (){
              //Get.to(()=>NotificationScreen());
            },
            child: CommonImageView(
              imagePath: "Assets.imagesBell",
              height: 45,
            ),
          ),
          SizedBox(width: 10,)
        ],
    ),
    );
  }
}







