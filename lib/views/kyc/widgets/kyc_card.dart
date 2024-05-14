import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/icon_header.dart';

class KycCard extends StatelessWidget {
  const KycCard({
    required this.title,
    required this.iconPath,
    required this.bodyText,
    this.onTap,
    this.cardType = KycCardType.fullCard,
    this.isHalfCard = false,
    this.bodyWidget,
    this.height,
    super.key,
  });
  final KycCardType cardType;
  final String title;
  final String bodyText;
  final Widget? bodyWidget;
  final String iconPath;
  final VoidCallback? onTap;
  final bool isHalfCard;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        width: isHalfCard ? (context.screenWidth / 2) - 24 : double.maxFinite,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (cardType == KycCardType.iconTitle || isHalfCard)
              Column(
                children: [
                  IconHeader(
                    iconPath: iconPath,
                  ),
                  SizedBox(
                    height: (isHalfCard ? 16 : 12).toResponsiveHeight(context),
                  )
                ],
              ),
            if (!isHalfCard &&
                cardType != KycCardType.iconTitle &&
                cardType != KycCardType.timeLineCard)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.screenWidth - 120.toResponsiveWidth(context),
                    child: KycCardContentBody(
                      cardType: cardType,
                      iconPath: iconPath,
                      title: title,
                      isHalfCard: isHalfCard,
                      bodyWidget: bodyWidget,
                      bodyText: bodyText,
                    ),
                  ),
                  SizedBox(
                    height: 90.toResponsiveHeight(context),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconHeader(
                          iconPath: iconPath,
                        ),
                        const ForwardCardButton(),
                      ],
                    ),
                  )
                ],
              )
            else
              KycCardContentBody(
                cardType: cardType,
                iconPath: iconPath,
                title: title,
                isHalfCard: isHalfCard,
                bodyWidget: bodyWidget,
                bodyText: bodyText,
              ),
            if (isHalfCard) const ForwardCardButton(),
          ],
        ),
      ),
    );
  }
}

class KycCardContentBody extends StatelessWidget {
  const KycCardContentBody({
    required this.cardType,
    required this.iconPath,
    required this.title,
    required this.bodyWidget,
    required this.bodyText,
    required this.isHalfCard,
    super.key,
  });

  final KycCardType cardType;
  final String iconPath;
  final String title;
  final Widget? bodyWidget;
  final String bodyText;
  final bool isHalfCard;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              context.textTheme.headlineSmall!.responsiveFont(context).copyWith(
                    fontSize: cardType == KycCardType.timeLineCard ? 16 : null,
                  ),
        ),
        SizedBox(height: 8.toResponsiveHeight(context)),
        if (bodyWidget != null)
          bodyWidget!
        else
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                constraints: BoxConstraints(
                  maxWidth: (isHalfCard ? 139 : 240).toResponsiveWidth(context),
                ),
                child: Text(
                  bodyText,
                  maxLines: 3,
                  style: context.textTheme.bodyMedium?.opacity50
                      .responsiveFont(context),
                ),
              ),
              if (cardType == KycCardType.iconTitle) const ForwardCardButton(),
            ],
          ),
      ],
    );
  }
}

class ForwardCardButton extends StatelessWidget {
  const ForwardCardButton({
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
          AssetIcons.arrowRight,
        ),
      ),
    );
  }
}

enum KycCardType { fullCard, timeLineCard, iconTitle }
