import 'package:flutter/material.dart';
import 'package:passion_port/config/constants/app_sizes.dart';
import 'package:passion_port/view/custom/common_image_view_widget.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../generated/assets.dart';
import '../../../../main.dart';

class StoriesWidget extends StatelessWidget {
  final bool addStory;
  const StoriesWidget({Key? key, this.addStory = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        height: 130,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: AppSizes.HORIZONTAL,
          children: [
            // Add story button
            if(addStory)
            _buildAddStoryItem(),
            if(addStory)
            const SizedBox(width: 8),
            _buildStoryItem(
              dummyImage2,
              hasNewStory: true,
            ),
            const SizedBox(width: 8),

            _buildStoryItem(
              'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
              hasNewStory: true,
            ),
            const SizedBox(width: 8),

            _buildStoryItem(
              'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
              hasNewStory: true,
            ),
            const SizedBox(width: 8),

            _buildStoryItem(
              'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
              hasNewStory: true,
            ),
            const SizedBox(width: 8),

            _buildStoryItem(
              'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&crop=face',
              hasNewStory: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddStoryItem() {
    return Column(
      children: [
        Container(
          width: 100,
          height: 125,
          padding: const EdgeInsets.all(10),
          decoration: ShapeDecoration(
            color:kCBGColor,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1,
                color: kWhiteLightColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Center(
            child: Stack(
              children: [
                ClipOval(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face',
                    width: 65,
                    height: 65,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor,

                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStoryItem(String imageUrl, {required bool hasNewStory}) {
    return Container(
      width: 100,
      height: 125,
      //padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        color:kCBGColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: kWhiteLightColor,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          CommonImageView(imagePath: Assets.imagesSt,width: double.infinity,height: double.infinity,),
          Center(
            child: ClipOval(
              child: Image.network(
                imageUrl,
                width: 62,
                height: 62,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 62,
                    height: 62,
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      color: Colors.grey[600],
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

