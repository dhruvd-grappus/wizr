// ignore_for_file: lines_longer_than_80_chars

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

class SelectLocationSheet extends StatelessWidget {
  const SelectLocationSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16)
                  .responsive(context),
              width: context.screenWidth,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text(
                          context.l10n.selectLocation,
                          style: context.textTheme.bodyMedium,
                        ),
                        Expanded(child: Container()),
                        Text(
                          context.l10n.changeLocation,
                          style: context.textTheme.bodyMedium!
                              .withColor(AppColors.financeBlueLight),
                        ),
                        SizedBox(width: 10.toResponsiveWidth(context))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.toResponsiveHeight(context),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetIcons.mapPin,
                        width: 20.toResponsiveWidth(context),
                        height: 20.toResponsiveHeight(context),
                      ),
                      SizedBox(
                        width: 8.toResponsiveWidth(context),
                      ),
                      Text(
                        '07, Lok Kalyan Marg, New Delhi',
                        style: context.textTheme.headlineSmall,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.toResponsiveHeight(context)),
                  Text(
                    'Opp.Le Merit, Windsor Pl, Connaught Place, New Delhi, Delhi 110001',
                    style: context.textTheme.bodyMedium!
                        .withColor(AppColors.midnightBlack.withOpacity(0.72)),
                  ),
                  SizedBox(
                    height: 36.toResponsiveHeight(context),
                  ),
                  PrimaryButton(
                    label: context.l10n.continueBtnLabel,
                    width: double.infinity,
                    margin: EdgeInsets.zero,
                    onTap: () =>
                        context.pushNamed(RouteNames.uploadDigitallyPage),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
