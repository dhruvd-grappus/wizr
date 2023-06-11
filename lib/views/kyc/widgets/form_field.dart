import 'package:flutter/material.dart';
import 'package:wizr/core/theme/typography/text_styles.dart';
import 'package:wizr/core/utils/responsive_utils.dart';
import 'package:wizr/core/widgets/form_fields.dart';

class KycFormField extends StatelessWidget {
  const KycFormField({
    required this.controller,
    required this.label,
    this.dropDownHint,
    super.key,
    this.isRequired = true,
    this.isDropDown = false,
    this.textInputType = TextInputType.streetAddress,
    this.hint,
    this.prefix,
    this.focusedBorderColor,
    this.fillColor,
  });
  final TextEditingController controller;
  final String label;
  final bool isDropDown;
  final TextInputType textInputType;
  final bool isRequired;
  final String? hint;
  final Widget? prefix;
  final Color? focusedBorderColor;
  final Color? fillColor;
  final Widget? dropDownHint;
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
              if (isRequired)
                Text(
                  '*',
                  style:
                      context.textTheme.labelSmall!.copyWith(color: Colors.red),
                )
              else
                const SizedBox(),
            ],
          ),
          SizedBox(
            height: 12.toResponsiveHeight(context),
          ),
          if (isDropDown)
            CurvedDropdownField(
              dropDownHint: dropDownHint,
            )
          else
            CurvedTextFormField(
              controller: controller,
              hint: hint,
              prefix: prefix,
              fillColor: fillColor,
              focusedBorderColor: focusedBorderColor,
            ),
        ],
      ),
    );
  }
}
