import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:wizr/core/l10n/l10n.dart';
import 'package:wizr/core/theme/app_colors.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/asset_paths.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/icon_header.dart';

class DocumentUploadCard extends StatefulWidget {
  const DocumentUploadCard({
    required this.title,
    required this.onSelectedPath,
    this.isDocument = false,
    super.key,
  });
  final String title;
  final ValueChanged<String?> onSelectedPath;
  final bool isDocument;

  @override
  State<DocumentUploadCard> createState() => _DocumentUploadCardState();
}

class _DocumentUploadCardState extends State<DocumentUploadCard> {
  String selectedDocPath = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.toResponsiveHeight(context),
      width: context.screenWidth,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primaryGrey.withOpacity(0.5),
        ),
        color: AppColors.primaryGrey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: RippleAnimation(
        color: AppColors.greyTextColor.withOpacity(0.2),
        duration: const Duration(seconds: 3),
        minRadius: 45.toResponsiveHeight(context),
        repeat: true,
        ripplesCount: 6,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal:
                (widget.isDocument ? 32 : 65).toResponsiveWidth(context),
          ),
          height: 200.toResponsiveHeight(context),
          width: context.screenWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconHeader(
                containerSize: 48,
                iconSize: 30,
                iconPath: widget.isDocument
                    ? AssetIcons.documentUploadBadge
                    : AssetIcons.idUploadBadge,
                color: AppColors.primaryGrey.withOpacity(0.32),
              ),
              SizedBox(
                height: 12.toResponsiveHeight(context),
              ),
              Text(
                widget.title,
                maxLines: widget.isDocument ? 1 : null,
                textAlign: TextAlign.center,
                style: CustomTextStyles.displayLarge
                    .withColor(AppColors.midnightBlack.withOpacity(0.72))
                    .responsiveFont(context),
              ),
              if (widget.isDocument)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Column(
                    children: [
                      Text(
                        context.l10n.docUploadType,
                        textAlign: TextAlign.center,
                        style: context.textTheme.labelMedium?.withColor(
                          AppColors.midnightBlack.withOpacity(0.72),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        context.l10n.docUploadSize,
                        textAlign: TextAlign.center,
                        style: context.textTheme.labelMedium?.withColor(
                          AppColors.midnightBlack.withOpacity(0.72),
                        ),
                      ),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
