import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/buttons.dart';
import 'package:wizr/core/widgets/rounded_bottom_sheet.dart';

class SelfieInstructionsSheet extends StatelessWidget {
  const SelfieInstructionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedBottomSheet(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16).responsive(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.toResponsiveHeight(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.selfie,
                  style: context.textTheme.headlineSmall,
                ),
                Container(
                  padding: const EdgeInsets.all(9).responsive(context),
                  decoration: const BoxDecoration(
                    color: AppColors.yellow,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '1',
                    style: context.textTheme.headlineMedium!
                        .copyWith(fontSize: 21, fontFamily: 'Quintus')
                        .responsiveFont(context),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.toResponsiveHeight(context)),
            Text(
              context.l10n.forASelfieToGetApproved,
              style: context.textTheme.bodyMedium!
                  .withColor(AppColors.greyTextColor),
            ),
            SizedBox(height: 24.toResponsiveHeight(context)),
            Image.asset(
              AssetImages.selfieInstruction,
              width: context.screenWidth,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 24.toResponsiveHeight(context)),
            Align(
              child: Text(
                'Launching camera in...00:02',
                style: context.textTheme.bodyMedium!
                    .withColor(AppColors.midnightBlack),
              ),
            ),
            SizedBox(height: 24.toResponsiveHeight(context)),
            Align(
              child: PrimaryButton(
                label: context.l10n.continueBtnLabel,
                margin: EdgeInsets.zero,
                onTap: () async {
                  var status = await Permission.camera.status;
                  if (status.isDenied) {
                    status = await Permission.camera.request();
                    if (status.isGranted) {
                      // ignore: use_build_context_synchronously
                      context.pop();
                      return;
                    }
                  } else {
                    // ignore: use_build_context_synchronously
                    context.pop();
                    return;
                  }
                  await Fluttertoast.showToast(msg: 'Grant Camera Permission');
                },
              ),
            ),
            SizedBox(height: 12.toResponsiveHeight(context)),
          ],
        ),
      ),
    );
  }
}
