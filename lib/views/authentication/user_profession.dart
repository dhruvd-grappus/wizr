import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/core/widgets/form_fields.dart';
import 'package:wizr/views/authentication/widgets/profession_card.dart';
import 'package:wizr/views/kyc/widgets/form_field.dart';

class UserProfessionPage extends StatelessWidget {
  const UserProfessionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: PrimaryButton(
          label: context.l10n.continueBtnLabel,
          onTap: () => context.pushNamed(RouteNames.kycEmployeePage),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(AssetImages.signupFlowHeader),
            SizedBox(
              width: context.screenWidth,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30.toResponsiveHeight(context)),
                    SizedBox(
                      height: 40.toResponsiveHeight(context),
                      width: context.screenWidth,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Positioned(
                            left: 16.toResponsiveWidth(context),
                            child: GestureDetector(
                              onTap: () => context.pop(),
                              child: SvgPicture.asset(
                                AssetIcons.backButton,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            AssetIcons.appLogo,
                            color: Colors.white,
                          ),
                          Positioned(
                            right: 16.toResponsiveWidth(context),
                            child: GestureDetector(
                              onTap: () =>
                                  context.goNamed(RouteNames.financePage),
                              child: SvgPicture.asset(AssetIcons.close),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.toResponsiveHeight(context)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20)
                          .copyWith(top: 12)
                          .responsive(context),
                      width: context.screenWidth,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: const ProfessionBody(),
                    ),
                    SizedBox(height: 16.toResponsiveHeight(context)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfessionBody extends StatefulWidget {
  const ProfessionBody({super.key});

  @override
  State<ProfessionBody> createState() => _ProfessionBodyState();
}

class _ProfessionBodyState extends State<ProfessionBody> {
  ProfessionType professionType = ProfessionType.unknown;
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 26.toResponsiveHeight(context)),
          Padding(
            padding: EdgeInsets.only(right: 50.toResponsiveWidth(context)),
            child: Text(
              context.l10n.bestDescribesYou,
              style: context.textTheme.headlineLarge!
                  .withColor(Colors.black)
                  .responsiveFont(context),
            ),
          ),
          SizedBox(height: 6.toResponsiveHeight(context)),
          Text(
            context.l10n.curateCourses,
            style: context.textTheme.labelMedium!
                .withColor(AppColors.greyTextColor),
          ),
          SizedBox(height: 28.toResponsiveHeight(context)),
          if (professionType == ProfessionType.student ||
              professionType == ProfessionType.unknown)
            InkWell(
              onTap: () {
                setState(() {
                  professionType = professionType == ProfessionType.student
                      ? ProfessionType.unknown
                      : ProfessionType.student;
                });
              },
              child: ProffesionCard(
                isSelected: professionType == ProfessionType.student,
                professionType: ProfessionType.student,
              ),
            ),
          if (professionType == ProfessionType.professional ||
              professionType == ProfessionType.unknown)
            InkWell(
              onTap: () {
                setState(() {
                  professionType = professionType == ProfessionType.professional
                      ? ProfessionType.unknown
                      : ProfessionType.professional;
                });
              },
              child: ProffesionCard(
                isSelected: professionType == ProfessionType.professional,
                professionType: ProfessionType.professional,
              ),
            ),
          const SizedBox(height: 20),
          if (professionType == ProfessionType.student)
            CurvedTextFormField(
              controller: nameController,
              hint: 'Enter your first name',
            ),
          if (professionType == ProfessionType.professional)
            Column(
              children: [
                CurvedDropdownField(
                  dropDownHint: Text(
                    'Highest qualification',
                    style: context.textTheme.labelMedium!
                        .withColor(AppColors.purpleText.withOpacity(0.5)),
                  ),
                ),
                const SizedBox(height: 20),
                CurvedDropdownField(
                  dropDownHint: Text(
                    'Years of work ex',
                    style: context.textTheme.labelMedium!
                        .withColor(AppColors.purpleText.withOpacity(0.5)),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}

enum ProfessionType { student, professional, unknown }
