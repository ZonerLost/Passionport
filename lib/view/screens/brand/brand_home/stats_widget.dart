import 'package:flutter/material.dart';
import 'package:passion_port/view/custom/my_text_widget.dart';

import '../../../../config/constants/app_colors.dart';

class UserAnalyticsDashboard extends StatelessWidget {
  const UserAnalyticsDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 1.5),
              height: 40,
              width: 2,
              color: Colors.black,
            ),
            Expanded(
              flex: 40,
              child: _buildUserSection(
                title: "Regular Users",
                percentage: "53%",
                color: Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 1.5),
              height: 40,
              width: 2,
              color: kPrimaryColor,
            ),
            Expanded(
              flex: 30,
              child: _buildUserSection(
                title: "New Users",
                percentage: "33%",
                color: Colors.orange,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 1.5),
              height: 40,
              width: 2,
              color: kWhiteLightColor,
            ),
            Expanded(
              flex: 30,
              child: _buildUserSection(
                title: "Visiting Users",
                percentage: "23%",
                color: kWhiteLightColor,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 1.5),
              height: 40,
              width: 2,
              color: Colors.black,
            ),// Regular Users Lines
            Expanded(
              flex: 40,
              child: _buildLines(Colors.black, 40),
            ),
            Container(
              margin: const EdgeInsets.only(right: 1.5),
              height: 40,
              width: 2,
              color: kPrimaryColor,
            ),
            Expanded(
              flex: 30,
              child: _buildLines(Colors.orange, 30),
            ),
            Container(
              margin: const EdgeInsets.only(right: 1.5),
              height: 40,
              width: 2,
              color: kWhiteLightColor,
            ),
            Expanded(
              flex: 30,
              child: _buildLines(kWhiteLightColor, 30),
            ),
          ],
        ),
      ],
    );
  }


  Widget _buildUserSection({
    required String title,
    required String percentage,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            text: title,
            color: color,
            size: 12,
            weight: FontWeight.w600,
          ),
          const SizedBox(height: 2),
          MyText(
      text: percentage,
      color: color,
      size: 17,
      weight: FontWeight.w600,
      ),
        ],
      ),
    );
  }

  Widget _buildLines(Color color, int count) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(
        (count * 0.8).round(), // Adjust density of lines
            (index) => Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 1.5),
            child: Container(
              width: 2,
              height: 40,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

