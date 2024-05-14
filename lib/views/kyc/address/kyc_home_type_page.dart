import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/views/kyc/constants/property_type.dart';
import 'package:wizr/views/kyc/widgets/form_field.dart';
import 'package:wizr/views/kyc/widgets/kyc_card.dart';
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';

class KycHomeTypePage extends StatelessWidget {
  KycHomeTypePage({super.key});
  final ValueNotifier<bool> isRented = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: ValueListenableBuilder(
          valueListenable: isRented,
          builder: (context, rented, __) {
            return rented
                ? Container(
                    color: Colors.white,
                    width: context.screenWidth,
                    child: PrimaryButton(
                      label: context.l10n.confirm,
                      active: false,
                      onTap: () {
                        context.pushNamed(
                          RouteNames.kycAddressSelectPage,
                        );
                      },
                    ),
                  )
                : const SizedBox();
          },
        ),
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.offWhiteBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            KycHeaderWithTitle(title: context.l10n.tellAboutHome),
            SizedBox(
              height: 28.toResponsiveHeight(context),
            ),
            ValueListenableBuilder(
              valueListenable: isRented,
              builder: (_, rented, __) {
                return rented
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16)
                            .responsive(context),
                        child: KycFormField(
                          controller: TextEditingController(),
                          label: context.l10n.monthlyRent,
                        ),
                      )
                    : Column(
                        children: PropertyType.values
                            .map(
                              (e) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16)
                                        .copyWith(bottom: 16)
                                        .responsive(context),
                                child: KycCard(
                                  title: e.title(context),
                                  height: 156.toResponsiveHeight(context),
                                  cardType: KycCardType.iconTitle,
                                  iconPath: e.icon,
                                  onTap: () {
                                    if (e == PropertyType.rented) {
                                      isRented.value = true;
                                      return;
                                    }
                                    isRented.value = false;
                                    context.pushNamed(
                                      RouteNames.kycAddressSelectPage,
                                    );
                                  },
                                  bodyText: e.description(context),
                                ),
                              ),
                            )
                            .toList(),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
