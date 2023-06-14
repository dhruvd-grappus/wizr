import 'package:flutter/material.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/views/kyc/models/timeline_step.dart';
import 'package:wizr/views/kyc/widgets/kyc_card.dart';

class TimelineStepsWidget extends StatelessWidget {
  const TimelineStepsWidget({required this.steps, super.key});
  final List<TimelineStep> steps;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 12.toResponsiveWidth(context),
          child: Container(
            height: 103.toResponsiveHeight(context) * steps.length,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  AppColors.lightBrown.withOpacity(0.84),
                  AppColors.lightBrown.withOpacity(0.84),
                  AppColors.lightBrown,
                  Colors.white
                ],
              ),
            ),
            width: 2,
          ),
        ),
        Column(
          children: steps
              .map(
                (step) => Container(
                  margin: const EdgeInsets.only(bottom: 24).responsive(context),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: Offset(0, -14.toResponsiveHeight(context)),
                        child: Container(
                          padding: const EdgeInsets.all(9).responsive(context),
                          decoration: const BoxDecoration(
                            color: AppColors.yellow,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            step.stepNumber.toString(),
                            style: context.textTheme.headlineMedium!
                                .copyWith(fontSize: 21, fontFamily: 'Quintus')
                                .responsiveFont(context),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.toResponsiveWidth(context)),
                      Expanded(
                        child: KycCard(
                          title: step.title,
                          iconPath: '',
                          cardType: KycCardType.timeLineCard,
                          bodyText: step.subtitle,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
