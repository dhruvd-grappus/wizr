import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wizr/views/learn/widgets/course_categories.dart';
import 'package:wizr/views/learn/widgets/course_category_info.dart';
import 'package:wizr/views/learn/widgets/top_course_recommendations.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
