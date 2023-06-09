import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({
    required this.title,
    required this.onTap,
    required this.bodyText,
    this.bodyWidget,
    this.height,
    super.key,
  });

  final String title;
  final String bodyText;
  final Widget? bodyWidget;
  final VoidCallback onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.maxFinite,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 14,
              color: AppColors.black.withOpacity(0.05),
            )
          ],
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: AddressCardContentBody(
                    title: title,
                    bodyWidget: bodyWidget,
                    bodyText: bodyText,
                  ),
                ),
              ],
            ),
            const Positioned(
              bottom: 0,
              right: 0,
              child: EditCardButton(),
            ),
          ],
        ),
      ),
    );
  }
}

class AddressCardContentBody extends StatelessWidget {
  const AddressCardContentBody({
    required this.title,
    required this.bodyWidget,
    required this.bodyText,
    super.key,
  });

  final String title;
  final Widget? bodyWidget;
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: context.textTheme.labelMedium?.black,
        ),
        SizedBox(height: 8.toResponsiveHeight(context)),
        if (bodyWidget != null)
          bodyWidget!
        else
          Text(
            bodyText,
            style: context.textTheme.bodyMedium?.opacity50,
          ),
      ],
    );
  }
}

class EditCardButton extends StatelessWidget {
  const EditCardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        height: 32,
        width: 32,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.fadeBlue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: SvgPicture.asset(
          AssetIcons.addressEdit,
        ),
      ),
    );
  }
}
