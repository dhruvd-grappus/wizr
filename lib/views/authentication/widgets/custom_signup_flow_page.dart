import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wizr/core/navigation/go_router_config.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class CustomSignupFlowPage extends StatelessWidget {
  const CustomSignupFlowPage({
    required this.body,
    required this.bottomButton,
    this.backButton = false,
    super.key,
  });
  final Widget body;
  final Widget bottomButton;
  final bool backButton;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(AssetImages.signupFlowHeader),
            SizedBox(
              width: context.screenWidth,
              child: Column(
                children: [
                  SizedBox(height: 30.toResponsiveHeight(context)),
                  SizedBox(
                    height: 40.toResponsiveHeight(context),
                    width: context.screenWidth,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        if (backButton)
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
                    child: body,
                  ),
                  Expanded(child: Container()),
                  bottomButton
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
