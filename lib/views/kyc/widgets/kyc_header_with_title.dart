import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class KycHeaderWithTitle extends StatelessWidget {
  const KycHeaderWithTitle({
    required this.title,
    this.progressValue = 0.3,
    super.key,
  });
  final String title;
  final double progressValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.toResponsiveHeight(context),
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            height: 190.toResponsiveHeight(context),
            width: context.screenWidth,
            child: Image.asset(
              AssetImages.kycHeaderBackgroundPng,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 32.toResponsiveHeight(context),
            child: Container(
              margin: const EdgeInsets.only(left: 16).responsive(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CustomBackButton(),
                  const SizedBox(height: 24),
                  Text(
                    title,
                    style: context.textTheme.headlineLarge?.white
                        .responsiveFont(context),
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
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetIcons.backButton,
      height: 30.toResponsiveHeight(context),
      width: 30.toResponsiveWidth(context),
    );
  }
}
