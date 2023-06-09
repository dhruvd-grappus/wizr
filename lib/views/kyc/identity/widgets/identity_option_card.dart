import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class IdentityOptionCard extends StatelessWidget {
  const IdentityOptionCard({
    required this.title,
    required this.iconPath,
    required this.onTap,
    required this.isSelected,
    super.key,
  });
  final String title;

  final String iconPath;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 15).responsive(context),
        width: 109.toResponsiveWidth(context),
        padding: const EdgeInsets.all(12),
        height: 94.toResponsiveHeight(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 14,
              color: AppColors.black.withOpacity(0.05),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (isSelected)
                  SvgPicture.asset(AssetIcons.check)
                else
                  const SizedBox(),
                SvgPicture.asset(
                  iconPath,
                  // ignore: deprecated_member_use
                  color: isSelected ? AppColors.financeBlueLight : Colors.black,
                ),
              ],
            ),
            Expanded(child: Container()),
            Text(
              title,
              style: context.textTheme.bodySmall!
                  .responsiveFont(context)
                  .withColor(
                    isSelected
                        ? AppColors.financeBlueLight
                        : AppColors.purpleText,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
