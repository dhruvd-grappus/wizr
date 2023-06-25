import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/widgets/app_header.dart';
import 'package:wizr/views/course_recommendations/choose_subject_page.dart';
import 'package:wizr/views/course_recommendations/comfort_level_page.dart';
import 'package:wizr/views/course_recommendations/pick_skill_page.dart';
import 'package:wizr/views/course_recommendations/preferred_learning_mode_page.dart';
import 'package:wizr/views/course_recommendations/spend_time_for_learning_page.dart';

class CourseRecommendationsPage extends StatefulWidget {
  const CourseRecommendationsPage({super.key});

  @override
  State<CourseRecommendationsPage> createState() =>
      _CourseRecommendationsPageState();
}

class _CourseRecommendationsPageState extends State<CourseRecommendationsPage> {
  var _currentStep = 1;
  final PageController pageController = PageController();
  Future<bool> goToPreviousPage() async {
    if (pageController.hasClients) {
      if ((pageController.page ?? 0) >= 1) {
        pageController.jumpToPage(
          0,
        );
        return false;
      } else {
        //context.pop;
        return false;
      }
    }
    //context.goNamed(RouteNames.financePage);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: goToPreviousPage,
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,body: SafeArea(
          child: Column(
            children: [
              const AppHeader(),
              StepProgressIndicator(
                totalSteps: 5,
                currentStep: _currentStep,
                size: 6.h,
                padding: 0,
                selectedColor: AppColors.yellow,
                unselectedColor: AppColors.eggShell,
                roundedEdges: const Radius.circular(10),
              ),
              SizedBox(height: 20.h),
              Expanded(
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: _onPageChanged,
                  children: [
                    ChooseSubjectPage(
                      next: goToNextPage,
                    ),
                    PickSkillPage(
                      next: goToNextPage,
                    ),
                    ComfortLevelPage(
                      next: goToNextPage,
                    ),
                    PreferredLearningModePage(
                      next: goToNextPage,
                    ),
                    const SpendTimeForLearningPage()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _onPageChanged(int currentPage) {
    setState(() {
      _currentStep = currentPage + 1;
    });
  }

  void goToNextPage() {
    pageController.animateToPage(
      _currentStep,
      duration: const Duration(milliseconds: 250),
      curve: Curves.ease,
    );
  }
}
