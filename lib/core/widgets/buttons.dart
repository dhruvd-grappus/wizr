import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    super.key,
    this.active = true,
    this.height = 52,
    this.onTap,
    this.backgroundColor,
    this.icon,
    this.width,
    this.customLabelStyle,
  });
  final void Function()? onTap;
  final String label;
  final bool active;
  final Color? backgroundColor;
  final String? icon;
  final double? width;
  final double? height;
  final TextStyle? customLabelStyle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        constraints: height == null ? null : BoxConstraints(maxHeight: height!),
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
            .responsive(context),
        decoration: BoxDecoration(
          color: backgroundColor ??
              (active ? Colors.black : AppColors.midnightGrey),
          borderRadius: BorderRadius.circular(1000.toResponsiveHeight(context)),
          border:
              Border.all(color: active ? Colors.black : AppColors.midnightGrey),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Container(
                  margin: const EdgeInsets.only(right: 10).responsive(context),
                  child: SvgPicture.asset(icon!),
                )
              else
                const SizedBox(),
              Text(
                label,
                textAlign: TextAlign.center,
                style: customLabelStyle ??
                    (context.textTheme.labelLarge!
                        .responsiveFont(context)
                        .copyWith(
                          color: active
                              ? Colors.white
                              : AppColors.midnightGreyDark,
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
