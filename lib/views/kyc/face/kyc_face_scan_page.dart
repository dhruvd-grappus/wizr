import 'dart:math';

import 'package:face_camera/face_camera.dart';
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
import 'package:wizr/views/kyc/widgets/kyc_header_with_title.dart';

class KycFaceScanPage extends StatelessWidget {
  KycFaceScanPage({super.key});
  final ValueNotifier<double> faceScanProgress = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SmartFaceCamera(
            onCapture: (image) {
              // TODO(*) : upload image
            },
            defaultCameraLens: CameraLens.front,
            message: '',
            showControls: false,
            autoCapture: true,
            onFaceDetected: (face) {
              faceScanProgress.value = faceScanProgress.value +
                  0.34 +
                  (Random().nextInt(200) * 0.001);
            },
          ),
          Positioned(
            top: 100.toResponsiveHeight(context),
            child: SvgPicture.asset(
              AssetImages.faceOverlay,
              height: 524.toResponsiveHeight(context),
            ),
          ),
          Positioned(
            top: 56.toResponsiveHeight(context),
            left: 16.toResponsiveWidth(context),
            child: CustomBackButton(
              onTap: () {
                // TODO(*): on tap back
              },
            ),
          ),
          Positioned(
            bottom: 0.toResponsiveHeight(context),
            width: context.screenWidth,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black,
                    Colors.black,
                    Colors.black,
                    Colors.black,
                    Colors.black.withOpacity(0.7),
                    Colors.black.withOpacity(0.2),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16)
                        .responsive(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // TODO(*): file picker
                          },
                          child: SvgPicture.asset(AssetIcons.gallery),
                        ),
                        ValueListenableBuilder(
                          valueListenable: faceScanProgress,
                          builder: (context, scanProgress, __) {
                            final scanPercentage =
                                min(100, (scanProgress * 100).ceil());
                            return scanPercentage == 100
                                ? Row(
                                    children: [
                                      SvgPicture.asset(
                                        AssetIcons.checkGreen,
                                        theme: const SvgTheme(
                                          currentColor: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        '$scanPercentage% '
                                        '${context.l10n.complete}',
                                        style: context
                                            .textTheme.bodyMedium!.white
                                            .copyWith(
                                          fontSize: 20,
                                          color: AppColors.yellow,
                                        ),
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Text(
                                        '$scanPercentage% Scanned',
                                        style:
                                            context.textTheme.bodyMedium!.white,
                                      ),
                                      SizedBox(
                                        height: 16.toResponsiveHeight(context),
                                      ),
                                      SizedBox(
                                        width: 200.toResponsiveWidth(context),
                                        child: TweenAnimationBuilder<double>(
                                          duration: const Duration(seconds: 2),
                                          curve: Curves.easeInOut,
                                          onEnd: () {
                                            debugPrint('callback');
                                          },
                                          tween: Tween<double>(
                                            begin: 0,
                                            end: scanProgress,
                                          ),
                                          builder: (context, value, _) {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: LinearProgressIndicator(
                                                value: value,
                                                color: AppColors.yellow,
                                                minHeight: 9,
                                                backgroundColor: AppColors
                                                    .purpleText
                                                    .withOpacity(0.2),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            faceScanProgress.value = 0;
                          },
                          child: SvgPicture.asset(AssetIcons.retake),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 26.toResponsiveHeight(context)),
                  PrimaryButton(
                    width: context.screenWidth - 32.toResponsiveHeight(context),
                    label: context.l10n.continueBtnLabel,
                    backgroundColor: Colors.white,
                    borderColor: Colors.white,
                    onTap: () => context.pushNamed(RouteNames.kycHomeTypePage),
                    customLabelStyle: context.textTheme.labelLarge!
                        .responsiveFont(context)
                        .black,
                  ),
                  SizedBox(height: 16.toResponsiveHeight(context)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
