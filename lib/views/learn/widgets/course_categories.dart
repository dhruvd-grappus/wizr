import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';

class CourseCategories extends StatelessWidget {
  CourseCategories({super.key});
  final ValueNotifier<String> selectedCategory = ValueNotifier('UX Design');
  static const _categories = [
    'Design',
    'UX Design',
    'Brand Design',
    'Interface Design'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      constraints: BoxConstraints(maxHeight: 40.h),
      child: ValueListenableBuilder(
        valueListenable: selectedCategory,
        builder: (context, category, _) {
          return AnimatedList(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 14).w,
            initialItemCount: _categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index, animation) => SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: const Offset(0, 0),
              ).animate(animation),
              child: GestureDetector(
                onTap: () {
                  selectedCategory.value = _categories[index];
                },
                child: _CourseCategoryItem(
                  title: _categories[index],
                  hasDropdown: index == 0,
                  isSelected: category == _categories[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CourseCategoryItem extends StatelessWidget {
  const _CourseCategoryItem({
    required this.title,
    this.hasDropdown = false,
    this.isSelected = false,
  });
  final String title;
  final bool isSelected;
  final bool hasDropdown;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 13.w,
      ),
      margin: const EdgeInsets.only(right: 7).w,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.yellow : AppColors.purpleBackground,
        borderRadius: BorderRadius.circular(72),
      ),
      child: Center(
        child: hasDropdown
            ? Row(
                children: [
                  Text(
                    title,
                    style: context.textTheme.bodyMedium!
                        .withColor(AppColors.purpleText)
                        .responsiveFont(context),
                  ),
                  SizedBox(width: 8.w),
                  SvgPicture.asset(AssetIcons.dropDown)
                ],
              )
            : Text(
                title,
                style: context.textTheme.bodyMedium!
                    .withColor(AppColors.purpleText)
                    .responsiveFont(context),
              ),
      ),
    );
  }
}
