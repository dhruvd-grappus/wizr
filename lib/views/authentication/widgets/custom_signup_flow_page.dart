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
    super.key,
  });
  final Widget body;
  final Widget bottomButton;
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: (context.screenWidth / 2) -
                            28.5.toResponsiveWidth(context),
                      ),
                      SvgPicture.asset(
                        AssetIcons.appLogo,
                        color: Colors.white,
                      ),
                      Expanded(child: Container()),
                      GestureDetector(
                        onTap: () => context.goNamed(RouteNames.financePage),
                        child: SvgPicture.asset(AssetIcons.close),
                      ),
                      SizedBox(width: 16.toResponsiveWidth(context)),
                    ],
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
