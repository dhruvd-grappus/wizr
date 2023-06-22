import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/widgets/app_header.dart';
import 'package:wizr/views/course_recommendations/choose_subject_page.dart';
import 'package:wizr/views/course_recommendations/pick_skill_page.dart';

class CourseRecommendationsPage extends StatefulWidget {
  const CourseRecommendationsPage({required this.child, super.key});

  final Widget child;

  @override
  State<CourseRecommendationsPage> createState() =>
      _CourseRecommendationsPageState();
}

class _CourseRecommendationsPageState extends State<CourseRecommendationsPage> {
  var _currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(),
            StepProgressIndicator(
              totalSteps: 4,
              currentStep: _currentStep,
              size: 6.h,
              padding: 0,
              selectedColor: AppColors.yellow,
              unselectedColor: AppColors.eggShell,
              roundedEdges: const Radius.circular(10),
            ),
            SizedBox(height: 20.h),
            /*Expanded(
              child: PageView(
                onPageChanged: (index) {
                  _onPageChanged(index);
                },
                children: [
                  ChooseSubjectPage(),
                  PickSkillPage(),
                  ChooseSubjectPage(),
                ],
              ),
            ),*/
            Expanded(
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
  void _onPageChanged(int currentPage) {
    setState(() {
      _currentStep = currentPage + 1;
    });
  }
}
