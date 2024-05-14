part of 'course_card.dart';

class CoursePriceDetails extends StatelessWidget {
  const CoursePriceDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: context.l10n.starts,
                style: context.textTheme.bodyMedium!
                    .withColor(AppColors.purple1)
                    .responsiveFont(context),
              ),
              TextSpan(
                text: ' ₹3500/m',
                style: context.textTheme.bodyMedium!
                    .withColor(AppColors.purpleDark)
                    .responsiveFont(context),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: context.l10n.totalCost,
                style: context.textTheme.bodyMedium!
                    .responsiveFont(context)
                    .withColor(AppColors.purple1),
              ),
              TextSpan(
                text: ' ₹350000',
                style: context.textTheme.bodyMedium!
                    .withColor(AppColors.purpleDark)
                    .responsiveFont(context),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
