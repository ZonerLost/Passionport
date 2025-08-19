import 'package:flutter/material.dart';
import 'package:passion_port/config/constants/app_sizes.dart';

import '../../../../config/constants/app_colors.dart';
import '../../../../main.dart';

class StoriesWidget extends StatelessWidget {
  final bool addStory;
  const StoriesWidget({Key? key, this.addStory = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
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
    );
  }

  Widget _buildAddStoryItem() {
    return Column(
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kPrimaryColor,
          ),
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
      ],
    );
  }

  Widget _buildStoryItem(String imageUrl, {required bool hasNewStory}) {
    return Column(
      children: [
        Container(
          width: 68,
          height: 68,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: hasNewStory
                ? kPrimaryColor
                : null,
            border: hasNewStory
                ? null
                : Border.all(
              color: Colors.grey[300]!,
              width: 2,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
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
          ),
        ),
      ],
    );
  }
}

