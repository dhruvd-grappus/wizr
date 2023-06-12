import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/views/authentication/user_profession.dart';

class ProffesionCard extends StatelessWidget {
  const ProffesionCard({
    required this.isSelected,
    required this.professionType,
    super.key,
  });
  final bool isSelected;
  final ProfessionType professionType;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 18,
          ),
          margin: const EdgeInsets.symmetric(vertical: 9),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: isSelected
                ? AppColors.yellow.withOpacity(0.9)
                : AppColors.midnightGreyDark.withOpacity(0.1),
          ),
          child: Row(
            children: [
              Container(
                height: 69.toResponsiveWidth(context),
                width: 69.toResponsiveWidth(context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    35.toResponsiveWidth(context),
                  ),
                  color: AppColors.midnightGreyDark,
                  image: DecorationImage(
                    image: AssetImage(
                      professionType == ProfessionType.student
                          ? AssetImages.student
                          : AssetImages.professional,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 13.toResponsiveWidth(context),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.iam,
                    style: context.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    professionType == ProfessionType.student
                        ? context.l10n.aStudent
                        : context.l10n.aProfessional,
                    style: context.textTheme.headlineSmall,
                  ),
                ],
              )
            ],
          ),
        ),
        if (isSelected)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            right: -2,
            top: 7,
            child: SvgPicture.asset(
              AssetIcons.selectedProfession,
            ),
          )
      ],
    );
  }
}
