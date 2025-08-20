import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../config/constants/app_colors.dart';
import '../../config/constants/app_fonts.dart';
import '../../generated/assets.dart';
import 'common_image_view_widget.dart';
import 'my_text_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;


  const CustomAppBar({
    Key? key,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: Duration(milliseconds: 500))],
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: CommonImageView(
          svgPath: Assets.svgLogo2,
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? onBackTap;
  final Widget? child;
  final showBackButton;// 👈 Added child property

  const CustomAppBar2({
    Key? key,
    this.title,
    this.actions,
    this.onBackTap,
    this.child,
    this.showBackButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Animate(
        effects: [FadeEffect(duration: Duration(milliseconds: 500))],
        child: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          titleSpacing: 0,

          leading: showBackButton ? InkWell(
            onTap: onBackTap ?? () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: CommonImageView(
                imagePath: Assets.imagesBackButton,
              ),
            ),
          ) : null,
          title: title != null
              ? MyText(
            text: title!,
            size: 17,
            weight: FontWeight.w600,
            color: kBlack2Color,
            fontFamily: AppFonts.poppins,
          )
              : child, // 👈 Fallback to custom widget if title is null
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}



class CustomAppBar3 extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? titleWidget;
  //final VoidCallback onDrawerPressed;

  const CustomAppBar3({
    Key? key,
    this.actions,
    this.titleWidget,
    //required this.onDrawerPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: Duration(milliseconds: 500))],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: AppBar(
          centerTitle: false,
          backgroundColor: kPrimaryColor,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: "Welcome 👋",
                size: 22,
                weight: FontWeight.w700,
                fontFamily: AppFonts.poppins,
              ),
              MyText(
                text: "Hi Jhon",
                size: 16,
                weight: FontWeight.w500,
                fontFamily: AppFonts.poppins,
              ),
            ],
          ),
          actions: actions,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


class CustomAppBar3Withoutleading extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onBackTap;

  const CustomAppBar3Withoutleading({
    Key? key,
    required this.title,
    this.actions,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: Duration(milliseconds: 500))],
      child: Column(
        children: [
          AppBar(
            centerTitle: true,
            backgroundColor: kPrimaryColor,
            // leading: InkWell(
            //   onTap: onBackTap ?? () => Get.back(),
            //   child: Padding(
            //     padding: const EdgeInsets.all(16),
            //     child: CommonImageView(
            //       imagePath: Assets.imagesBackGradient,
            //       height: 20,
            //     ),
            //   ),s
            // ),
            automaticallyImplyLeading: false,
            title: MyText(
              text: title,
              size: 16,
              weight: FontWeight.w800,
            ),
            actions: actions,
          ),
          Divider(
            color: kPrimaryColor,
            thickness: 1,
            height: 0,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBar4 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onBackTap;

  const CustomAppBar4({
    Key? key,
    required this.title,
    this.actions,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: Duration(milliseconds: 500))],
      child: Column(
        children: [
          AppBar(
            centerTitle: true,
            backgroundColor: kPrimaryColor,
            leading: InkWell(
              onTap: onBackTap ?? () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CommonImageView(
                  imagePath: "Assets.imagesBackArrow",
                  height: 20,
                ),
              ),
            ),
            title: MyText(
              text: title,
              size: 16,
              weight: FontWeight.w400,
            ),
            actions: actions,
          ),
          Divider(
            color: kPrimaryColor,
            thickness: 1,
            height: 0,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBarBlack extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onBackTap;

  const CustomAppBarBlack({
    Key? key,
    required this.title,
    this.actions,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: Duration(milliseconds: 500))],
      child: Column(
        children: [
          AppBar(
            centerTitle: true,
            backgroundColor: kPrimaryColor,
            leading: InkWell(
              onTap: onBackTap ?? () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: CommonImageView(
                  imagePath: "Assets.imagesBackButtonBlack",
                  height: 20,
                ),
              ),
            ),
            title: MyText(
              text: title,
              size: 16,
              color: kPrimaryColor,
              weight: FontWeight.w600,
            ),
            actions: actions,
          ),
          Divider(
            color: kPrimaryColor,
            thickness: 1,
            height: 0,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class CustomAppBarBlack2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onBackTap;

  const CustomAppBarBlack2({
    Key? key,
    required this.title,
    this.actions,
    this.onBackTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: Duration(milliseconds: 500))],
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: InkWell(
              onTap: onBackTap ?? () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Icon(Icons.arrow_back_ios_new,size: 18,),
              ),
            ),
            title: MyText(
              text: title,
              size: 16,
              color: kPrimaryColor,
              weight: FontWeight.w500,
              fontFamily: AppFonts.poppins,
            ),
            actions: actions,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
