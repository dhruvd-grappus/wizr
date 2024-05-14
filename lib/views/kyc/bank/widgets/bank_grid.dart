import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class BankGrid extends StatelessWidget {
  const BankGrid({required this.banks, super.key});
  final List<String> banks;
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 4,
      childAspectRatio: 72 / 98,
      mainAxisSpacing: 24.toResponsiveHeight(context),
      crossAxisSpacing: 24.toResponsiveWidth(context),
      children: banks
          .map(
            (e) => GestureDetector(
              onTap: () => context.pushNamed(RouteNames.kycUpdateBankPage),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(20).responsive(context),
                    height: 72.toResponsiveHeight(context),
                    width: 72.toResponsiveWidth(context),
                    child: SvgPicture.asset(
                      AssetIcons.bankIcon(e.toLowerCase()),
                      height: 32,
                      width: 32,
                    ),
                  ),
                  Expanded(child: Container()),
                  Text(
                    e,
                    style: context.textTheme.labelMedium!
                        .responsiveFont(context)
                        .copyWith(height: 20 / 14),
                  )
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
