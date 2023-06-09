import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';

class DetectLocationSheet extends StatelessWidget {
  const DetectLocationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          width: context.screenWidth,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 18)
                    .responsive(context)
                    .copyWith(left: 19),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 14,
                      color: AppColors.black.withOpacity(0.05),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(AssetIcons.mapPin),
                    const SizedBox(width: 6),
                    Text(
                      context.l10n.deviceLocationOff,
                      style: context.textTheme.bodyMedium,
                    ),
                    Expanded(child: Container()),
                    PrimaryButton(
                      label: context.l10n.turnOn,
                      height: 31.toResponsiveHeight(context),
                      width: 100.toResponsiveWidth(context),
                      customLabelStyle: context.textTheme.labelSmall!.white,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40.toResponsiveHeight(context),
              ),
              PrimaryButton(
                backgroundColor: Colors.white,
                label: context.l10n.detectViaGps,
                icon: AssetIcons.mapPin,
                customLabelStyle:
                    context.textTheme.labelLarge!.responsiveFont(context).black,
              ),
              SizedBox(
                height: 40.toResponsiveHeight(context),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 117.toResponsiveWidth(context),
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 12.toResponsiveWidth(context),
                  ),
                  Text(
                    'OR',
                    style: context.textTheme.labelLarge!
                        .responsiveFont(context)
                        .black,
                  ),
                  SizedBox(
                    width: 12.toResponsiveWidth(context),
                  ),
                  Container(
                    height: 1,
                    width: 117.toResponsiveWidth(context),
                    color: Colors.grey,
                  ),
                ],
              ),
              SizedBox(
                height: 40.toResponsiveHeight(context),
              ),
              PrimaryButton(
                icon: AssetIcons.search,
                onTap: () => context.pushNamed(RouteNames.kycManualAddressPage),
                label: context.l10n.enterLocationManually,
              ),
              SizedBox(
                height: 4.toResponsiveHeight(context),
              ),
            ],
          ),
        )
      ],
    );
  }
}
