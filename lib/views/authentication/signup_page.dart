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
import 'package:wizr/views/kyc/widgets/form_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: const SignupButton(),
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
                      child: const SignupForm(),
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

class SignupButton extends StatelessWidget {
  const SignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 250.toResponsiveWidth(context)),
          child: RichText(
            maxLines: 2,
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '${context.l10n.byUsingWizr} ',
                  style: context.textTheme.labelSmall!
                      .withColor(AppColors.greyTextColor),
                ),
                TextSpan(
                  text: context.l10n.termsAndPrivacy,
                  style:
                      context.textTheme.labelSmall!.withColor(AppColors.black),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 16.toResponsiveHeight(context)),
        PrimaryButton(
          label: context.l10n.continueBtnLabel,
          onTap: () => context.pushNamed(RouteNames.kycEmployeePage),
        ),
      ],
    );
  }
}

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 26.toResponsiveHeight(context)),
          Text(
            context.l10n.moreAboutYou,
            style: context.textTheme.headlineLarge!
                .withColor(Colors.black)
                .responsiveFont(context),
          ),
          SizedBox(height: 18.toResponsiveHeight(context)),
          Text(
            context.l10n.sendNewsLetter,
            style: context.textTheme.labelMedium!
                .withColor(AppColors.greyTextColor),
          ),
          SizedBox(height: 28.toResponsiveHeight(context)),
          KycFormField(
            controller: TextEditingController(),
            label: context.l10n.firstName,
            isRequired: false,
            fillColor: Colors.white,
            focusedBorderColor: AppColors.purpleText.withOpacity(0.5),
            hint: context.l10n.enterFirstName,
          ),
          KycFormField(
            controller: TextEditingController(),
            label: context.l10n.lastName,
            isRequired: false,
            fillColor: Colors.white,
            focusedBorderColor: AppColors.purpleText.withOpacity(0.5),
            hint: context.l10n.andLastName,
          ),
          KycFormField(
            controller: TextEditingController(),
            label: context.l10n.emailID,
            isRequired: false,
            fillColor: Colors.white,
            focusedBorderColor: AppColors.purpleText.withOpacity(0.5),
            hint: context.l10n.emailHint,
          ),
          SizedBox(
            width: context.screenWidth - 40,
            child: Row(
              children: [
                Expanded(
                  child: KycFormField(
                    controller: TextEditingController(),
                    label: context.l10n.dob,
                    isRequired: false,
                    fillColor: Colors.white,
                    isDropDown: true,
                    focusedBorderColor: AppColors.purpleText.withOpacity(0.5),
                    dropDownHint: Text(
                      context.l10n.dobHint,
                      style: context.textTheme.labelMedium!
                          .withColor(AppColors.purpleText.withOpacity(0.5)),
                    ),
                  ),
                ),
                SizedBox(width: 10.toResponsiveWidth(context)),
                Expanded(
                  child: KycFormField(
                    controller: TextEditingController(),
                    label: context.l10n.gender,
                    isRequired: false,
                    isDropDown: true,
                    fillColor: Colors.white,
                    focusedBorderColor: AppColors.purpleText.withOpacity(0.5),
                    dropDownHint: Text(
                      context.l10n.select,
                      style: context.textTheme.labelMedium!
                          .withColor(AppColors.purpleText.withOpacity(0.5)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
