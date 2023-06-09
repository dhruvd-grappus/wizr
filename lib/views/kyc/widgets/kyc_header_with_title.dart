import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class KycHeaderWithTitle extends StatelessWidget {
  const KycHeaderWithTitle({
    required this.title,
    this.progressValue = 0.3,
    super.key,
    this.onBack,
  });
  final String title;
  final double progressValue;

  final void Function()? onBack;
  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return SizedBox(
      height: 180.toResponsiveHeight(context) + statusBarHeight,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            height: 190.toResponsiveHeight(context) +
                statusBarHeight.toResponsiveHeight(context),
            width: context.screenWidth,
            child: Image.asset(
              AssetImages.kycHeaderBackgroundPng,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 28.toResponsiveHeight(context),
            child: Container(
              margin: const EdgeInsets.only(left: 16).responsive(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomBackButton(
                    onTap: () {
                      if (onBack != null) {
                        onBack!();
                        return;
                      }
                      context.pop();
                    },
                  ),
                  SizedBox(
                    height: 25.toResponsiveHeight(context),
                  ),
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: 350.toResponsiveWidth(context),
                    ),
                    child: Text(
                      title,
                      maxLines: 2,
                      style: context.textTheme.headlineLarge!
                          .responsiveFont(context),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            height: 6,
            width: context.screenWidth,
            bottom: 0,
            child: LinearProgressIndicator(
              value: progressValue,
              color: AppColors.yellow,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({required this.onTap, super.key});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        AssetIcons.backButton,
        height: 30.toResponsiveHeight(context),
        width: 30.toResponsiveWidth(context),
      ),
    );
  }
}
