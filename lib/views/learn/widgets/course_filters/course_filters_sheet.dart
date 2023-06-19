import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/widgets/rounded_bottom_sheet.dart';
import 'package:wizr/views/learn/widgets/course_filters/apply_filter_button.dart';
import 'package:wizr/views/learn/widgets/course_filters/filter_groups/filter_group.dart';

class CourseFiltersSheet extends StatelessWidget {
  const CourseFiltersSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final filterGroups = _filterGroups(context);
    return RoundedBottomSheet(
      maxSize: 0.9,
      initialSize: 0.9,
      draggable: true,
      body: Stack(
        children: [
          SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                SizedBox(height: 18.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Text(
                        context.l10n.courseFilters,
                        style: context.textTheme.headlineSmall,
                      ),
                      Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: () => context.pop(),
                          child: SvgPicture.asset(AssetIcons.closeBlack),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                Expanded(
                  child: ListView.separated(
                    itemCount: filterGroups.length,
                    separatorBuilder: (context, index) => Container(
                      height: 2,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      color: AppColors.lightGrey,
                    ),
                    itemBuilder: (context, index) {
                      return filterGroups[index];
                    },
                  ),
                ),
                SizedBox(height: 80.h),
              ],
            ),
          ),
          Positioned(
            bottom: 90.h,
            child: const ApplyFilterButton(isSheetOpened: true),
          )
        ],
      ),
    );
  }

  List<Widget> _filterGroups(BuildContext context) {
    return [
      CheckboxFilterGroup(
        title: 'COURSE LEVEL',
        isExpanded: true,
        filterValues: const [
          FilterValue(filter: 'Beginner'),
          FilterValue(filter: 'Intermediate'),
          FilterValue(filter: 'Beginner')
        ],
        onSelected: (_) {
          debugPrint('callback');
        },
      ),
      RadioFilterGroup(
        title: 'Ratings'.toUpperCase(),
        isExpanded: true,
        filterValues: const [4, 3, 2, 1]
            .map(
              (e) => FilterValue(
                filter: e,
                customWidget: (e) => Row(
                  children: [
                    Text(
                      '$e & up',
                      style: context.textTheme.bodyMedium!
                          .withColor(AppColors.purpleText),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    for (var i = 0; i < e; i++)
                      SvgPicture.asset(AssetIcons.star)
                  ],
                ),
              ),
            )
            .toList(),
        onSelected: (_) {
          debugPrint('callback');
        },
      ),
      CheckboxFilterGroup(
        title: 'DURATION',
        filterValues: const [FilterValue(filter: 'Beginner')],
        onSelected: (_) {
          debugPrint('callback');
        },
      ),
      CheckboxFilterGroup(
        title: 'SKILLS',
        filterValues: const [FilterValue(filter: 'Beginner')],
        onSelected: (_) {
          debugPrint('callback');
        },
      ),
    ];
  }
}
