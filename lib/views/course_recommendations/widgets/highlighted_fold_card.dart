import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class HighlightedFoldCard extends StatelessWidget {
  const HighlightedFoldCard({
    required this.assetImage,
    required this.title,
    super.key,
  });
  final String assetImage;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 18,
          ),
          margin: const EdgeInsets.symmetric(vertical: 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: AppColors.yellow.withOpacity(0.9),
          ),
          child: Row(
            children: [
              Image.asset(
                assetImage,
                height: 52.h,
                width: 52.w,
              ),
              SizedBox(
                width: 13.toResponsiveWidth(context),
              ),
              Text(
                title,
                style: context.textTheme.headlineSmall!
                    .copyWith(fontSize: 16)
                    .responsiveFont(context),
              )
            ],
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          right: -2,
          top: 7,
          child: SvgPicture.asset(
            AssetIcons.selectedProfession,
          ),
        )
      ],
    );
  }
}
