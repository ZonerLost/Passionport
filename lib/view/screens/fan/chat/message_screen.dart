import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../config/constants/app_colors.dart';
import '../../../../config/constants/app_sizes.dart';
import '../../../../generated/assets.dart';
import '../../../../main.dart';
import '../../../custom/common_image_view_widget.dart';
import '../../../custom/custom_appbar.dart';
import '../../../custom/my_text_widget.dart';
import '../../../custom/my_textfeild.dart';

class ChatUiScreen extends StatefulWidget {
  ChatUiScreen({super.key,});

  @override
  State<ChatUiScreen> createState() => _ChatUiuser_moduletate();
}

class _ChatUiuser_moduletate extends State<ChatUiScreen> {
  bool isSelectedMessage = false;
  final List<Map<String, dynamic>> messages = [];
  final TextEditingController messageController = TextEditingController();

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      setState(() {
        messages.add({
          "text": messageController.text,
          "isMe": true, // Simulate sender message
        });
      });
      messageController.clear();

      // Simulate a bot reply (optional)
      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          messages.add({
            "text": "Hello! This is a Testing Reply!!",
            "isMe": false, // Simulate receiver message
          });
        });
      });
    }
  }

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
              url: dummyImage1,
              radius: 25,
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "User_name",
                  size: 13,
                  weight: FontWeight.w500,
                ),
                SizedBox(height: 5,),
                MyText(
                  text: "Nike",
                  size: 12,
                  weight: FontWeight.w400,
                  color: kGreyTxColor,
                ),
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 15,
                  offset: Offset(0, 8),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Padding(
              padding: AppSizes.HORIZONTAL,
              child: Row(
                children: [
                  CommonImageView(imagePath: "Assets.imagesChatppf", height: 50),


                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              reverse: false, // Keeps chat scrolling naturally
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: (){
                    setState(() {
                      isSelectedMessage = true;
                    });
                  },
                  child: ChatBubble(
                    message: messages[index]["text"],
                    isMe: messages[index]["isMe"],
                  ),
                );
              },
            ),
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: ShapeDecoration(
                color: kPurpleColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    color: Colors.white.withValues(alpha: 0.10),
                  ),
                ),
              ),
              child: Row(
                children: [
                  CommonImageView(svgPath: "Assets.svgAttachment"),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        //color: kPrimaryColor
                      ),
                      child: MyTextField(
                        controller: messageController,
                        hint: "Write message here",
                        marginBottom: 0,
                        suffix: Padding(
                          padding: const EdgeInsets.all(12),
                          child: CommonImageView(svgPath: "Assets.svgMicrophone"),
                        ),
                        prefix: Padding(
                          padding: const EdgeInsets.all(12),
                          child: CommonImageView(svgPath: "Assets.svgEmojiHappy"),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: CommonImageView(
                      imagePath: "Assets.imagesSendmsg",
                      height: 42,
                    ),
                    onPressed: sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  const ChatBubble({super.key, required this.message, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: isMe ? kTertiaryColor : kTertiaryColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(12),
            topRight: const Radius.circular(12),
            bottomLeft: isMe ? const Radius.circular(12) : Radius.zero,
            bottomRight: isMe ? Radius.zero : const Radius.circular(12),
          ),
          border:
          isMe
              ? null
              : Border.all(
            color: Colors.white.withOpacity(0.1), // customize as needed
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            MyText(
              text: message,
              size: 14,
              weight: FontWeight.w400,
              color: isMe ? kQuaternaryColor : kQuaternaryColor,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyText(
                  text: DateFormat.Hm().format(DateTime.now()),
                  size: 10,
                  weight: FontWeight.w400,
                  color: isMe ? kQuaternaryColor : kQuaternaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}