import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/typography/text_styles.dart';
import '../../../core/utils/asset_paths.dart';
import '../../../core/utils/responsive_utils.dart';

class KycHeaderWithTitle extends StatelessWidget {
  const KycHeaderWithTitle({required this.title, super.key});
  final String title;
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
            bottom: 44,
            child: Container(
              margin: const EdgeInsets.only(left: 16).responsive(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  SizedBox(
                    height: 25.toResponsiveHeight(context),
                  ),
                  Text(
                    title,
                    style: context.textTheme.headlineLarge!
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
            child: const LinearProgressIndicator(
              value: 0.3,
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
