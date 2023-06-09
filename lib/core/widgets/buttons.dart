import 'package:flutter/material.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({required this.label, super.key, this.active = true});
  final String label;
  final bool active;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
          .responsive(context),
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ).responsive(context),
      decoration: BoxDecoration(
        color: active ? Colors.black : AppColors.midnightGrey,
        borderRadius: BorderRadius.circular(1000.toResponsiveHeight(context)),
        border:
            Border.all(color: active ? Colors.black : AppColors.midnightGrey),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: context.textTheme.labelLarge!.responsiveFont(context).copyWith(
              color: active ? Colors.white : AppColors.midnightGreyDark,
            ),
      ),
    );
  }
}
