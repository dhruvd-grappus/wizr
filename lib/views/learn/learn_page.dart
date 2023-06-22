import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wizr/core/widgets/app_header.dart';
import 'package:wizr/views/learn/controller/learn_controller.dart';
import 'package:wizr/views/learn/widgets/all_courses_list.dart';
import 'package:wizr/views/learn/widgets/course_categories.dart';
import 'package:wizr/views/learn/widgets/course_category_info.dart';
import 'package:wizr/views/learn/widgets/course_comparsion/course_comparsion_button.dart';
import 'package:wizr/views/learn/widgets/course_filters/apply_filter_button.dart';
import 'package:wizr/views/learn/widgets/top_course_recommendations.dart';

class LearnPage extends StatelessWidget {
  LearnPage({super.key});
  final LearnController learnController = Get.put(LearnController());
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        ColoredBox(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppHeader(),
              CourseCategories(),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.h),
                      const TopCourseRecommendations(),
                      SizedBox(height: 60.h),
                      const CourseCategoryInfo(),
                      SizedBox(height: 48.h),
                      const AllCoursesList(),
                      Container(height: 100.h)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(
          () {
            return AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              bottom: learnController.selectedComparisionList.isNotEmpty
                  ? 50.h
                  : 90.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const ApplyFilterButton(isSheetOpened: false),
                  CourseComparsionButton(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
