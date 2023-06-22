import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/views/course_recommendations/widgets/skill_card.dart';

class PickSkillPage extends StatelessWidget {
  const PickSkillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Text(
              'Pick a skill with Teaching\nand Acdemics',
              style: context.textTheme.headlineMedium?.size25,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 28.h),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 20,
                childAspectRatio: 1.36,
              ),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return SkillCard(
                  name: 'Project Management',
                  onTap: () => goToNextPage(context),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void goToNextPage(BuildContext context) {
    context.pushNamed(RouteNames.comfortLevelPage);
  }
}
