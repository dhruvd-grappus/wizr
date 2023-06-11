import 'package:flutter/material.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/form_fields.dart';

class KycFormField extends StatelessWidget {
  const KycFormField({
    required this.controller,
    required this.label,
    super.key,
    this.isDropDown = false,
    this.textInputType = TextInputType.streetAddress,
  });
  final TextEditingController controller;
  final String label;
  final bool isDropDown;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24).responsive(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: context.textTheme.labelSmall!.responsiveFont(context),
              ),
              Text(
                '*',
                style:
                    context.textTheme.labelSmall!.copyWith(color: Colors.red),
              ),
            ],
          ),
          SizedBox(
            height: 12.toResponsiveHeight(context),
          ),
          if (isDropDown)
            const CurvedDropdownField()
          else
            CurvedTextFormField(
              controller: controller,
            ),
        ],
      ),
    );
  }
}
