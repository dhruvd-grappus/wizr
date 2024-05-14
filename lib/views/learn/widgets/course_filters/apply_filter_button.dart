import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/core/widgets/rounded_bottom_sheet.dart';
import 'package:wizr/views/learn/widgets/course_filters/course_filters_sheet.dart';

class ApplyFilterButton extends StatefulWidget {
  const ApplyFilterButton({
    required this.isSheetOpened,
    super.key,
  });
  final bool isSheetOpened;
  @override
  State<ApplyFilterButton> createState() => _ApplyFilterButtonState();
}

class _ApplyFilterButtonState extends State<ApplyFilterButton> {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onTap: () {
        if (widget.isSheetOpened) {
          context.pop();
        } else {
          showRoundedBottomSheet(context, const CourseFiltersSheet());
        }
      },
      label: context.l10n.applyFilters,
      backgroundColor: widget.isSheetOpened ? AppColors.black : Colors.white,
      borderColor: AppColors.lightGrey,
      radius: 72,
      height: 47.h,
      icon: Container(
        decoration: const BoxDecoration(
          color: AppColors.purpleText,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(6),
        child: Text(
          '3',
          style: context.textTheme.labelSmall!.white.responsiveFont(context),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      margin: const EdgeInsets.symmetric(horizontal: 130),
      customLabelStyle: context.textTheme.bodyMedium!
          .withColor(widget.isSheetOpened ? AppColors.white : Colors.black),
    );
  }
}
