import 'package:flutter/material.dart';
import 'package:wizr/typography/text_styles.dart';
import 'package:wizr/utils/responsive_utils.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({required this.label, super.key});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16)
          .responsive(context),
      padding: const EdgeInsets.symmetric(vertical: 20).responsive(context),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(1000.toResponsiveHeight(context)),
        border: Border.all(),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: context.textTheme.labelLarge,
      ),
    );
  }
}
